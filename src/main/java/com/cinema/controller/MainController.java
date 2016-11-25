package com.cinema.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.dao.main.*;

@Controller
public class MainController {
	
	@Autowired
	private MainDAO dao;
	
	@RequestMapping("main.do")
	public String main(Model model){
		
		//상영 중인 영화 정보 얻어오기
		List<MainVO> plist=dao.getMovieListData();
		List<MainVO> plist2=new ArrayList<MainVO>();
		for(MainVO vo : plist){
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
			vo.setTrailer(url);
			plist2.add(vo);
		}
		
		model.addAttribute("plist2", plist2);
		model.addAttribute("jsp", "Main_Default.jsp");

		
		return "main/main";
	}
}
