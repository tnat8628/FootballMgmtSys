package vn.iostar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iostar.entity.User;
import vn.iostar.services.UserService;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@GetMapping("/login")
	public String showLoginPage() {
		return "login"; // tra ve trang login
	}

	// xư ly dang nhap
	@PostMapping("/login")
	public String processLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam(value = "remember-me", required = false) String rememberMe, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		// Xác thực người dùng
		User user = userService.authenticate(username, password);

		if (user != null) {
			// dang nhap thanh cong, luu tai khoan vao session
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			if ("on".equals(rememberMe)) {
				Cookie cookie = new Cookie("rememberMe", user.getUsername());
				cookie.setMaxAge(10 * 60);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			if (user.isRole()) {
				return "admin/home";
			} else {
				return "home";
			}
		} else {

			model.addAttribute("error", "Tên người dùng hoặc mật khẩu không đúng.");
			return "login"; // Quay lại trang đăng nhập với thông báo lỗi
		}
	}

	// Logout
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		// Xóa session
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		// Xóa cookie "rememberMe"
		Cookie cookie = new Cookie("rememberMe", null);
		cookie.setMaxAge(0); // Xóa cookie
		cookie.setPath("/");
		response.addCookie(cookie);

		return "redirect:/login";
	}
}
