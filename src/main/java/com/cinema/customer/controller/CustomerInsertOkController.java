package com.cinema.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class CustomerInsertOkController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("insert_ok.do")
	public String handlerRequest(Model model, String strno, String name, String content, String subject){		
		try {
			
			int no=Integer.parseInt(strno);
			
			//vo 껍데기에 컬럼 넣기
			CustomerVO vo = new CustomerVO();
			vo.setName(name);
			vo.setNo(no);
			vo.setQsubject(subject);
			vo.setQcontent(content);
			dao.customerInsert(vo);
		} catch (Exception e) {			
			System.out.println(e.getMessage());
		}
	
		
		return "customer/insert_ok";
	
	}
}
