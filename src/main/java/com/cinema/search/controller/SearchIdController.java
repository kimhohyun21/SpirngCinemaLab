package com.cinema.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.member.dao.*;


@Controller
public class SearchIdController {
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("searchId.do")
	public String searchID(Model model){
		model.addAttribute("jsp", "../search/searchid.jsp");
		return "main/main";
	}
}
