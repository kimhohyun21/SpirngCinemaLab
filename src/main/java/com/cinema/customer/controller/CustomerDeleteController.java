package com.cinema.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.customer.dao.*;

@Controller
public class CustomerDeleteController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("delete.do")
	public String handlerRequest(Model model, String strPage, String strNo, String subject, String content){
		try{
			int no=Integer.parseInt(strNo);
			
			//vo 껍데기를 만들어 컬럼 넣기
			CustomerVO vo = new CustomerVO();
			vo.setQcontent(content);
			vo.setQsubject(subject);
			vo.setQno(no);
			dao.customerDelete(vo);
			model.addAttribute("page", strPage);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		return "customer/delete";
	}

}
