package com.cinema.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class CustomerContentController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("content.do")
	public String handlerRequest(Model model, String page, String no){
	
		//DAO에서 정리한 쿼리문 불러오기
		CustomerVO vo = dao.customerContent(Integer.parseInt(no));
		model.addAttribute("no", no);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp", "list.jsp");
		model.addAttribute("jsp", "../customer/content.jsp");
		
		return "main/main";
		
	}
}
