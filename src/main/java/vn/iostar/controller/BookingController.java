package vn.iostar.controller;

import java.math.BigDecimal;
import java.sql.Time;
import java.time.LocalTime;
import java.time.ZoneId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.iostar.entity.Field;
import vn.iostar.services.BookingService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/booking")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @GetMapping("/{fieldId}")
    public String showBookingDetails(@PathVariable int fieldId, Model model) {
        // Lấy thời gian hiện tại
        LocalTime localTime = LocalTime.now(ZoneId.systemDefault());
        Time bookingTime = Time.valueOf(localTime);

        // Lấy thông tin sân
        Field field = bookingService.getFieldDetails(fieldId);

        // Tính giá tại thời điểm hiện tại
        BigDecimal price = bookingService.getPriceAtTime(fieldId, bookingTime);

        // Đưa thông tin vào model
        model.addAttribute("field", field);
        model.addAttribute("price", price);
        model.addAttribute("bookingTime", bookingTime);

        return "bookingDetails"; // Tên file JSP hiển thị thông tin
    }
}
