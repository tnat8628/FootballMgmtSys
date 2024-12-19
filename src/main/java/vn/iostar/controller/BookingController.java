package vn.iostar.controller;

import java.lang.classfile.ClassFile.Option;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.iostar.entity.Booking;
import vn.iostar.entity.Field;
import vn.iostar.entity.PricingRule;
import vn.iostar.entity.User;
import vn.iostar.model.BookingModel;
import vn.iostar.model.FieldModel;
import vn.iostar.services.BookingService;
import vn.iostar.services.FieldService;
import vn.iostar.services.PricingRuleService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
@RequestMapping("/booking")
public class BookingController {

    @Autowired
    FieldService fieldService;

    @Autowired
    BookingService bookingService;

    @Autowired
    PricingRuleService pricingRuleService;

    @Autowired
    private HttpSession session;

    @GetMapping("/{fieldId}")
    public String showBookingPage(@PathVariable("fieldId") Integer fieldId, Model model) {
        // Lấy thông tin sân
        Optional<Field> optField = fieldService.findById(fieldId);
        FieldModel fieldModel = new FieldModel();        

        if (optField.isPresent()) {
            Field fieldEntity = optField.get();
            BeanUtils.copyProperties(fieldEntity, fieldModel);
            List<Booking> bookings = bookingService.findBookingsByField(fieldEntity);

            model.addAttribute("field", fieldModel);
            // Lấy danh sách các lịch đặt trong ngày (nếu có ngày được chọn)
            model.addAttribute("bookings", bookings);
            BookingModel newBooking = new BookingModel();
            newBooking.setField(fieldEntity);
            
            model.addAttribute("newBooking", newBooking);
        }        

        return "bookingDetails";
    }


    @PostMapping("/save")
    public ModelAndView save(ModelMap model, @Valid @ModelAttribute("newBooking") BookingModel newBooking,
                                @Valid @ModelAttribute("field") FieldModel fieldModel, BindingResult result) {
        Booking entityBooking = new Booking();
        Field fieldEntity = new Field();

        // Lấy thông tin người dùng từ session
        User currentUser = (User) session.getAttribute("user");
        
        BeanUtils.copyProperties(fieldModel, fieldEntity);

        newBooking.setField(fieldEntity);
        newBooking.setCreateAt(new Date(System.currentTimeMillis()));
        newBooking.setStatus("Pending");

        // Xử lý thời gian nhập vào (hh:mm), append ":00" to ensure correct format
        String startTimeStr = newBooking.getStartTime() + ":00";
        String endTimeStr = newBooking.getEndTime() + ":00";
        
        Time start = null;
        Time end = null;

        try {
            start = Time.valueOf(startTimeStr);
            end = Time.valueOf(endTimeStr);
            entityBooking.setStartTime(start);
            entityBooking.setEndTime(end);
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", "Invalid time format. Please use HH:mm.");
            return new ModelAndView("bookingDetails");
        }
        BigDecimal totalPrice = calculateTotalPrice(start, end, fieldEntity.getFieldId());
        entityBooking.setTotalPrice(totalPrice);  // Set calculated price

        entityBooking.setUser(currentUser);  // Gán người dùng vào entity

        BeanUtils.copyProperties(newBooking, entityBooking);
        bookingService.save(entityBooking);
        String message = "";
        message = totalPrice.toString();
        model.addAttribute("message", message);

        return new ModelAndView("redirect:/booking/" + newBooking.getField().getFieldId(), model); // Redirect để gọi lại showBookingPage 
    }


    private BigDecimal calculateTotalPrice(Time start, Time end, int fieldId) {
        // Fetch pricing rules for the field
        List<PricingRule> pricingRules = pricingRuleService.findByFieldId(fieldId);
        
        BigDecimal total = BigDecimal.ZERO;
        long currentTime = start.getTime();
        
        // Loop through the time range
        while (currentTime < end.getTime()) {
            Time currentStart = new Time(currentTime);
            
            // Find the matching pricing rule for the current time block
            PricingRule matchedRule = pricingRules.stream()
                .filter(rule -> !rule.getStartTime().after(currentStart) && rule.getEndTime().after(currentStart))
                .findFirst()
                .orElse(null);
            
            if (matchedRule != null) {
                total = total.add(matchedRule.getPricePerHour()); // Add the price for the matched rule
                currentTime += 3600000; // Move to the next hour (1 hour = 3600000 ms)
            } else {
                break;  // Exit if no rule matches the current time
            }
        }
    
        return total;
    }
}
