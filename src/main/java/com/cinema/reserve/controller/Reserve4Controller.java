package com.cinema.reserve.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.MemberVO;
import com.cinema.reserve.dao.ReserveDAO;

@Controller
public class Reserve4Controller {
	
	@Autowired
	public ReserveDAO dao;
	
	@RequestMapping("reserve4.do")
	public String Reserve4(Model model, int year, int month, int checkedDay, String checkedDay2, String tname,
							String grade, String title, String poster, String theaterNo, String movietime, String ticketAll,
							String payment, String seatNo, String paymentId, String shopId, String serverPay, String cardOkNum, 
							String paytype, HttpSession session, HttpServletRequest request){

			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			
			//이전 페이지 주소 획득
			String url=request.getHeader("referer");
		
			//예약 정보 설정			
			String rDate=year+"-"+month+"-"+checkedDay+" "+movietime;
			String strPayType=null;
			if(paytype.equals("card"))strPayType="신용카드";
			if(paytype.equals("trans"))strPayType="계좌이체";
			int no=mvo.getNo();
			
			Map map=new HashMap();
			map.put("theater", tname);
			map.put("theaterNo", theaterNo);
			map.put("movietime", movietime);
			int tNo=dao.getTno(map);
			
			//예약 정보 등록
			map=new HashMap();
			map.put("rDate", rDate);
			map.put("seat", seatNo);
			map.put("ticket", ticketAll);
			map.put("payType", strPayType);
			map.put("payment", payment);
			map.put("paymentId", paymentId);
			map.put("shopId", shopId);
			map.put("serverPay", serverPay);
			map.put("cardOkNum", cardOkNum);
			map.put("no", no);
			map.put("tNo", tNo);
			dao.regReserve(map);
			
			//예매율 삽입
			int totalReserve=dao.getTotalReserve();
			int reserveNum=dao.getReserveNum(title);
			double reserveRate=((double)reserveNum/totalReserve)*100;	
			double rank = Double.parseDouble(String.format("%.2f",reserveRate));

			map=new HashMap();
			map.put("title", title);
			map.put("rank", rank);
			dao.updateRank(map);			
			
			request.setAttribute("url", url);
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			request.setAttribute("checkedDay", checkedDay);
			request.setAttribute("checkedDay2", checkedDay2);
			request.setAttribute("tname", tname);
			request.setAttribute("grade", grade);
			request.setAttribute("title", title);
			request.setAttribute("poster", poster);
			request.setAttribute("theaterNo", theaterNo);
			request.setAttribute("movietime", movietime);
			request.setAttribute("ticketAll", ticketAll);
			request.setAttribute("payment", payment);
			request.setAttribute("seatNo", seatNo);
			request.setAttribute("mvo", mvo);
			request.setAttribute("pid", paymentId);
			request.setAttribute("sid", shopId);
			
			model.addAttribute("url", url);
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
			model.addAttribute("pid", paymentId);
			model.addAttribute("sid", shopId);
			
			model.addAttribute("jsp", "../reserve/reserve4_Complete.jsp");			
		
		return "main/main";
	}

}
