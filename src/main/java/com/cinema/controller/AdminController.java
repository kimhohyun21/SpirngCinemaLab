package com.cinema.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.dao.admin.*;
import com.cinema.dao.movieList.MovieVO;

@Controller
public class AdminController{
	@Autowired
	AdminDAO dao;
	
	//��ȭ ����Ʈ
	@RequestMapping("aMovieList.do")
	public String movieList(Model model,String page){
		//���� ����Ʈ �̾ƿ���
		List<MovieVO> list=dao.adminMovieAllList();
		
		// yyyy-MM-dd 00:00:00  �޺κ� �ð� �����
		for(MovieVO vo:list){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String Date = sdf.format(vo.getOpendate());
			vo.setDate(Date);		}
		
		//������ ����
		if(page==null)page="1";
		int ipage=Integer.parseInt(page);
		int row=10;
		int start=(row*ipage)-(row);
		int end=(row*ipage)-1;
		int rowCount=dao.adminMovieCount();
		int totalPage=(rowCount/row)+1;
		int block=5;
		int fromPage=((ipage-1)/block*block)+1;
		int toPage=((ipage-1)/block*block)+block;
		if(rowCount%row==0)
			totalPage=totalPage-1;
		if(toPage>totalPage)
			toPage=totalPage;
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("page",ipage);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("block",block);
		model.addAttribute("fromPage",fromPage);
		model.addAttribute("toPage",toPage);
		model.addAttribute("list",list);
		model.addAttribute("jsp","../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../adminpage/menubar.jsp");
		model.addAttribute("jsp3", "../adminpage/movielist.jsp");
		
		return "main/main";
	}
	
	//��ȭ ���
	@RequestMapping("AmovieInsert.do")
	public String movieInsert(Model model){
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("jsp","../mypage/mypage.jsp");
	    model.addAttribute("jsp2", "../adminpage/menubar.jsp");
	    model.addAttribute("jsp3", "../adminpage/movieInsert.jsp");
		return "main/main";
	}
	
