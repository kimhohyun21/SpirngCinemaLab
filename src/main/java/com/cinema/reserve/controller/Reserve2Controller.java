package com.cinema.reserve.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.MemberVO;
import com.cinema.reserve.dao.*;

@Controller
public class Reserve2Controller {
	@Autowired
	private ReserveDAO dao;
	
	@RequestMapping("reserve2.do")
	public String reserve2(Model model, int year, int month, int checkedDay, 
							String checkedDay2, String local, String tname, String grade, 
							String title, String poster, String theaterNo, String movietime,
							String adult, String senior, String junior, String[] seat, String rType,
							String cType, HttpSession session, HttpServletRequest request){
		
		int[] lastDay={31,28,31,30,31,30,31,31,30,31,30,31}; // 월별 마지막 날짜 배열 
		if((year%4==0 && year%100!=0)||(year%400==0)){       // 윤달에 따른 2월 마지막 날 설정
			lastDay[1]=29;
		}else{
			lastDay[1]=28;
		}		
		
		//새벽 시간 날짜 설정
		if(movietime!=null){
			String time=movietime.substring(0, movietime.lastIndexOf(":"));			
			if(lastDay[month-1]==checkedDay && time.equals("1")){
				if(month==12){
					year+=1;
					month=1;
				}else{
					month+=1;
				}			
				checkedDay=1;
			}else if(time.equals("1")){
				checkedDay+=1;
			}
			System.out.println(checkedDay);
		}		
		
		
		
		//예매 시간
		String date=year+"-"+month+"-"+checkedDay+" "+movietime;
		
		//티켓 매수
		if(adult==null)adult="0";
		int ticket1=Integer.parseInt(adult);
		if(senior==null)senior="0";
		int ticket2=Integer.parseInt(senior);
		if(junior==null)junior="0";
		int ticket3=Integer.parseInt(junior);
		int ticketAll=ticket1+ticket2+ticket3;
		
		//결제 금액
		int payment=ticket1*10000+ticket2*6000+ticket3*8000;
		
		//좌석		
		String seatNo=null;
		int size=0;
		if(seat!=null){
			size=seat.length;
			for(String st : seat){
				seatNo+=st+", ";
			}
			seatNo=seatNo.substring(seatNo.indexOf("null")+4, seatNo.lastIndexOf(","));
		}
		
		//Ajax 실행 구분 인자
		if(rType==null)rType="default";
		String movePage=null;
		if(rType.equals("default")){
			movePage="main/main";
		}else if(rType.equals("seat")){
			movePage="reserve/reserve2_Seat";
		}else if(rType.equals("result")){
			movePage="reserve/reserve2_Result";
		}
		
		//좌석 예매 현황
		Map map=new HashMap();
		map.put("date", date);
		map.put("theater", tname);
		map.put("title", title);
		List<ReserveVO> rlist=dao.reserveData(map);
		//예매 좌석 리스트에 담기
		List<String> slist=new ArrayList<>();
		for(ReserveVO vo : rlist){
			String sit=vo.getSeat();
			StringTokenizer st=new StringTokenizer(sit, ",");
			while(st.hasMoreTokens()){
				 slist.add(st.nextToken());
			}			
		}
		
		//세션 값 받기
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		
		//이전 페이지 주소 받기
		String url=request.getHeader("referer");
		
		model.addAttribute("url", url);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("checkedDay", checkedDay);
		model.addAttribute("checkedDay2", checkedDay2);
		model.addAttribute("local", local);
		model.addAttribute("tname", tname);
		model.addAttribute("grade", grade);
		model.addAttribute("title", title);
		model.addAttribute("poster", poster);
		model.addAttribute("theaterNo", theaterNo);
		model.addAttribute("movietime", movietime);
		model.addAttribute("adult", adult);
		model.addAttribute("senior", senior);
		model.addAttribute("junior", junior);
		model.addAttribute("ticketAll", ticketAll);
		model.addAttribute("payment", payment);
		model.addAttribute("seatNo", seatNo);
		model.addAttribute("size", size);
		model.addAttribute("slist", slist);
		model.addAttribute("vo", vo);
		model.addAttribute("cType", cType);

		model.addAttribute("jsp", "../reserve/reserve2.jsp");
		model.addAttribute("jsp2", "../reserve/reserve2_Seat.jsp");
		model.addAttribute("jsp3", "../reserve/reserve2_Result.jsp");
		
		return movePage;
	}
}
