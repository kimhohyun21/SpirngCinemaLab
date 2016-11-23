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
		
		//��ȭ�� �� ��ȭ ���ÿ� ���� ��ȭ �󿵰� �� �󿵽ð� �ޱ�
		Map map=new HashMap();
		map.put("tname", tname);
		map.put("title", title);
		int theaterNo2=dao.theaterNoData(map);
		List<ReserveVO> timeList=dao.timeData(map);		
		
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
