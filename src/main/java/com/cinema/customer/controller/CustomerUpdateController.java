package com.cinema.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class CustomerUpdateController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("update.do")
	public String handlerRequest(Model model, String page, int no){
		
		CustomerVO vo=dao.customerUpdate(no);
		
		model.addAttribute("vo",vo);
		model.addAttribute("no", no);
		model.addAttribute("jsp", "../customer/update.jsp");
		
		return "main/main";
	}

}

