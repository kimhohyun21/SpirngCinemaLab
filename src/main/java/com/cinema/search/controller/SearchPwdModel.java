package com.cinema.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.member.dao.*;


@Controller
public class SearchPwdModel {
	@Autowired
	private MemberDAO dao;
	
	/*@RequestMapping("searchPwd.do")
	public String searchPwd(Model model){
		model.addAttribute("jsp", "../search/searchpwd.jsp");
		return "main/main";
	}*/
}
