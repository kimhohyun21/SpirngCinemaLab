package com.cinema.admin.controller;

import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.*;

@Controller
public class ReserveListController{
	@Autowired
	AdminDAO dao;

	@RequestMapping("adminReserveList.do")
	public String qnaList(Model model,String page){
		
		if(page == null) page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		
		//�ѹ��� �ִ� ǥ���� ������ ��
		int block = 5;
		//block�� ǥ�õ� ���������� ���� block ǥ��
		int fromPage = ((curpage-1)/block*block)+1;
		int toPage = ((curpage-1)/block*block) + block;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<ReserveListVO> list = dao.reserveList(map);
		int totalpage = dao.reserveTotal();
		
		if(toPage > totalpage)
			toPage = totalpage;
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("list", list);
		model.addAttribute("page", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("jsp","../mypage/mypage.jsp");
	    model.addAttribute("jsp2", "../adminpage/menubar.jsp");
	    model.addAttribute("jsp3", "../adminpage/reservelist.jsp");
		
		return "main/main";
	}
	
}