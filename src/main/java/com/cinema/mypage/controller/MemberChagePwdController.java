package com.cinema.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MemberChagePwdController {
	@RequestMapping("memberChangepwd.do")
	public String memberChangePwd(Model model){
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/change_pwd.jsp");
		return "main/main.jsp";
	}
	
}
