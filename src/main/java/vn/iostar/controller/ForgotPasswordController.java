package vn.iostar.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.iostar.entity.User;
import vn.iostar.services.EmailService;
import vn.iostar.services.UserService;

@Controller
public class ForgotPasswordController {
	@Autowired
	private UserService userService;

	@Autowired
	private EmailService emailService;

	private Map<String, String> otpStore = new HashMap<>(); // Lưu OTP tạm thời

	@GetMapping("/forgot-password")
	public String showForgotPasswordPage() {
		return "forgot-password";
	}

	@PostMapping("/process-forgot-password")
	public String processForgotPassword(@RequestParam("email") String email, Model model) {
		User user = userService.findByEmail(email);

		if (user == null) {
			model.addAttribute("error", "Email không tồn tại trong hệ thống!");
			return "forgot-password";
		}

		// Tạo OTP và lưu tạm thời
		String otp = generateOtp();
		otpStore.put(email, otp);

		// Gửi OTP qua email
		emailService.sendOtp(email, otp);

		model.addAttribute("success", "OTP đã được gửi đến email của bạn.");
		model.addAttribute("email", email);
		return "verify-reset";
	}

	@PostMapping("/process-otp-reset-password")
	public String processOtpAndResetPassword(@RequestParam("email") String email,
	        @RequestParam("otp") String otp,
	        @RequestParam("newPassword") String newPassword,
	        @RequestParam("confirmPassword") String confirmPassword, Model model) {

	    User user = userService.findByEmail(email);

	    if (user == null) {
	        model.addAttribute("error", "Email không tồn tại trong hệ thống!");
	        return "verify-reset";
	    }

	    // Xác minh OTP tự động
	    String storedOtp = otpStore.get(email);
	    if (storedOtp == null || !storedOtp.equals(otp)) {
	        model.addAttribute("error", "Mã OTP không chính xác!");
	        return "verify-reset";
	    }

	    // Kiểm tra mật khẩu mới
	    if (newPassword == null || newPassword.isEmpty() || !newPassword.equals(confirmPassword)) {
	        model.addAttribute("error", "Mật khẩu xác nhận không khớp hoặc rỗng!");
	        return "verify-reset";
	    }

	    // Cập nhật mật khẩu
	    user.setPassword(newPassword); // Không mã hóa
	    userService.updateUser(user);

	    // Xóa OTP sau khi hoàn thành
	    otpStore.remove(email);

	    model.addAttribute("success", "Đặt lại mật khẩu thành công!");
	    return "redirect:/login"; // Chuyển về trang đăng nhập
	}
	private String generateOtp() {
		int otp = 100000 + (int) (Math.random() * 900000); // Sinh mã OTP 6 chữ số
		return String.valueOf(otp);
	}


}
