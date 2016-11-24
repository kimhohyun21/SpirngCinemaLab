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
public class AModifyMovieListController {
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("Amodifymovielist.do")
	public String modifyMovieList(Model model,String no){
		//��ȭ������ ��������
		int no2=Integer.parseInt(no);
		MovieVO vo=dao.adminMovieData(no2);
		
		//�⵵,��,�� �и�
		SimpleDateFormat yearF=new SimpleDateFormat("yyyy");
		SimpleDateFormat monthF=new SimpleDateFormat("MM");
		SimpleDateFormat dayF=new SimpleDateFormat("dd");
		String year = yearF.format(vo.getOpendate());
		String month = monthF.format(vo.getOpendate());
		String day = dayF.format(vo.getOpendate());
		
		//�󿵿�����ȭ ���� ��������
		String runtime=vo.getRuntime();
		if(runtime != null){
			// �󿵽ð� '��'����
			runtime.replaceAll("��", "");
			vo.setRuntime(runtime);
		}
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("no", no2);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp","../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../adminpage/menubar.jsp");
		model.addAttribute("jsp3", "../adminpage/moviemodify.jsp");
		return "main/main";
	}
}
