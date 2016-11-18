package com.cinema.movieList.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.movieList.dao.*;

@Controller
public class MovieListController {
	
	@Autowired
	private MovieDAO dao;
/*	
	@RequestMapping("movieList.do")
	public String movieList(Model model, String type){
				
		if(type==null)
			type="1";
		int type2=Integer.parseInt(type);
		List<MovieVO> list=dao.getmovieList(type2);
		model.addAttribute("list", list);
		model.addAttribute("jsp", "../movie/movieList.jsp");
		
		return "main/main";
	}*/
}
