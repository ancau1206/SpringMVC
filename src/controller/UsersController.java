package controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.RecordsDAO;
import dao.UsersDAO;
@Controller

public class UsersController {
	@Autowired RecordsDAO rcd;
	@Autowired UsersDAO usd;
	
	@RequestMapping("")
	public String login() {
		return "authentication/login";
	}
	
	@RequestMapping("dashboard")
	public String get(ModelMap model) {
		model.addAttribute("records", rcd.getTop10Records());
		model.addAttribute("recentRecords", rcd.getRecentActivity());
		model.addAttribute("menu","dashboard");
		System.out.println();
		return "index";
	}
	
}
