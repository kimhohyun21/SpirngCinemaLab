package com.cinema.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.dao.theater.TheaterDAO;
import com.cinema.dao.theater.TheaterVO;

@Controller
public class TheaterController {
	@Autowired
	public TheaterDAO dao;
	
	@RequestMapping("theater.do")
	public String main(Model model, String local, String checkedDay, String checkedDay2, String title, String theater,
						String grade, String theaterNo, String movietime, String click){
		
		//���� ����
		if(local==null) local="����";
	
		List<TheaterVO> localList = dao.localData2();

		if(theater==null && local.equals("����")) theater="�ŵ���";
		if(theater==null && local.equals("���")) theater="����";
		if(theater==null && local.equals("��õ")) theater="�˴�";
		if(theater==null && local.equals("�뱸")) theater="����";
		if(theater==null && local.equals("�λ�")) theater="�ؿ��";
		
		//���� ����
		List<TheaterVO> theaterList=dao.theaterData2(local);
		
		//���� ����
		int num=(int) (Math.random()*4+1);
		
		//��¥ ���
		int i, j, a, b;
		int[] day7 = { 0, 0, 0, 0, 0, 0, 0 };
		String[] strWeek2 = { "", "", "", "", "", "", "" };
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d-E");
		String today = sdf.format(date);

		StringTokenizer st = new StringTokenizer(today, "-");
		String sy = st.nextToken();
		String sm = st.nextToken();
		String sd = st.nextToken();
		String ss = st.nextToken();

		int[] lastDay = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		int lastDay2;

		int year = Integer.parseInt(sy);
		int month = Integer.parseInt(sm);
		int day = Integer.parseInt(sd);
		int day2 = day;

		// ������ ���Ϻ��� 7�ϱ����� �ٸ� �迭�� �־��ֱ�
		String[] strWeek = { "��", "��", "ȭ", "��", "��", "��", "��" };
		for (i = 0; i <= 6; i++) {
			if (ss.equals(strWeek[i])) {
				break;
			}
		}

		for (b = 0; b <= 6; b++) {
			strWeek2[b] = strWeek[i];
			i++;
			if (i == 7) {
				i = 0;
			}
		}

		// ������ �Ϻ��� 7�ϱ����� �ٸ� �迭�� ���� �־��ֱ�
		if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
			lastDay[1] = 29;
		else
			lastDay[1] = 28;

		a = 0;
		while (a == month - 1) {
			a++;
		}
		lastDay2 = lastDay[a];

		for (j = 0; j <= 6; j++) {
			day7[j] = day2;
			day2++;
			if (day2 > lastDay2)
				day2 = 1;
		}
		int z = 0;

		if(checkedDay==null)checkedDay=sd;
		if(checkedDay2==null)checkedDay2=ss;
	
		//��ȭ ����
		List<TheaterVO> movieList = dao.movieData2(theater);
		
		// ��ȭ �� �ð� ����
		if (title == null)
			title = "����Ǯ Deadpool";
		
		// ��ȭ �� �ð� �� �󿵰�
	      List<TheaterVO> movieList2=new ArrayList<>();
	      for(TheaterVO vo : movieList){
	         title=vo.getTitle();
	         Map map = new HashMap();
	         map.put("theater", theater);
	         map.put("title", title);
	         List<TheaterVO> timeList = dao.timeData2(map);
	         int theaterNo2 = dao.theaterNoData2(map);
	         
	         
	         vo.setTheaterNo(theaterNo2);
	         vo.setTimeList(timeList);
	         
	         movieList2.add(vo);
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
		
		return "main/main";
	}
}
