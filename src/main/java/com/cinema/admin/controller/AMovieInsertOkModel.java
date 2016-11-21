package com.cinema.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AMovieInsertOkModel {
	@Autowired
	AdminDAO dao;
	
	@RequestMapping("AmovieInsert_ok.do")
	public String movieInsert_ok(Model model,String title,String poster,String grade,
			String stype,String runtime, String year, String month, String day, String content,
			String director, String genre, String cast, String trailer) {
		try {
			//model.setCharacterEncoding("UTF-8");
			
			// opendate만들기
			String sopendate = year + "-" + month + "-" + day + " 00:00:00";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date opendate = sdf.parse(sopendate);
			
			

			// 저장
			MovieVO vo = new MovieVO();			
			vo.setTitle(title);
			vo.setPoster(poster);
			vo.setGrade(grade);
			vo.setType(Integer.parseInt(stype));
			vo.setRuntime(runtime + "분");
			vo.setContent(content);
			vo.setDirector(director);
			vo.setGenre(genre);
			vo.setCast(cast);
			vo.setTrailer(trailer);
			vo.setOpendate(opendate);
			
			dao.adminMovieInsert(vo);
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return "adminpage/station.jsp";
	}
}
