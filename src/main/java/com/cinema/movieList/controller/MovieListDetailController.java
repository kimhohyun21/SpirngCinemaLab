package com.cinema.movieList.controller;

import java.util.*;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import com.cinema.member.dao.*;
import com.cinema.movieList.dao.*;

@Controller
public class MovieListDetailController {
	@Autowired
	private MovieDAO dao;
	
	@RequestMapping("moviedetail.do")
	public String HandlerRequest(Model model, String no, String page,String type, HttpSession session){
		try{
			Map map=new HashMap();
			int mNo = Integer.parseInt(no);
			MemberVO vo1 = (MemberVO) session.getAttribute("mvo");
			
			int check=0;
			if(vo1!=null){	//로그인이 됬을 경우
				int memberNo=vo1.getNo();
				
				//댓글 기록 여부 확인
				map.put("mNo", mNo);
				map.put("memberNo", memberNo);
				check=dao.replyRecordCheck(map);
			}
			
			//영화 상세 내용
			MovieVO vo=dao.getmoviedetail(mNo);
			List<MovieVO> list = dao.getmoviecharacter(mNo);
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
			
			//페이지 설정
			if(page==null || page.equals("0")) page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=5;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			
			map=new HashMap();
			map.put("start", start);
			map.put("end",end);
			map.put("mNo", mNo);
			
			//디비에 있는 댓글 뿌려주기
			List<MovieVO> replyList = dao.getReplyData(map);
			int totalpage=dao.replyTotalPage(mNo);
			if(totalpage==0)curpage=0;
			
			
			int block=5;
			int frompage=((curpage-1)/block*block)+1;
			int topage=((curpage-1)/block*block)+block;
			if(topage>totalpage) topage=totalpage;
			
			model.addAttribute("url", url);
			model.addAttribute("list", list);
			model.addAttribute("vo", vo);
			model.addAttribute("jsp", "../movie/moviedetail.jsp");
			model.addAttribute("no", no);
			model.addAttribute("check", check);
			model.addAttribute("type", type);
			model.addAttribute("block", block);
			model.addAttribute("frompage", frompage);
			model.addAttribute("topage", topage);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("replyList", replyList);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return "main/main";
	}
}