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
	public String Reserve4(Model model, String year, String month, String checkedDay, String checkedDay2, String tname,
							String grade, String title, String poster, String theaterNo, String movietime, String ticketAll,
							String payment, String seatNo, HttpSession session, String paymentId, HttpServletRequest request,
							String shopId, String serverPay, String cardOkNum, String paytype){

			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			
			//���� ������ �ּ� ȹ��
			String url=request.getHeader("referer");
		
			//���� ���� ����			
			String rDate=year+"-"+month+"-"+checkedDay+" "+movietime;
			String strPayType=null;
			if(paytype.equals("card"))strPayType="�ſ�ī��";
			if(paytype.equals("trans"))strPayType="������ü";
			int no=mvo.getNo();
			
			Map map=new HashMap();
			map.put("theater", tname);
			map.put("theaterNo", theaterNo);
			map.put("movietime", movietime);
			int tNo=dao.getTno(map);
			
			//���� ���� ���
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
			
			//������ ����
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
			
			request.setAttribute("jsp", "../reserve/reserve4_Complete.jsp");			
		
		return "main/main";
	}

}
