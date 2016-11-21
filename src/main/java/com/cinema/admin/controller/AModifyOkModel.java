package com.cinema.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AModifyOkModel {
	@RequestMapping("Amodify_Ok.do")
	public String modifyOk(Model model, String sno, String title, String poster,
			String grade, String type, String runtime, String year, String month, String day,
			String content, String director, String genre, String cast, String trailer) {
		try {
			//request.setCharacterEncoding("EUC-KR");
			int no=Integer.parseInt(sno);
			System.out.println(no+"   1");
						
			// opendate만들기
			String sopendate = year + "-" + month + "-" + day + " 00:00:00";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date opendate = sdf.parse(sopendate);
			
			// 저장
			MovieVO vo=new MovieVO();
			vo.setmNo(no);
			vo.setTitle(title);
			vo.setPoster(poster);
			vo.setGrade(grade);
			vo.setType(Integer.parseInt(type));
			vo.setRuntime(runtime+"분");
			vo.setContent(content);
			vo.setDirector(director);
			vo.setGenre(genre);
			vo.setCast(cast);
			vo.setTrailer(trailer);
			vo.setOpendate(opendate);			
			AdminDAO.adminMovieModify(vo);			
			
			model.addAttribute("no", no);
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		
			
		return "adminpage/station.jsp";
	}
}

