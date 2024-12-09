package vn.iostar.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.validation.Valid;
import vn.iostar.entity.Category;
import vn.iostar.model.CategoryModel;
import vn.iostar.services.CategoryService;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("")
	public String all(Model model) {
		List<Category> list = categoryService.findAll();
		model.addAttribute("list", list);
		return "admin/categories/list";
	}
	
	@GetMapping("/add")
	public String add(Model model) {
		CategoryModel categoryModel = new CategoryModel();
		categoryModel.setIsEdit(false);
		model.addAttribute("category", categoryModel);
		return "admin/categories/add";
	}
	
	@PostMapping("/save")
	public ModelAndView save(ModelMap model, @Valid @ModelAttribute("category") CategoryModel categoryModel, BindingResult result) {
		if (result.hasErrors()) {
	        // Nếu có lỗi validation, quay lại trang thêm/sửa với thông báo lỗi
	        model.addAttribute("category", categoryModel);
	        return new ModelAndView("admin/categories/add");
	    }
		// Chuyển đổi dữ liệu từ CategoryModel sang Entity Category
	    Category entity = new Category();
	    
	    BeanUtils.copyProperties(categoryModel, entity);

	    categoryService.save(entity);
	    
	    String message = "";
	    if(categoryModel.getIsEdit() == true) {
	    	message = "Category updated successfully!";
	    } else {
	    	message = "Category added successfully!";
	    }
		model.addAttribute("message", message);
		return new ModelAndView("forward:/admin/categories", model);
	}
	
	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Long id) {
		Optional<Category> optCategory = categoryService.findById(id);
		CategoryModel categoryModel = new CategoryModel();
		
		//kiểm tra sự tồn tại của Category
		if(optCategory.isPresent()) {
			Category entity = optCategory.get();
			//copy từ entity sang Model
			BeanUtils.copyProperties(entity, categoryModel);
			categoryModel.setIsEdit(true);
			//đẩy dữ liệu ra view
			model.addAttribute("category", categoryModel);
			
			return new ModelAndView("admin/categories/add", model);
		}
		model.addAttribute("message", "Category does not exist!!!");
		return new ModelAndView("forward:/admin/categories", model);
	}
	
	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Long id) {
		categoryService.deleteById(id);
		model.addAttribute("message", "Category deleted successfully!");
		return new ModelAndView("forward:/admin/categories", model);
	}
}
