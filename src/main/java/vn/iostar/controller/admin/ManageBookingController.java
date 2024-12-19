package vn.iostar.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.iostar.entity.Booking;
import vn.iostar.services.BookingService;

@Controller
@RequestMapping("admin/manage-bookings")
public class ManageBookingController {
	
	@Autowired
	BookingService bookingService;
	
	@RequestMapping
	public String all(Model model) {
		List<Booking> list = bookingService.findAll();
		
		model.addAttribute("list", list);
		
		return "admin/manage-booking";
	}
}
