package vn.iostar.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.iostar.entity.User;
import vn.iostar.services.UserService;

@Controller
@RequestMapping("admin/manage-users")
public class ManageUserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping
	public String all(Model model) {
		List<User> list = userService.findAll();
		
		model.addAttribute("list", list);
		
		return "admin/manage-users";
	}
}
