package com.cinema.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;


@Controller
public class AMovieInsertController {
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("AmovieInsert.do")
	public String movieInsert(Model model){
		
		//메뉴 선택 구분인자
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("jsp","../mypage/mypage.jsp");
	    model.addAttribute("jsp2", "../adminpage/menubar.jsp");
	    model.addAttribute("jsp3", "../adminpage/movieInsert.jsp");
		return "main/main";
	}
}
