package com.cinema.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.dao.reserve.ReserveVO;
import com.cinema.dao.theater.TheaterDAO;
import com.cinema.dao.theater.TheaterVO;

@Controller
public class TheaterController {
	@Autowired
	public TheaterDAO dao;
	
	@RequestMapping("theater.do")
	public String main(Model model, String local, String checkedDay, String checkedDay2, 
					   String title, String theater, String grade, String theaterNo, 
					   String movietime, String click, String cType){
		//���� ����
		int num=(int) (Math.random()*4+1);
		
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
		if(checkedDay==null)checkedDay=sd; //������ ���� ��� �ʱⰪ
		int d=Integer.parseInt(checkedDay);
		if(checkedDay2==null)checkedDay2=ss; //������ ���� ��� �ʱⰪ
		
		//���� ����
		List<TheaterVO> localList = dao.localData2();
		if(local==null) local=localList.get(0).getLocal();		
		
		//���� ����
		List<TheaterVO> theaterList=dao.theaterData2(local);
		if(theater==null) theater=theaterList.get(0).getTheater();		
		
		//��ȭ ����
		List<TheaterVO> movieList = dao.movieData2(theater);		
		
		// ��ȭ �� �ð� �� �󿵰�
		if (title == null)title = movieList.get(0).getTitle();
		List<TheaterVO> movieList2=new ArrayList<>();
		for(TheaterVO vo : movieList){
			title=vo.getTitle();
		    Map map = new HashMap();
		    map.put("theater", theater);
		    map.put("title", title);
		    
		    //�󿵰�
		    int theaterNo2 = dao.theaterNoData2(map);
		    vo.setTheaterNo(theaterNo2);
		    
		    //��ȭ �ð�
		    List<TheaterVO> timeList = dao.timeData2(map);
		    List<TheaterVO> timeList2=new ArrayList<>();
		    
		    //������ �󿵽ð� ���� ����
			if(d==day){
				for(TheaterVO vo2:timeList){
					String movietime2=vo2.getMovietime();
					StringTokenizer time=new StringTokenizer(movietime2,":");
					String si=time.nextToken();
					String bun=time.nextToken();
					String sibun=si+bun;
					int sibun2=Integer.parseInt(sibun);

					if(todayTime2<sibun2 || sibun2<200){
						vo2.setMovietime(movietime2);						
					}else{
						vo2.setMovietime("");
					}
					timeList2.add(vo2);
				}
				vo.setTimeList(timeList2);
			}
			else{
				vo.setTimeList(timeList);
			}
		     
		    movieList2.add(vo);
		}
	     
		//Ajax ��������
		String movePage="";
		if(cType==null){
			movePage="main/main";
		}else{
			movePage="theater/theater_List";
		}
		
		model.addAttribute("movieList2", movieList2);
		model.addAttribute("movieList", movieList);
		model.addAttribute("movietime", movietime);
		model.addAttribute("theaterNo", theaterNo);
		model.addAttribute("grade", grade);
		model.addAttribute("title", title);
		model.addAttribute("theater", theater);
		model.addAttribute("num", num);
		model.addAttribute("local", local);
		model.addAttribute("localList", localList);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("checkedDay", checkedDay);
		model.addAttribute("checkedDay2", checkedDay2);
		model.addAttribute("z", z);
		model.addAttribute("strWeek2", strWeek2);
		model.addAttribute("day7", day7);
		model.addAttribute("day", day);
		model.addAttribute("jsp", "../theater/theater.jsp");
		
		return movePage;
	}
}
