package com.cinema.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class CustomerInsertController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("insert.do")
	public String handlerRequest(Model model){
		//insert.jsp의 내용을 jsp로 함축
		model.addAttribute("jsp", "../customer/insert.jsp");
		return "main/main";
	}
}