	//��ȭ ��� OK
	@RequestMapping("AmovieInsert_ok.do")
	public String movieInsert_ok(Model model,String title,String poster,String grade,
			String type,String runtime, String year, String month, String day, String content,
			String director, String genre, String cast, String trailer) {
		try {
			//model.setCharacterEncoding("UTF-8");
			// opendate�����
			String sopendate = year + "-" + month + "-" + day + " 00:00:00";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date opendate = sdf.parse(sopendate);

			// ����
			MovieVO vo = new MovieVO();			
			vo.setTitle(title);
			vo.setPoster(poster);
			vo.setGrade(grade);
			vo.setType(Integer.parseInt(type));
			vo.setRuntime(runtime + "��");
			vo.setContent(content);
			vo.setDirector(director);
			vo.setGenre(genre);
			vo.setCast(cast);
			vo.setTrailer(trailer);
			vo.setOpendate(opendate);
			
			dao.adminMovieInsert(vo);
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		model.addAttribute("go","AML");
		
		return "adminpage/station";
	}
	
	//��ȭ ���� ����
	@RequestMapping("Amodifymovielist.do")
	public String modifyMovieList(Model model,String no){
		//��ȭ������ ��������
		int no2=Integer.parseInt(no);
		MovieVO vo=dao.adminMovieData(no2);
		
		//�⵵,��,�� �и�
		SimpleDateFormat yearF=new SimpleDateFormat("yyyy");
		SimpleDateFormat monthF=new SimpleDateFormat("MM");
		SimpleDateFormat dayF=new SimpleDateFormat("dd");
		String year = yearF.format(vo.getOpendate());
		String month = monthF.format(vo.getOpendate());
		String day = dayF.format(vo.getOpendate());
		
		//�󿵿�����ȭ ���� ��������
		String runtime=vo.getRuntime();
		if(runtime != null){
			// �󿵽ð� '��'����
			runtime.replaceAll("��", "");
			vo.setRuntime(runtime);
		}
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("no", no2);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp","../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../adminpage/menubar.jsp");
		model.addAttribute("jsp3", "../adminpage/moviemodify.jsp");
		return "main/main";
	}
	
	//��ȭ ���� OK
	@RequestMapping("Amodify_Ok.do")
	public String modifyOk(Model model, String no, String title, String poster,
			String grade, String type, String runtime, String year, String month, String day,
			String content, String director, String genre, String cast, String trailer) {
		try {
			//request.setCharacterEncoding("EUC-KR");
			int no2=Integer.parseInt(no);
						
			// opendate�����
			String sopendate = year + "-" + month + "-" + day + " 00:00:00";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date opendate = sdf.parse(sopendate);
			
			// ����
			MovieVO vo=new MovieVO();
			vo.setmNo(no2);
			vo.setTitle(title);
			vo.setPoster(poster);
			vo.setGrade(grade);
			vo.setType(Integer.parseInt(type));
			vo.setRuntime(runtime);
			vo.setContent(content);
			vo.setDirector(director);
			vo.setGenre(genre);
			vo.setCast(cast);
			vo.setTrailer(trailer);
			vo.setOpendate(opendate);			
			dao.adminMovieModify(vo);			
			
			model.addAttribute("no", no);
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		model.addAttribute("go","AML");
		
		return "adminpage/station";
	}
	
	//��ȭ �� ĳ���� ����
	@RequestMapping("AcharUpdate.do")
	public String charInsert(Model model,String no,String type){
		
		List<MovieVO> list=dao.AcharAllData();
		List<MovieVO> actor=dao.movieCharData(Integer.parseInt(no));
		
		//�⿬���� ���ų� 1,2���� ���
		switch(actor.size()){
		case 0:
			actor.add(list.get(0));
		case 1:
			actor.add(list.get(0));
		case 2:
			actor.add(list.get(0));
		}
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("i",0); //ī���ÿ�
		model.addAttribute("actor",actor);
		model.addAttribute("no",no);
		model.addAttribute("type",type);
		model.addAttribute("list", list);
		model.addAttribute("jsp","../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../adminpage/menubar.jsp");
		model.addAttribute("jsp3", "../adminpage/charupdate.jsp");
		return "main/main";
	}
	
	//��ȭ �� ĳ���� ���� OK
	@RequestMapping("AcharUpdate_ok.do")
	public String charUpdateOk(Model model, String sno, String actor, String type) {

		int no = Integer.parseInt(sno);
		// ����ȣ ������ ���� actor=1,2,3
		System.out.println(actor);
		StringTokenizer st=new StringTokenizer(actor, ",");		
		int actor1 = Integer.parseInt(st.nextToken());
		int actor2 = Integer.parseInt(st.nextToken());
		int actor3 = Integer.parseInt(st.nextToken());

		// no=��ȭ��ȣ,actor=�⿬����ȣ
		List<MovieVO> beforeAL = dao.movieCharData(no);
		int[] afterAL = { actor1, actor2, actor3 };
		Map map = new HashMap();
		
		
		//���� �⿬�� ����
		for (MovieVO vo : beforeAL) {
			map.put("cno", vo.getCno());
			for (int j = 1; j < 6; j++) {
				//mno1~mno5 ��������
				String mno = "mno" + j;
				map.put("mno", mno);
				int db_mno = dao.AactorMno(map);
				
				//������ ��ȣ�� ��ȭ��ȣ�� ������ ����
				if (db_mno == no) {
					dao.AactorDeleteMno(map);
					break;
				}
			}
		}
		
		//�Է¹��� �⿬�� ������Ʈ
		for (int cno : afterAL) {
			//�ߺ�üũ��
			int check=0;
			map.put("cno", cno);
			for (int j = 1; j < 6; j++) {
				String mno = "mno" + j;
				map.put("mno", mno);
				int db_mno = dao.AactorMno(map);
				
				//�⿬���� �ߺ��� ��� break
				if(j==1){
					List<MovieVO> mnoL=dao.AactorAllMno(cno);					
					for(MovieVO vo:mnoL){
						if(vo.getMno1()==no || vo.getMno2()==no || 
								vo.getMno3()==no || vo.getMno4()==no || 
								vo.getMno5()==no){
							check=1;
						}
					}
				}
				
				//insert
				if (db_mno == 0 && check==0) {			
					map.put("movieNo", no);
					dao.AactorInsertMno(map);
					break;
				}				
			}
		}
		
		model.addAttribute("no", no);
		model.addAttribute("type", type);
		model.addAttribute("go", "MD");

		return "adminpage/station";
	}
	
	//ĳ���� ���� ����Ʈ ������
	@RequestMapping("ACList.do")
	public String charList(Model model, String page) {

		//�ش��� ����
		List<MovieVO> list = dao.AcharAllData();
		
		// ������ ����
		if (page == null)
			page = "1";
		int ipage = Integer.parseInt(page);
		int row = 10;
		int start = (row * ipage) - (row);
		int end = (row * ipage) - 1;
		int rowCount = dao.ACharCount();
		int totalPage = (rowCount / row) + 1;
		int block = 5;
		int fromPage = ((ipage - 1) / block * block) + 1;
		int toPage = ((ipage - 1) / block * block) + block;
		if (rowCount % row == 0)
			totalPage = totalPage - 1;
		if (toPage > totalPage)
			toPage = totalPage;
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("page", ipage);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("list", list);
		model.addAttribute("jsp","../mypage/mypage.jsp");
	    model.addAttribute("jsp2", "../adminpage/menubar.jsp");
	    model.addAttribute("jsp3", "../adminpage/char/charlist.jsp");
		return "main/main";
	}
	
	//ĳ���� �� ���� ����
	@RequestMapping("ACContent.do")
	public String charContent(Model model, String cno) {
		//�ش� ĳ���� ����
		MovieVO vo = dao.AcharContent(Integer.parseInt(cno));
		
		//��ȭ�����
		List<MovieVO> mList = dao.AmovieAllData();
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("mList",mList);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp","../mypage/mypage.jsp");
	    model.addAttribute("jsp2", "../adminpage/menubar.jsp");
	    model.addAttribute("jsp3", "../adminpage/char/charcontent.jsp");
		return "main/main";
	}
	
	//ĳ���� ���
	@RequestMapping("ACharInsert.do")
	public String charInsert(Model model){
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);		
		model.addAttribute("jsp","../adminpage/char/charInsert.jsp");
		return "main/main";
	}
	
	//ĳ���� ��� ok
	@RequestMapping("ACharInsert_ok.do")
	public String charInsertOk(Model model, String name, String img){
		Map map=new HashMap();
		map.put("name", name);
		map.put("img",img);
		
		dao.ACharInsert(map);
		model.addAttribute("go","ACL");
		return "adminpage/station";
	}	
	
	//ĳ���� �� ���� ���� ������
	@RequestMapping("ACUpdate.do")
	public String charUpdate(Model model, String name, String img,
			String cno, String mno1, String mno2, 
			String mno3, String mno4, String mno5){
		int title1=Integer.parseInt(mno1);
		int title2=Integer.parseInt(mno2);
		int title3=Integer.parseInt(mno3);
		int title4=Integer.parseInt(mno4);
		int title5=Integer.parseInt(mno5);
		int title[]={title1,title2,title3,title4,title5};
			
		Map map = new HashMap();
		map.put("cno", Integer.parseInt(cno));
		map.put("cname", name);
		map.put("img", img);
		
		//�̸�,�̹��� ����
		dao.ACmodify(map);
		
		//���� mno1~mno5 ����
		for(int i=1 ; i<6 ; i++){
			String mno="mno"+i;
			map.put("mno", mno);
			dao.AactorDeleteMno(map);
		}
		int i=0;
		for(int t:title){
			//�̹� ��ȭ��ȣ�� �� ������
			List<MovieVO> mnoList=dao.AactorAllMno(Integer.parseInt(cno));
			int check=0;		
			for(MovieVO vo:mnoList){
				if(vo.getMno1()==t || vo.getMno2()==t || vo.getMno3()==t
						|| vo.getMno4()==t || vo.getMno5()==t){
					check=1;
				}
			}
			if(check==1){
				break;
			}
			i++;			
			//��ȭ�� �Ȱ������
			if(t==0){
				break;
			}
			map.put("movieNo", t);
			String mno="mno"+i;
			map.put("mno", mno);
			dao.AactorInsertMno(map);
		}
		
		
		model.addAttribute("go","ACL");
		return "adminpage/station";
	}
	
	
	//���� ����Ʈ 
	@RequestMapping("aReserveList.do")
	public String qnaList(Model model,String page){
		
		if(page == null) page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		
		//�ѹ��� �ִ� ǥ���� ������ ��
		int block = 5;
		//block�� ǥ�õ� ���������� ���� block ǥ��
		int fromPage = ((curpage-1)/block*block)+1;
		int toPage = ((curpage-1)/block*block) + block;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<ReserveListVO> list = dao.reserveList(map);
		int totalpage = dao.reserveTotal();
		
		if(toPage > totalpage)
			toPage = totalpage;
		
		//�޴� ���� ��������
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("list", list);
		model.addAttribute("page", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("jsp","../mypage/mypage.jsp");
	    model.addAttribute("jsp2", "../adminpage/menubar.jsp");
	    model.addAttribute("jsp3", "../adminpage/reservelist.jsp");
		
		return "main/main";
	}
	
}