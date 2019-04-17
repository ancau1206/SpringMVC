package controller;

import javax.validation.Valid;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.DepartsDAO;
import pojo.Departs;
import pojo.Staffs;
@Controller
@RequestMapping(value="departs")
public class DepartsController {
	@Autowired
	DepartsDAO dpd;

	@RequestMapping(value="",method=RequestMethod.GET)
	public String departs(ModelMap model) {
		model.addAttribute("departs", dpd.getDeparts());
		return "departs/list";
	}
	
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String getAdd(ModelMap model) {
		return "departs/add";
	}
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String add(ModelMap model, @ModelAttribute("departs") @Valid Departs d, BindingResult result) {
		if(result.hasErrors()) {
			return "departs/add";
		}
		
		if(dpd.insertDepart(d)) {
			model.addAttribute("add",true);
			model.addAttribute("departs",dpd.getDeparts());
			System.out.println("Them phong ban thanh cong");
		} else {
			System.out.println("Them phong ban that bai");
		}
		
		return "departs/list";
	}
	
	@RequestMapping(value="update",method=RequestMethod.GET)
	public String getUpdate(ModelMap model, HttpServletRequest request) {
		int id = Integer.valueOf(request.getParameter("id"));
		Departs depart = dpd.getDepart(id);
		model.addAttribute("departs", depart);
		return "departs/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("departs") @Valid Departs departs, BindingResult result) {
		if(result.hasErrors()) {
			model.addAttribute("departs", departs);
			return "departs/update";
		}
		if(dpd.saveDepart(departs)) {
			model.addAttribute("update",true);
			System.out.println("Cap nhat phong ban thanh cong");
		} else {
			System.out.println("Cap nhat phong ban that bai");
		}
		
		return "departs/update";
	}
	
	@RequestMapping(value="delete")
	public String delete(ModelMap model, HttpServletRequest request) {
		int id = Integer.valueOf(request.getParameter("id"));
		if(dpd.deledeDepart(id)) {
			model.addAttribute("departs", dpd.getDeparts());
			model.addAttribute("delete",true);
			model.remove("id");
			System.out.println("Xoa thanh cong id=" + id);
		} else {
			System.out.println("Xoa that bai");
		}
		return "departs/list";
	}
	
	@ModelAttribute("departs")
	public Departs getDeparts(Departs departs) {
		return departs;
	}
	
	@ModelAttribute("menu")
	public String getAside() {
		return "departs";
	}
	
	@ModelAttribute("newCodeId")
	public String getNewCodeId() {
		return dpd.getNewCodeId();
	}
	
}