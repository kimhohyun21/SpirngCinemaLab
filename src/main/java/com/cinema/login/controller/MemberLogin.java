package com.cinema.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogin {
	@RequestMapping("login.do") //·Î±×ÀÎ ºä·Î~
	public String login(Model model){
		model.addAttribute("jsp", "../login/login.jsp");
		
		return "main/main";
	}
}
