package com.cinema.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutModel {
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request,Model model){
		HttpSession session=request.getSession();		
		if(session !=null){
			//历厘等 技记力芭
			session.invalidate();			
		}
		return "main.do";
	}
}
