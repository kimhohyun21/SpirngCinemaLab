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
		
		/*//캐릭터 출연영화이름 가져오기
		//mno=영화번호 리스트
		List<MovieVO> mno = dao.AactorAllMno(Integer.parseInt(cno));
		for(MovieVO voo : mno){
			//영화이름 가져오기,null아닐시 저장
			String title1=dao.AcharMovieTitle(voo.getMno1());
			if(title1 != null)
				model.addAttribute("title1",title1);
			String title2=dao.AcharMovieTitle(voo.getMno2());
			if(title2 != null)
				model.addAttribute("title2",title2);
			String title3=dao.AcharMovieTitle(voo.getMno3());
			if(title3 != null)
				model.addAttribute("title3",title3);
			String title4=dao.AcharMovieTitle(voo.getMno4());
			if(title4 != null)
				model.addAttribute("title4",title4);
			String title5=dao.AcharMovieTitle(voo.getMno5());
			if(title5 != null)
				model.addAttribute("title5",title5);
		}*/
		
		
		model.addAttribute("mList",mList);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp", "../adminpage/menubar.jsp");
		model.addAttribute("jsp2", "../adminpage/char/charcontent.jsp");
		return "main/main";
	}
}
