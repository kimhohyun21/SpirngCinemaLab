package com.cinema.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberDeleteController {
	@RequestMapping("memberDelete.do")
	public String memberDelete(Model model){
		
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/delete.jsp");
		return "main/main.jsp";
	}
}
