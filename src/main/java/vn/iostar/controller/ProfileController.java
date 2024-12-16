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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		if (user.getAvatar() == null || user.getAvatar().trim().isEmpty()) {
			user.setAvatar("default-avatar.jpg"); // Gán avatar mặc định
			userService.updateUser(user); // Cập nhật avatar mặc định vào cơ sở dữ liệu
		}

		// Kiểm tra file avatar tồn tại
		File avatarFile = new File(uploadPath, user.getAvatar());
		if (!avatarFile.exists()) {
			user.setAvatar("default-avatar.jpg"); // Gán avatar mặc định nếu file không tồn tại
			userService.updateUser(user); // Cập nhật avatar mặc định vào cơ sở dữ liệu
		}

		// Tạo URL avatar
		String avatarUrl = user.getAvatar().equals("default-avatar.jpg") ? "/images/default-avatar.jpg"
				: "/uploads/" + user.getAvatar() + "?v=" + System.currentTimeMillis();

		model.addAttribute("user", user);
		model.addAttribute("avatarUrl", avatarUrl);
		return "profile";
	}

	@PostMapping("/profile/update")
	public String updateUserProfile(@RequestParam("fullname") String fullname, @RequestParam("email") String email,
	        @RequestParam("phone") String phone,
	        @RequestParam(value = "avatar", required = false) MultipartFile avatarFile,
	        @RequestParam(value = "oldPassword", required = false) String oldPassword,
	        @RequestParam(value = "password", required = false) String password,
	        @RequestParam(value = "confirmPassword", required = false) String confirmPassword,
	        HttpSession session, RedirectAttributes redirectAttributes) {

	    User currentUser = (User) session.getAttribute("user");
	    if (currentUser == null) {
	        redirectAttributes.addFlashAttribute("message", "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.");
	        return "redirect:/login";
	    }

	    try {
	        // Xử lý avatar mới (nếu có)
	        if (avatarFile != null && !avatarFile.isEmpty()) {
	            String fileName = System.currentTimeMillis() + "_" + avatarFile.getOriginalFilename();
	            File destination = new File(uploadPath, fileName);
	            avatarFile.transferTo(destination);
	            currentUser.setAvatar(fileName);
	        } else {
	            if (currentUser.getAvatar() == null || currentUser.getAvatar().trim().isEmpty()) {
	                currentUser.setAvatar(DEFAULT_AVATAR);
	            }
	        }

	        // Cập nhật thông tin người dùng
	        currentUser.setFullname(fullname);
	        currentUser.setEmail(email);
	        currentUser.setPhone(phone);

	        // Cập nhật mật khẩu nếu được nhập
	        if (password != null && !password.isEmpty()) {
	            if (oldPassword == null || oldPassword.isEmpty() || !oldPassword.equals(currentUser.getPassword())) {
	                redirectAttributes.addFlashAttribute("message", "Mật khẩu cũ không chính xác.");
	                return "redirect:/profile";
	            }

	            if (!password.equals(confirmPassword)) {
	                redirectAttributes.addFlashAttribute("message", "Xác nhận mật khẩu mới không khớp.");
	                return "redirect:/profile";
	            }

	            currentUser.setPassword(password);
	        }

	        userService.updateUser(currentUser);
	        session.setAttribute("user", currentUser);

	        redirectAttributes.addFlashAttribute("message", "Cập nhật hồ sơ thành công.");
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("message", "Có lỗi xảy ra khi cập nhật hồ sơ.");
	    }

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
