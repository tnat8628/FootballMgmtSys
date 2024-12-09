package vn.iostar.controller;

import java.io.File;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.iostar.entity.User;
import vn.iostar.services.UserService;
import vn.iostar.utils.Constants;

@Controller
public class ProfileController {
    @Autowired
    private UserService userService;

    @Autowired
    private ServletContext servletContext;

    private final String DEFAULT_AVATAR = "images/default-avatar.jpg"; // Đường dẫn đến avatar mặc định

    // Hiển thị trang hồ sơ
    @GetMapping("/profile")
    public String showProfilePage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Người dùng chưa đăng nhập
            return "redirect:/login";
        }
        // Set default avatar if not set
        if (user.getAvatar() == null || user.getAvatar().trim().isEmpty()) {
            user.setAvatar(DEFAULT_AVATAR);
            userService.uploadAvatar(user.getUserId(), DEFAULT_AVATAR); // Optionally update in database
        }
        request.setAttribute("user", user);
        return "profile";
    }

    // Cập nhật thông tin người dùng và mật khẩu
    @PostMapping("/profile/update")
    public String updateUserProfile(
            @RequestParam("fullname") String fullname,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam(value = "newPassword", required = false) String newPassword,
            @RequestParam(value = "confirmPassword", required = false) String confirmPassword,
            @RequestParam(value = "avatar", required = false) MultipartFile avatarFile,
            HttpServletRequest request) {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            // Người dùng chưa đăng nhập
            return "redirect:/login";
        }

        // Validate new password and confirm password
        if (newPassword != null && !newPassword.trim().isEmpty()) {
            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("message", "New password and confirm password do not match.");
                request.setAttribute("user", currentUser);
                return "profile";
            }
        }

        String oldAvatar = currentUser.getAvatar();

        // Xử lý upload avatar mới
        String fname = "";
        String uploadPath = Constants.DIR; // Đường dẫn đến thư mục upload
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            if (avatarFile != null && !avatarFile.isEmpty()) {
                String originalFilename = Paths.get(avatarFile.getOriginalFilename()).getFileName().toString();
                int index = originalFilename.lastIndexOf(".");
                String ext = originalFilename.substring(index + 1);
                fname = System.currentTimeMillis() + "." + ext; // Tạo tên file mới để tránh trùng lặp

                // Upload file
                File destination = new File(uploadDir, fname);
                avatarFile.transferTo(destination);

                // Lưu tên file vào đối tượng
                currentUser.setAvatar(fname);
            } else if (oldAvatar == null || oldAvatar.trim().isEmpty()) {
                // Giữ hình ảnh mặc định nếu không có hình mới
                currentUser.setAvatar("default-avatar.jpg");
            } else {
                // Giữ hình ảnh cũ
                currentUser.setAvatar(oldAvatar);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error uploading avatar. Using existing avatar.");
            currentUser.setAvatar(oldAvatar != null && !oldAvatar.trim().isEmpty() ? oldAvatar : "default-avatar.jpg");
        }

        // Cập nhật thông tin cho user
        currentUser.setFullname(fullname);
        currentUser.setEmail(email);
        currentUser.setPhone(phone);
        currentUser.setAvatar(fname); // Đảm bảo đường dẫn tương đối được lưu

        // Xử lý mật khẩu
        if (newPassword != null && !newPassword.trim().isEmpty()) {
            // Cập nhật mật khẩu (không mã hóa)
            currentUser.setPassword(newPassword);
        }

        // Gọi service update user
        try {
            User updatedUser = userService.updateUser(currentUser);
            session.setAttribute("user", updatedUser);
            request.setAttribute("message", "Profile updated successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error updating profile.");
        }

        request.setAttribute("user", currentUser);
        return "profile";
    }

    // Đăng xuất người dùng
    @PostMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/login";
    }
}
