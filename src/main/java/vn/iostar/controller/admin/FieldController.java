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
import vn.iostar.entity.Field;
import vn.iostar.model.CategoryModel;
import vn.iostar.model.FieldModel;
import vn.iostar.services.CategoryService;
import vn.iostar.services.FieldService;

@Controller
@RequestMapping("/admin/fields")
public class FieldController {

    @Autowired
    FieldService fieldService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping
    public String all(Model model) {
    	List<Field> list = fieldService.findAll();
    	model.addAttribute("list", list);
    	return "admin/fields/list";
    }
    
    @GetMapping("/add")
	public String add(Model model) {
		FieldModel fieldModel = new FieldModel();
		List<Category> category = categoryService.findAll();
		fieldModel.setIsEdit(false);
		model.addAttribute("field", fieldModel);
		model.addAttribute("category", category);
		return "admin/fields/add";
	}
    
    @PostMapping("/save")
    public ModelAndView save(ModelMap model, @Valid @ModelAttribute("field") FieldModel fieldModel, BindingResult result) {
    	if (result.hasErrors()) {
    		model.addAttribute("field", fieldModel);
    		return new ModelAndView("admin/fields/add");
    	}
    	
    	Field entity = new Field();
    	BeanUtils.copyProperties(fieldModel, entity);
    	
    	// Lấy Category tương ứng với categoryId đã chọn
        Optional<Category> category = categoryService.findById(fieldModel.getCategory().getCategoryId());
        category.ifPresent(entity::setCategory);
    	
    	fieldService.save(entity);
    	
    	String message = "";
    	if(fieldModel.getIsEdit() == true) {
    		message = "Field updated successfully!";
	    } else {
	    	message = "Field added successfully!";
	    }
		model.addAttribute("message", message);
		return new ModelAndView("redirect:/admin/fields", model);
    }
    
    @GetMapping("edit/{id}")
    public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) {
    	Optional<Field> optField = fieldService.findById(id);
    	FieldModel fieldModel = new FieldModel();
    	List<Category> category = categoryService.findAll();
    	model.addAttribute("category", category);
    	
    	if(optField.isPresent()) {
    		Field entity = optField.get();
    		BeanUtils.copyProperties(entity, fieldModel);
    		fieldModel.setIsEdit(true);
    		model.addAttribute("field", fieldModel);
    		
    		return new ModelAndView("admin/fields/add", model);
    	}
    	
    	//model.addAttribute("message", "Field does not exist!!!");
    	return new ModelAndView("redirect:/admin/fields", model);
    }
    
    @GetMapping("delete/{id}")
    public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
    	fieldService.deleteById(id);
    	//model.addAttribute("message", "Field deleted successfully!");
    	return new ModelAndView("redirect:/admin/fields", model);
    }
    
    
}
