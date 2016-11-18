package com.cinema.customer.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class CustomerFaqController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("faq.do")
	public String main(Model model){
		
		List<CustomerVO> list = dao.getfaqList();
		model.addAttribute("list", list);
		model.addAttribute("jsp", "../customer/faq.jsp");
		
		return "main/main";
	}
}
