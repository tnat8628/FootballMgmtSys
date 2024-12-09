package vn.iostar.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.iostar.services.FieldService;

@Controller
public class AdHomeController {
	
	@Autowired
	FieldService fieldService;
	
	@GetMapping("/admin")
	public String adHome(Model model) {
		Long totalField = fieldService.count();
				
		model.addAttribute("totalField", totalField);
		return "/admin/home";
	}
}
