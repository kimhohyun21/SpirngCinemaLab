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
	
	//���� 1�ܰ� : ��¥, ����, ����, ��ȭ, �󿵰�, �ð� ����
	@RequestMapping("reserve.do")
	public String reserve(Model model, String checkedYear, 
						  String checkedMonth, String checkedDay, String checkedDay2,
						  String local, String tname, String title, String grade,
						  String theaterNo, String poster, String payment,
						  String movietime, String rType){
		
		//���� ��¥ ���
		String today=new SimpleDateFormat("yyyy-M-d-E").format(new Date());
		StringTokenizer st=new StringTokenizer(today,"-");
		String sy=st.nextToken(); 
		int year=Integer.parseInt(sy);   //��
		String sm=st.nextToken(); 
		int month=Integer.parseInt(sm);  //��
		String sd=st.nextToken(); 
		int day=Integer.parseInt(sd);    //��	
		String ss=st.nextToken();        //����
		
		//���� �ð� ���
		String todayTime=new SimpleDateFormat("HHmm").format(new Date());
		int todayTime2=Integer.parseInt(todayTime);
		
		//������ ���Ϻ��� 7�ϱ����� �迭�� �־��ֱ�
		String[] strWeek={"��","��","ȭ","��","��","��","��"}; //���� �迭
		String[] strWeek2={"","","","","","",""}; 		   //����� ���� �迭
		for(int i=0; i<=6; i++){							   //���� ������ ���Ͽ� ���� �迭�� �ֱ�
			if(ss.equals(strWeek[i])){ 
				for(int a=0; a<=6; a++){
					strWeek2[a]=strWeek[i];
					i++;
					if(i==7)i=0;
				}
				break;
			}
		}
				
		//���� ������ ��¥ ����
		int[] lastDay={31,28,31,30,31,30,31,31,30,31,30,31}; // ���� ������ ��¥ �迭 
		if((year%4==0 && year%100!=0)||(year%400==0)){       // ���޿� ���� 2�� ������ �� ����
			lastDay[1]=29;
		}else{
			lastDay[1]=28;
		}		
		int lastDay2=lastDay[month-1];						// �ش� ���� ������ �� �� ����
		
		//���� ��¥���� 7�ϱ����� �迭�� �ֱ�
		int[] day7={0,0,0,0,0,0,0};							 // ��¥ �迭	
		for(int j=0; j<=6; j++){							 		
			day7[j]=day;
			day++;
			if(day>lastDay2) day=1;
		}
		day=Integer.parseInt(sd);
		//��¥ ����� ���� ����
		int z=0;
		
		//���õ� ��¥ �� ���� �� �ޱ�
		if(checkedYear==null)checkedYear=sy; //������ ���� ��� �ʱⰪ
		if(checkedMonth==null)checkedMonth=sm; //������ ���� ��� �ʱⰪ
		if(checkedDay==null)checkedDay=sd; //������ ���� ��� �ʱⰪ
		if(checkedDay2==null)checkedDay2=ss; //������ ���� ��� �ʱⰪ
		int y=Integer.parseInt(checkedYear);
		int m=Integer.parseInt(checkedMonth);
		int d=Integer.parseInt(checkedDay);
		
		//���� �ð� ��¥ ����
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
		
		//���� ����Ʈ �ޱ� 
		List<ReserveVO> localList=dao.localData();
		
		//���õ� ���� �� �ޱ�
		if(local==null) local="����";	 //������ ���� ��� �ʱⰪ	
		//���õ� ������ ���� ���� ����Ʈ �ޱ�
		List<ReserveVO> theaterList=dao.theaterData(local);
		
		//��ȭ�� ���� �� �ޱ�
		if(tname==null) tname=theaterList.get(0).getTheater();	//������ ���� ��� �ʱⰪ
		//��ȭ�� ���ÿ� ���� ��ȭ ����Ʈ �ޱ�
		List<ReserveVO> movieList=dao.movieData(tname);
		
		//��ȭ ���ð� �ޱ�
		if(title==null) title=movieList.get(0).getTitle();  //������ ���� ��� �ʱⰪ	
		int nMo=dao.getMno(title);
		
		//��ȭ�� �� ��ȭ ���ÿ� ���� ��ȭ �󿵰� �� �󿵽ð� �ޱ�
		Map map=new HashMap();
		map.put("tname", tname);
		map.put("title", title);
		int theaterNo2=dao.theaterNoData(map);
		
		List<ReserveVO> timeList=dao.timeData(map);
		List<ReserveVO> timelist2=new ArrayList<>();
		
		//������ �󿵽ð� ���� ����
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
		
		//������ ���� �� �ޱ� 
		if(grade==null)grade=movieList.get(0).getGrade();
		if(poster==null)poster=movieList.get(0).getPoster();
		if(payment==null)payment="0";
		
		//Ajax ���� ���� ����
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
	
	//���� 2�ܰ� : Ƽ�ϸż�, �¼� ����
	@RequestMapping("reserve2.do")
	public String reserve2(Model model, int year, int month, int checkedDay, 
							String checkedDay2, String local, String tname, String grade, 
							String title, String poster, String theaterNo, String movietime,
							String adult, String senior, String junior, String[] seat, String rType,
							String cType,HttpSession session, HttpServletRequest request){
		
		//���� �ð�
		String date=year+"-"+month+"-"+checkedDay+" "+movietime;
		
		//Ƽ�� �ż�
		if(adult==null)adult="0";
		int ticket1=Integer.parseInt(adult);
		if(senior==null)senior="0";
		int ticket2=Integer.parseInt(senior);
		if(junior==null)junior="0";
		int ticket3=Integer.parseInt(junior);
		int ticketAll=ticket1+ticket2+ticket3;
		
		//���� �ݾ�
		int payment=ticket1*10000+ticket2*6000+ticket3*8000;
		
		//�¼�		
		String seatNo=null;
		int size=0;
		if(seat!=null){
			size=seat.length;
			for(String st : seat){
				seatNo+=st+", ";
			}
			seatNo=seatNo.substring(seatNo.indexOf("null")+4, seatNo.lastIndexOf(","));
		}
		
		//Ajax ���� ���� ����
		if(rType==null)rType="default";
		String movePage=null;
		if(rType.equals("default")){
			movePage="main/main";
		}else if(rType.equals("seat")){
			movePage="reserve/reserve2_Seat";
		}else if(rType.equals("result")){
			movePage="reserve/reserve2_Result";
		}
		
		//�¼� ���� ��Ȳ
		Map map=new HashMap();
		map.put("date", date);
		map.put("theater", tname);
		map.put("title", title);
		List<ReserveVO> rlist=dao.reserveData(map);
		//���� �¼� ����Ʈ�� ���
		List<String> slist=new ArrayList<>();
		for(ReserveVO vo : rlist){
			String sit=vo.getSeat();
			StringTokenizer st=new StringTokenizer(sit, ",");
			while(st.hasMoreTokens()){
				 slist.add(st.nextToken());
			}			
		}
		
		//���� �� �ޱ�
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		
		//���� ������ �ּ� �ޱ�
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
	
	//���� 3�ܰ� : ����
	@RequestMapping("reserve3.do")
	public String Reserve3(Model model, String year, String month, String checkedDay, String checkedDay2,
							String tname, String grade, String title, String poster, String theaterNo,
							String movietime, String ticketAll, String payment, String seatNo, HttpSession session){
		try{
			//����� ����
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
	
	//���� ���� ���� ��  Ȯ��
	@RequestMapping("reserve4.do")
	public String Reserve4(Model model, int year, int month, int checkedDay, String checkedDay2, String tname,
							String grade, String title, String poster, String theaterNo, String movietime, String ticketAll,
							String payment, String seatNo, String paymentId, String shopId, String serverPay, String cardOkNum, 
							String paytype, HttpSession session, HttpServletRequest request){

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
	
	//���� ���
	@RequestMapping("reserve5_Cancel.do")
	@ResponseBody
	public Map reserve5_Cancel(Model model, String rno, String pid, String title, HttpSession session){
		//��û���� �޾ƿ���
		int rNo=0;
		if(pid!=null)rNo=dao.getRno(pid);
		if(rno!=null){
			rNo=Integer.parseInt(rno);
			ReserveVO vo=dao.getReserveData(rNo);
			pid=vo.getPaymentId();
		}
		
		//��Ҹ� ���� Ŭ���̾�Ʈ ����
		IamportClient client;
		String api_key = "9046148780607955";
		String api_secret = "lSLsAIFwNaaTD0Cs2dtMaYiSrZRvwEERxqk89ZEWaPQOPsgSGKEQIXI9WzFsejkLJETSEyPOnFCd8T5O";
		client = new IamportClient(api_key, api_secret);
		
		//��� ���� ���� ���
		IamportResponse<AccessToken> auth_response = client.getAuth();
		
		//��� ����
		boolean cancelCheck=false;
		String cancelMsg="���Ű� ��ҵǾ����ϴ�.";
		if(auth_response.getResponse()!=null){
			CancelData cancel_data = new CancelData(pid, true);
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			/*if(payment_response.getResponse()!=null){*/ //������ ��忡�� �Ϸ� ������ �ڵ� ��� �Ǵ� ��� ������ �ּ�ó��
				cancelCheck=true;
				
				//���� ���� ���� ó��
				dao.updateCancel(rNo);
				
				//������ ����
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
		
		//���� ���� ���
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		
		Map map=new HashMap();
		map.put("no", mvo.getNo());
		map.put("cancelMsg", cancelMsg);
		map.put("cancelCheck", cancelCheck);
		
		return map;
	}
}
