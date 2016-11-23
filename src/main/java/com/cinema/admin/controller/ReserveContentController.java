package com.cinema.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.*;

@Controller
public class ReserveContentController{
	@Autowired
	AdminDAO dao;

	@RequestMapping("reservecontent.do")
	public String handlerRequest(Model model,String no,String page){
		
		ReserveListVO vo = dao.reserveContent(Integer.parseInt(no));

		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("no", no);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp","../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../adminpage/menubar.jsp");
		model.addAttribute("jsp3", "../adminpage/reservecontent.jsp");
		
		return "main/main";
		
	}

}
