package com.cinema.reserve.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.MemberVO;

@Controller
public class Reserve3Controller {
	
	@RequestMapping("reserve3.do")
	public String Reserve3(Model model, String year, String month, String checkedDay, String checkedDay2,
							String tname, String grade, String title, String poster, String theaterNo,
							String movietime, String ticketAll, String payment, String seatNo, HttpSession session){
		try{
			//사용자 정보
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			
			model.addAttribute("year", year);
			model.addAttribute("month", month);
			model.addAttribute("checkedDay", checkedDay);
			model.addAttribute("checkedDay2", checkedDay2);
			model.addAttribute("tname", tname);
			model.addAttribute("grade", grade);
			model.addAttribute("title", title);
			model.addAttribute("poster", poster);
			model.addAttribute("theaterNo", theaterNo);
			model.addAttribute("movietime", movietime);
			model.addAttribute("ticketAll", ticketAll);
			model.addAttribute("payment", payment);
			model.addAttribute("seatNo", seatNo);
			model.addAttribute("mvo", mvo);
			
			model.addAttribute("jsp", "../reserve/reserve3.jsp");		
		}catch(Exception e){
			e.printStackTrace();
		}		
		return "main/main";
	}
}
