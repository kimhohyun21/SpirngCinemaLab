package com.cinema.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AMovieCharUpdateController {
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("AcharUpdate.do")
	public String charInsert(Model model,String no,String type){
		
		List<MovieVO> list=dao.AcharAllData();
		List<MovieVO> actor=dao.movieCharData(Integer.parseInt(no));
		
		//출연진이 없거나 1,2명일 경우
		switch(actor.size()){
		case 0:
			actor.add(list.get(0));
		case 1:
			actor.add(list.get(0));
		case 2:
			actor.add(list.get(0));
		}
		
		//메뉴 선택 구분인자
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("i",0); //카운팅용
		model.addAttribute("actor",actor);
		model.addAttribute("no",no);
		model.addAttribute("type",type);
		model.addAttribute("list", list);
		model.addAttribute("jsp","../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../adminpage/menubar.jsp");
		model.addAttribute("jsp3", "../adminpage/charupdate.jsp");
		return "main/main";
	}
}
