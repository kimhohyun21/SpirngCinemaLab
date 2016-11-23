package com.cinema.reserve.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.reserve.dao.*;

@Controller
public class Reserve1Controller {
	@Autowired
	private ReserveDAO dao;
	
	@RequestMapping("reserve.do")
	public String reserve(Model model, String checkedYear, 
						  String checkedMonth, String checkedDay, String checkedDay2,
						  String local, String tname, String title, String grade,
						  String theaterNo, String poster, String payment,
						  String movietime, String rType){
		
		//오늘 날짜 얻기
		String today=new SimpleDateFormat("yyyy-M-d-E").format(new Date());
		StringTokenizer st=new StringTokenizer(today,"-");
		String sy=st.nextToken(); 
		int year=Integer.parseInt(sy);   //년
		String sm=st.nextToken(); 
		int month=Integer.parseInt(sm);  //월
		String sd=st.nextToken(); 
		int day=Integer.parseInt(sd);    //일		
		String ss=st.nextToken();        //요일
		
		//오늘의 요일부터 7일까지만 배열에 넣어주기
		String[] strWeek={"일","월","화","수","목","금","토"}; //요일 배열
		String[] strWeek2={"","","","","","",""}; 		   //사용할 요일 배열
		for(int i=0; i<=6; i++){							   //오늘 요일을 비교하여 요일 배열에 넣기
			if(ss.equals(strWeek[i])){ 
				for(int a=0; a<=6; a++){
					strWeek2[a]=strWeek[i];
					i++;
					if(i==7)i=0;
				}
				break;
			}
		}
				
		//월별 마지막 날짜 지정
		int[] lastDay={31,28,31,30,31,30,31,31,30,31,30,31}; // 월별 마지막 날짜 배열 
		if((year%4==0 && year%100!=0)||(year%400==0)){       // 윤달에 따른 2월 마지막 날 설정
			lastDay[1]=29;
		}else{
			lastDay[1]=28;
		}		
		int lastDay2=lastDay[month-1];						// 해당 월의 마지막 날 값 지정
		
		//오늘 날짜부터 7일까지만 배열에 넣기
		int[] day7={0,0,0,0,0,0,0};							 // 날짜 배열	
		for(int j=0; j<=6; j++){							 		
			day7[j]=day;
			day++;
			if(day>lastDay2) day=1;
		}
		
		//날짜 출력을 위한 변수
		int z=0;
		
		//선택된 날짜 및 요일 값 받기
		if(checkedYear==null)checkedYear=sy; //선택이 없을 경우 초기값
		if(checkedMonth==null)checkedMonth=sm; //선택이 없을 경우 초기값
		if(checkedDay==null)checkedDay=sd; //선택이 없을 경우 초기값
		if(checkedDay2==null)checkedDay2=ss; //선택이 없을 경우 초기값
		int y=Integer.parseInt(checkedYear);
		int m=Integer.parseInt(checkedMonth);
		int d=Integer.parseInt(checkedDay);
		
		//새벽 시간 날짜 설정
		if(movietime!=null){
			String time=movietime.substring(0, movietime.lastIndexOf(":"));	
			if(lastDay[m-1]==d && time.equals("1")){
				if(m==12){
					y+=1;
					m=1;
				}else{
					m+=1;
				}			
				d=1;
			}else if(time.equals("1")){
				d+=1;
			}
		}		
		
		//지역 리스트 받기 
		List<ReserveVO> localList=dao.localData();
		
		//선택된 지역 값 받기
		if(local==null) local="서울";	 //선택이 없을 경우 초기값	
		//선택된 지역에 따른 극장 리스트 받기
		List<ReserveVO> theaterList=dao.theaterData(local);
		
		//영화관 선택 값 받기
		if(tname==null) tname=theaterList.get(0).getTheater();	//선택이 없을 경우 초기값
		//영화관 선택에 따른 영화 리스트 받기
		List<ReserveVO> movieList=dao.movieData(tname);
		
		//영화 선택값 받기
		if(title==null) title=movieList.get(0).getTitle();  //선택이 없을 경우 초기값	
		
		//영화관 및 영화 선택에 따른 영화 상영관 및 상영시간 받기
		Map map=new HashMap();
		map.put("tname", tname);
		map.put("title", title);
		int theaterNo2=dao.theaterNoData(map);
		List<ReserveVO> timeList=dao.timeData(map);		
		
		//나머지 정보 값 받기 
		if(grade==null)grade=movieList.get(0).getGrade();
		if(poster==null)poster=movieList.get(0).getPoster();
		if(payment==null)payment="0";
		
		//Ajax 실행 구분 인자
		if(rType==null)rType="default";
		String movePage=null;
		if(rType.equals("default")){
			movePage="main/main";
		}else if(rType.equals("daycheck")){
			movePage="reserve/reserve1_Local";
		}else if(rType.equals("localcheck")){
			movePage="reserve/reserve1_Theater";
		}else if(rType.equals("theatercheck")){
			movePage="reserve/reserve1_MovieList";
		}else if(rType.equals("moviecheck")){
			movePage="reserve/reserve1_MovieTime";
		}else if(rType.equals("timecheck")){
			movePage="reserve/reserve1_Result";
		}		
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("strWeek2", strWeek2);
		model.addAttribute("day7", day7);
		model.addAttribute("z", z);
		model.addAttribute("checkedYear", y);
		model.addAttribute("checkedMonth", m);
		model.addAttribute("checkedDay", d);
		model.addAttribute("checkedDay2", checkedDay2);
		model.addAttribute("localList", localList);
		model.addAttribute("local", local);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("tname", tname);
		model.addAttribute("movieList", movieList);
		model.addAttribute("title", title);
		model.addAttribute("theaterNo2", theaterNo2);
		model.addAttribute("timeList", timeList);
		model.addAttribute("grade", grade);
		model.addAttribute("theaterNo", theaterNo);
		model.addAttribute("poster", poster);
		model.addAttribute("payment", payment);
		model.addAttribute("movietime", movietime);
		
		model.addAttribute("jsp", "../reserve/reserve1.jsp");
	
		return movePage;
	}
	
}
