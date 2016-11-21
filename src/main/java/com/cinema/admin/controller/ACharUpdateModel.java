package com.cinema.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class ACharUpdateModel {
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("AcharUpdate.do")
	public String charInsert(Model model,String no){
		
		List<MovieVO> list=dao.AcharAllData();
		List<MovieVO> actor=dao.movieCharName(Integer.parseInt(no));
		
		model.addAttribute("i",0); //카운팅용
		model.addAttribute("actor",actor);
		model.addAttribute("no",no);
		model.addAttribute("list", list);
		model.addAttribute("jsp", "../adminpage/menubar.jsp");
		model.addAttribute("jsp2", "../adminpage/charupdate.jsp");
		return "main/main";
	}
}
