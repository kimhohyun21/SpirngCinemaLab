package com.cinema.customer.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.customer.dao.*;

@Controller
public class CustomerListController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("customer.do")
	public String qnaList(Model model, String page, Map map){
		
		if(page == null) page = "1";
		int curpage = Integer.parseInt(page);
		//한 페이지에 출력할 컨텐츠 수
		int rowSize = 10;
		int start = (curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		
		map.put("start", start);		
		map.put("end", end);
		
		List<CustomerVO> list = dao.getcustomerList(map);
		int totalpage = dao.customerTotal();
		
		model.addAttribute("list", list);
		model.addAttribute("page", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("jsp", "../customer/list.jsp");
		
		return "main/main";
	}
	
}