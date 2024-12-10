package vn.iostar.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.iostar.entity.User;
import vn.iostar.services.UserService;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register"; // trả về trang register
    }

    // Xử lý đăng ký
    @PostMapping("/register")
    public String processRegister(@RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  @RequestParam("confirm-password") String confirmPassword,
                                  @RequestParam("email") String email,
                                  @RequestParam("fullname") String fullname,
                                  @RequestParam("phone") String phone,
                                  Model model) {

        // Kiểm tra xem mật khẩu và xác nhận mật khẩu có khớp nhau không
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Mật khẩu và xác nhận mật khẩu không khớp.");
            return "register"; // Quay lại trang đăng ký với thông báo lỗi
        }

        // Kiểm tra xem email đã tồn tại hay chưa
        if (userService.findByEmail(email) != null) {
            model.addAttribute("error", "Email đã tồn tại.");
            return "register"; // Quay lại trang đăng ký với thông báo lỗi
        }

        // Kiểm tra xem username đã tồn tại hay chưa
        if (userService.findByUsername(username) != null) {
            model.addAttribute("error", "Tên đăng nhập đã tồn tại.");
            return "register"; // Quay lại trang đăng ký với thông báo lỗi
        }

        // Kiểm tra xem số điện thoại đã tồn tại hay chưa
        if (userService.findByPhone(phone) != null) {
            model.addAttribute("error", "Số điện thoại đã tồn tại.");
            return "register"; // Quay lại trang đăng ký với thông báo lỗi
        }

        // Tạo người dùng mới
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setFullname(fullname);
        newUser.setPhone(phone);
        // Gán thời gian hiện tại cho createDate
        newUser.setCreateDate(new Date(System.currentTimeMillis()));
        
     // Gán avatar mặc định nếu chưa có
        if (newUser.getAvatar() == null || newUser.getAvatar().trim().isEmpty()) {
            newUser.setAvatar("default-avatar.jpg");
        }
        
        userService.save(newUser);

        // Đăng ký người dùng
        boolean isSuccess = userService.register(newUser);

        if (isSuccess) {
            // Đăng ký thành công, chuyển hướng đến trang chờ
            return "redirect:/login";
        } else {
            // Đăng ký không thành công, thêm thông báo lỗi vào model
            model.addAttribute("error", "Đăng ký không thành công. Vui lòng thử lại sau.");
            return "register"; // Quay lại trang đăng ký với thông báo lỗi
        }
    }
}