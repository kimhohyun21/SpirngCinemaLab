package com.cinema.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class CustomerReplyController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("reply.do")
	public String handlerRequest(Model model, String no, String page){

		//no,page°ª ÀúÀå
		model.addAttribute("page", page);
		model.addAttribute("no", no);
		model.addAttribute("jsp", "../customer/reply.jsp");
		
		return "main/main";
	}
}
