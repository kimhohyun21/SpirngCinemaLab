package com.cinema.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberJoinModel {
	
	@RequestMapping("join.do") //ȸ������ ���~
	public String join(Model model){
		
		model.addAttribute("jsp", "../join/memberjoin.jsp");		
		return "main/main.jsp";
	}
}
