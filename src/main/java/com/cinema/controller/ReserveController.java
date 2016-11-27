package com.cinema.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.dao.member.MemberVO;
import com.cinema.dao.reserve.*;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class ReserveController {
	@Autowired
	private ReserveDAO dao;
	
	//예매 1단계 : 날짜, 지역, 극장, 영화, 상영관, 시간 선택
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
		
		//오늘 시간 얻기
		String todayTime=new SimpleDateFormat("HHmm").format(new Date());
		int todayTime2=Integer.parseInt(todayTime);
		
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
		day=Integer.parseInt(sd);
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
		int nMo=dao.getMno(title);
		
		//영화관 및 영화 선택에 따른 영화 상영관 및 상영시간 받기
		Map map=new HashMap();
		map.put("tname", tname);
		map.put("title", title);
		int theaterNo2=dao.theaterNoData(map);
		
		List<ReserveVO> timeList=dao.timeData(map);
		List<ReserveVO> timelist2=new ArrayList<>();
		
		//지나간 상영시간 노출 제외
		if(d==day){
			for(ReserveVO vo:timeList){
				String movietime2=vo.getMovietime();
				StringTokenizer time=new StringTokenizer(movietime2,":");
				String si=time.nextToken();
				String bun=time.nextToken();
				String sibun=si+bun;
				int sibun2=Integer.parseInt(sibun);

				if(todayTime2<sibun2 || sibun2<200){
					vo.setMovietime(movietime2);
					timelist2.add(vo);
				}
			}
			model.addAttribute("timeList", timelist2);
		}
		else{
			model.addAttribute("timeList", timeList);
		}
		
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
		model.addAttribute("grade", grade);
		model.addAttribute("theaterNo", theaterNo);
		model.addAttribute("poster", poster);
		model.addAttribute("payment", payment);
		model.addAttribute("movietime", movietime);
		model.addAttribute("nMo", nMo);
		
		model.addAttribute("jsp", "../reserve/reserve1.jsp");
	
		return movePage;
	}
	
	//예매 2단계 : 티켓매수, 좌석 선택
	@RequestMapping("reserve2.do")
	public String reserve2(Model model, int year, int month, int checkedDay, 
							String checkedDay2, String local, String tname, String grade, 
							String title, String poster, String theaterNo, String movietime,
							String adult, String senior, String junior, String[] seat, String rType,
							String cType,HttpSession session, HttpServletRequest request){
		
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
	
	//예메 3단계 : 결제
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
	
	//예메 정보 저장 및  확인
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
	
	//예매 취소
	@RequestMapping("reserve5_Cancel.do")
	@ResponseBody
	public Map reserve5_Cancel(Model model, String rno, String pid, String title, HttpSession session){
		//요청정보 받아오기
		int rNo=0;
		if(pid!=null)rNo=dao.getRno(pid);
		if(rno!=null){
			rNo=Integer.parseInt(rno);
			ReserveVO vo=dao.getReserveData(rNo);
			pid=vo.getPaymentId();
		}
		
		//취소를 위한 클라이언트 생성
		IamportClient client;
		String api_key = "9046148780607955";
		String api_secret = "lSLsAIFwNaaTD0Cs2dtMaYiSrZRvwEERxqk89ZEWaPQOPsgSGKEQIXI9WzFsejkLJETSEyPOnFCd8T5O";
		client = new IamportClient(api_key, api_secret);
		
		//취소 접근 권한 얻기
		IamportResponse<AccessToken> auth_response = client.getAuth();
		
		//취소 진행
		boolean cancelCheck=false;
		String cancelMsg="예매가 취소되었습니다.";
		if(auth_response.getResponse()!=null){
			CancelData cancel_data = new CancelData(pid, true);
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			/*if(payment_response.getResponse()!=null){*/ //개발자 모드에서 하루 지나면 자동 취소 되는 경우 때문에 주석처리
				cancelCheck=true;
				
				//예매 내역 삭제 처리
				dao.updateCancel(rNo);
				
				//예매율 수정
				int totalReserve=dao.getTotalReserve();
				int reserveNum=dao.getReserveNum(title);
				double reserveRate=((double)reserveNum/totalReserve)*100;	
				double rank = Double.parseDouble(String.format("%.2f",reserveRate));

				Map map=new HashMap();
				map.put("title", title);
				map.put("rank", rank);
				dao.updateRank(map);	
				
			/*}else{
				cancelMsg=payment_response.getResponse().getFailReason();				
			  }			  
			 */				
		}
		
		//세션 정보 얻기
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		
		Map map=new HashMap();
		map.put("no", mvo.getNo());
		map.put("cancelMsg", cancelMsg);
		map.put("cancelCheck", cancelCheck);
		
		return map;
	}
}
