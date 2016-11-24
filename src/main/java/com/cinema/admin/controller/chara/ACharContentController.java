package com.cinema.admin.controller.chara;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class ACharContentController {
	@Autowired
	AdminDAO dao;

	@RequestMapping("ACContent.do")
	public String charContent(Model model, String cno) {
		//해당 캐릭터 정보
		MovieVO vo = dao.AcharContent(Integer.parseInt(cno));
		
		//영화제목들
		List<MovieVO> mList = dao.AmovieAllData();
		
		model.addAttribute("mList",mList);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp","../mypage/mypage.jsp");
	    model.addAttribute("jsp2", "../adminpage/menubar.jsp");
	    model.addAttribute("jsp3", "../adminpage/char/charcontent.jsp");
		return "main/main";
	}
}
