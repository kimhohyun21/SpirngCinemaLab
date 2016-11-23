package com.cinema.admin.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AMovieListController {
	@Autowired
	AdminDAO dao;
	
	@RequestMapping("Amovielist.do")
	public String movieList(Model model,String page){
		//���� ����Ʈ �̾ƿ���
		List<MovieVO> list=dao.adminMovieAllList();
		
		// yyyy-MM-dd 00:00:00  �޺κ� �ð� �����
		for(MovieVO vo:list){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String Date = sdf.format(vo.getOpendate());
			vo.setDate(Date);		}
		
		//������ ����
		if(page==null)page="1";
		int ipage=Integer.parseInt(page);
		int row=10;
		int start=(row*ipage)-(row);
		int end=(row*ipage)-1;
		int rowCount=dao.adminMovieCount();
		int totalPage=(rowCount/row)+1;
		int block=5;
		int fromPage=((ipage-1)/block*block)+1;
		int toPage=((ipage-1)/block*block)+block;
		if(rowCount%row==0)
			totalPage=totalPage-1;
		if(toPage>totalPage)
			toPage=totalPage;
		
		model.addAttribute("page",ipage);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("block",block);
		model.addAttribute("fromPage",fromPage);
		model.addAttribute("toPage",toPage);
		model.addAttribute("list",list);
		model.addAttribute("jsp","../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../adminpage/menubar.jsp");
		model.addAttribute("jsp3", "../adminpage/movielist.jsp");
		return "main/main";
	}
}
