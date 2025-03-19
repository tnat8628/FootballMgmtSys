package vn.iostar.controller;

import java.sql.Date;
import java.util.regex.Pattern;

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

        // Kiểm tra chính sách mật khẩu
        String passwordValidationMessage = isStrongPassword(password, username);
        if (passwordValidationMessage != null) {
            model.addAttribute("error", passwordValidationMessage);
            return "register";
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

    private String isStrongPassword(String password, String identifier) {
        // Kiểm tra độ dài tối thiểu
        if (password.length() < 12) {
            return "Mật khẩu phải có ít nhất 12 ký tự.";
        }

        // Kiểm tra ít nhất hai nhóm ký tự (chữ hoa, chữ thường, số, ký tự đặc biệt)
        int count = 0;
        if (Pattern.compile("[A-Z]").matcher(password).find()) count++;
        if (Pattern.compile("[a-z]").matcher(password).find()) count++;
        if (Pattern.compile("\\d").matcher(password).find()) count++;
        if (Pattern.compile("[!@#$%^&*(),.?\":{}|<>]").matcher(password).find()) count++;
        if (count < 2) {
            return "Mật khẩu phải chứa ít nhất hai nhóm ký tự: chữ hoa, chữ thường, số hoặc ký tự đặc biệt.";
        }

        // Kiểm tra từ phổ biến
        String[] commonWords = {"password", "admin", "123456", "qwerty"};
        for (String word : commonWords) {
            if (password.toLowerCase().contains(word)) {
                return "Mật khẩu không được chứa từ phổ biến trong từ điển.";
            }
        }

        // Kiểm tra định danh không xuất hiện trong mật khẩu
        if (password.toLowerCase().contains(identifier.toLowerCase())) {
            return "Mật khẩu không được chứa định danh của bạn.";
        }

        return null; // Mật khẩu hợp lệ
    }
}