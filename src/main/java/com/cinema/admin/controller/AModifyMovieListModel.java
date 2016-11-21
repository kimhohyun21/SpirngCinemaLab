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
public class AModifyMovieListModel {
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("Amodifymovielist.do")
	public String modifyMovieList(Model model,String sno){
		int no = Integer.parseInt(sno);		
		
		
		//��ȭ������ ��������
		MovieVO vo=dao.adminMovieData(no);
		
		//�⵵,��,�� �и�
		SimpleDateFormat yearF=new SimpleDateFormat("yyyy");
		SimpleDateFormat monthF=new SimpleDateFormat("MM");
		SimpleDateFormat dayF=new SimpleDateFormat("dd");
		String year = yearF.format(vo.getOpendate());
		String month = monthF.format(vo.getOpendate());
		String day = dayF.format(vo.getOpendate());
		
		// �󿵽ð� '��'����
		String runtime=vo.getRuntime().replaceAll("��", "");
		vo.setRuntime(runtime);
		
		model.addAttribute("no", no);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp", "../adminpage/menubar.jsp");
		model.addAttribute("jsp2", "../adminpage/moviemodify.jsp");
		return "main/main.jsp";
	}
}
