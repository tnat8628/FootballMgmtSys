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

        // Kiểm tra và xử lý mật khẩu mới
        if (newPassword != null && !newPassword.trim().isEmpty()) {
            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("message", "New password and confirm password do not match.");
                request.setAttribute("user", currentUser);
                return "profile";
            }
            currentUser.setPassword(newPassword); // Giả định mật khẩu chưa mã hóa, mã hóa nếu cần
        }

        // Xử lý avatar upload
        String oldAvatar = currentUser.getAvatar();
        String avatarFilename = handleAvatarUpload(avatarFile, oldAvatar);

        // Cập nhật thông tin người dùng
        currentUser.setFullname(fullname);
        currentUser.setEmail(email);
        currentUser.setPhone(phone);
        currentUser.setAvatar(avatarFilename);

        try {
            // Lưu thông tin người dùng
            User updatedUser = userService.updateUser(currentUser);
            session.setAttribute("user", updatedUser);
            request.setAttribute("message", "Profile updated successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error updating profile.");
        }

        request.setAttribute("user", currentUser);
        return "profile"; // Trả về view profile.jsp
    }

    private String handleAvatarUpload(MultipartFile avatarFile, String oldAvatar) {
        final String uploadPath = "E:\\upload"; // Đường dẫn lưu file
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        try {
            if (avatarFile != null && !avatarFile.isEmpty()) {
                String originalFilename = Paths.get(avatarFile.getOriginalFilename()).getFileName().toString();
                String fileExtension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
                String newFileName = System.currentTimeMillis() + "." + fileExtension;

                File destinationFile = new File(uploadDir, newFileName);
                avatarFile.transferTo(destinationFile);

                return newFileName;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Trả về avatar cũ hoặc avatar mặc định nếu có lỗi
        return (oldAvatar != null && !oldAvatar.isEmpty()) ? oldAvatar : "default-avatar.jpg";
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
