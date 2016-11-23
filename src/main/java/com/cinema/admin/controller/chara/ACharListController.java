package com.cinema.admin.controller.chara;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class ACharListController {
	@Autowired
	AdminDAO dao;

	@RequestMapping("ACList.do")
	public String charList(Model model, String page) {

		//해당배우 정보
		List<MovieVO> list = dao.AcharAllData();
		
		// 페이지 재료들
		if (page == null)
			page = "1";
		int ipage = Integer.parseInt(page);
		int row = 10;
		int start = (row * ipage) - (row);
		int end = (row * ipage) - 1;
		int rowCount = dao.ACharCount();
		int totalPage = (rowCount / row) + 1;
		int block = 5;
		int fromPage = ((ipage - 1) / block * block) + 1;
		int toPage = ((ipage - 1) / block * block) + block;
		if (rowCount % row == 0)
			totalPage = totalPage - 1;
		if (toPage > totalPage)
			toPage = totalPage;
		
		model.addAttribute("page", ipage);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("list", list);
		model.addAttribute("jsp", "../adminpage/menubar.jsp");
		model.addAttribute("jsp2", "../adminpage/char/charlist.jsp");
		return "main/main";
	}
}
