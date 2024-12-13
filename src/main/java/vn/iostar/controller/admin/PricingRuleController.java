package vn.iostar.controller.admin;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.validation.Valid;
import vn.iostar.entity.Field;
import vn.iostar.entity.PricingRule;
import vn.iostar.model.PricingRuleModel;
import vn.iostar.services.FieldService;
import vn.iostar.services.PricingRuleService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;




@Controller
@RequestMapping("/admin/pricingrule")
public class PricingRuleController {

    @Autowired
    PricingRuleService pricingRuleService;

    @Autowired
    FieldService fieldService;

    @RequestMapping
    public String all(Model model) {
        List<PricingRule> list = pricingRuleService.findAll();
        model.addAttribute("list", list);
        return "admin/pricingrule/list";
    }
    
    @GetMapping("/add")
    public String add(Model model) {
        PricingRuleModel pricingRuleModel = new PricingRuleModel();
        List<Field> field = fieldService.findAll();
        pricingRuleModel.setIsEdit(false);
        model.addAttribute("pricingRule", pricingRuleModel);
        model.addAttribute("field", field);
        return "admin/pricingrule/add";
    }
    
    @PostMapping("/save")
    public ModelAndView save(
            ModelMap model,
            @Valid @ModelAttribute("pricingRule") PricingRuleModel pricingRuleModel,
            BindingResult result) {

        PricingRule entity = new PricingRule();

        // Chuyển đổi String thành Time
        Time startTime = pricingRuleModel.convertStringToTime(pricingRuleModel.getStartTime());
        Time endTime = pricingRuleModel.convertStringToTime(pricingRuleModel.getEndTime());

        // Gán giá trị cho entity
        entity.setStartTime(startTime);
        entity.setEndTime(endTime);
        
        BeanUtils.copyProperties(pricingRuleModel, entity);

        // Lấy Field tương ứng với FieldId đã chọn
        Optional<Field> field = fieldService.findById(pricingRuleModel.getField().getFieldId());
        field.ifPresent(entity::setField);

        // Lưu entity vào database
        pricingRuleService.save(entity);

        // Tạo thông báo
        String message = "";
        if(pricingRuleModel.getIsEdit() == true) {
                message = "Pricing rule updated successfully!";
        } else {
                message = "Pricing rule added successfully!";
        }
        model.addAttribute("message", message);
        return new ModelAndView("redirect:/admin/pricingrule", model);
    }

    @GetMapping("/edit/{id}")
    public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) {
        Optional<PricingRule> optPricingRule = pricingRuleService.findById(id);
        PricingRuleModel pricingRuleModel = new PricingRuleModel();
        List<Field> field = fieldService.findAll();
        model.addAttribute("field", field);

        if(optPricingRule.isPresent()) {
            PricingRule entity = optPricingRule.get();
            BeanUtils.copyProperties(entity, pricingRuleModel);
            pricingRuleModel.setIsEdit(true);

            return new ModelAndView("admin/pricingrule/add", model);
        }

        return new ModelAndView("redirect:/admin/pricingrule", model);
    }
    
    @GetMapping("delete/{id}")
    public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
    	pricingRuleService.deleteById(id);
    	//model.addAttribute("message", "Field deleted successfully!");
    	return new ModelAndView("redirect:/admin/pricingrule", model);
    }
}
