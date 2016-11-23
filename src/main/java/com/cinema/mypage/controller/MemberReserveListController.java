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
	
	/*@RequestMapping("reserveList.do")
	public String reserveList(Model model, String no, String type, String sPage) {
		//예매내역,관람내역 구분
		int ino = Integer.parseInt(no);
		List<MemberReserveListVO> list;
		
		//페이지 재료
		if(sPage==null || sPage.equals("0")) sPage="1";
		int curpage=Integer.parseInt(sPage);	// 현재페이지
		int rowSize=5;						//컬럼사이즈
		int start;						
		int end;							// 마지막번호						
		int rowCount;						// 총 내역
		int totalPage;					// 총 페이지
		int block;
		int fromPage;
		int toPage;
		
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
		start = (curpage*rowSize)-(rowSize-1); // 0, 3, 6...
		end = curpage*rowSize; // 2, 5, 8
		totalPage=(rowCount/rowSize)+1;
		if(totalPage==0) curpage=0;
		
		//페이지 넘버링
		block=5;
		fromPage=((curpage-1)/block*block)+1;
		toPage=((curpage-1)/block*block)+block;
		
		if(toPage>totalPage)
			toPage=totalPage;
		
		//예매취소 비교용
		Date today=new Date();
		
		//메뉴 선택 구분인자
		String menuType="reserveList";
		
		model.addAttribute("menuType", menuType);
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
	}*/
}
