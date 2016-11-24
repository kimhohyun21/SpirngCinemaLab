package com.cinema.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class CustomerUpdateOkController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("update_ok.do")
	public String handlerRequest(Model model, String content, String subject, int no, String page){
		
		CustomerVO vo = new CustomerVO();
		vo.setQcontent(content);
		vo.setQsubject(subject);
		vo.setQno(no);
		
		dao.customerUpdate_ok(vo);
		
		model.addAttribute("page", page);
		
		return "customer/update_ok";
	}

}
