package com.cinema.mypage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.*;

@Controller
public class MemberReserveListController {
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("reserveList.do")
	public String reserveList(Model model, String no, String type, String page) {
		//예매내역,관람내역 구분
		int ino = Integer.parseInt(no);
		List<MemberReserveListVO> list;
			
		int rowCount;						//예매/관람 내역 총 개수
		
		if (type == null)
			type = "0";
		
		if (type.equals("1")) {	// 관람내역			
			list = dao.memberWhatchData(ino);
			//마지막페이지
			rowCount=dao.ReserveCount(ino);
			
		} else {		//예매내역
			list = dao.memberReserveList(ino);
			
			//마지막페이지
			rowCount=dao.ReserveCount2(ino);
		}
		
		//날짜형식 바꾸기 )yyyy-MM-dd HH:mm:ss -> yyyy.MM.dd
		try {
			for (MemberReserveListVO vo : list) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				String sDate = sdf.format(vo.getRdate());
				vo.setListdate(sDate);
			}			
		} catch (Exception e) {
				System.out.println(e.getMessage());
		}
		
		//페이지 구하기	
		if(page==null || page.equals("0")) page="1";
		int curpage=Integer.parseInt(page);			// 현재페이지
		int rowSize=5;								//컬럼사이즈
		int start= (curpage*rowSize)-(rowSize-1);	// 0, 3, 6...				
		int end= curpage*rowSize;					// 2, 5, 8	
		int totalPage=(rowCount/rowSize)+1;			// 총 페이지
		int block=5;
		int fromPage=((curpage-1)/block*block)+1;
		int toPage=((curpage-1)/block*block)+block;
		
		if(totalPage==0) curpage=0;
		if(toPage>totalPage)
			toPage=totalPage;
		
		//예매취소 비교용
		Date today=new Date();
		
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("curpage", curpage);		
		model.addAttribute("today", today);	
		model.addAttribute("type", type);
		model.addAttribute("list", list);
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/reserveList.jsp");

		return "main/main";
	}
}
