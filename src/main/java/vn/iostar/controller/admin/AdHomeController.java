package vn.iostar.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.iostar.services.FieldService;
import vn.iostar.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdHomeController {
	
	@Autowired
	FieldService fieldService;
	@Autowired
	UserService userService;
	
	
	@GetMapping({"/home", "", "/"})
	public String adHome(Model model) {
		Long totalField = fieldService.count();
		Long totalUser = userService.count();		
		model.addAttribute("totalField", totalField);
		model.addAttribute("totalUser", totalUser);
		return "/admin/home";
		
	}
}
