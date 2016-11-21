package com.cinema.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.*;

@Controller
public class ReserveContentModel{
	@Autowired
	AdminDAO dao;

	@RequestMapping("reservecontent.do")
	public String handlerRequest(Model model,String no,String page){
		
		ReserveListVO vo = dao.reserveContent(Integer.parseInt(no));

		model.addAttribute("no", no);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp", "reservelist.jsp");
		model.addAttribute("jsp", "../adminpage/reservecontent.jsp");
		
		return "main/main";
		
	}

}
