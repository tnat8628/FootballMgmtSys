package vn.iostar.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.iostar.entity.User;
import vn.iostar.services.UserService;

@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @Value("${upload.path}")
    private String uploadPath;

    private final String DEFAULT_AVATAR = "default-avatar.jpg";

    @GetMapping("/profile")
    public String showProfilePage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            model.addAttribute("message", "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.");
            return "redirect:/login";
        }

        // Kiểm tra avatar hợp lệ
        File avatarFile = new File(uploadPath, user.getAvatar());
        if (user.getAvatar() == null || user.getAvatar().trim().isEmpty() || !avatarFile.exists()) {
            user.setAvatar(DEFAULT_AVATAR);
        }

        // Tạo URL avatar
        String avatarUrl = user.getAvatar().equals(DEFAULT_AVATAR)
                ? "/images/" + DEFAULT_AVATAR
                : "/uploads/" + user.getAvatar() + "?v=" + System.currentTimeMillis();

        model.addAttribute("user", user);
        model.addAttribute("avatarUrl", avatarUrl);
        return "profile";
    }

    @PostMapping("/profile/update")
    public String updateUserProfile(@RequestParam("fullname") String fullname, @RequestParam("email") String email,
                                     @RequestParam("phone") String phone,
                                     @RequestParam(value = "avatar", required = false) MultipartFile avatarFile,
                                     @RequestParam(value = "password", required = false) String password,
                                     HttpSession session, Model model) {

        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            model.addAttribute("message", "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.");
            return "redirect:/login";
        }

        try {
            // Xử lý avatar mới (nếu có)
            if (avatarFile != null && !avatarFile.isEmpty()) {
                String fileName = System.currentTimeMillis() + "_" + avatarFile.getOriginalFilename();
                File destination = new File(uploadPath, fileName);
                avatarFile.transferTo(destination);
                currentUser.setAvatar(fileName);
            }

            // Cập nhật thông tin người dùng
            currentUser.setFullname(fullname);
            currentUser.setEmail(email);
            currentUser.setPhone(phone);

            // Cập nhật mật khẩu nếu được nhập
            if (password != null && !password.isEmpty()) {
                currentUser.setPassword(password); // Mã hóa mật khẩu nếu cần
            }

            userService.updateUser(currentUser);
            session.setAttribute("user", currentUser);

            model.addAttribute("message", "Cập nhật hồ sơ thành công.");
        } catch (Exception e) {
            model.addAttribute("message", "Có lỗi xảy ra khi cập nhật hồ sơ.");
        }

        model.addAttribute("user", currentUser);
        return "redirect:/profile";
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
