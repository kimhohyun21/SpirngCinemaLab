package com.cinema.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.*;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AdminController{
	@Autowired
	AdminDAO dao;
	
	//영화 리스트
	@RequestMapping("aMovieList.do")
	public String movieList(Model model,String page){
		//무비 리스트 뽑아오기
		List<MovieVO> list=dao.adminMovieAllList();
		
		// yyyy-MM-dd 00:00:00  뒷부분 시간 지우기
		for(MovieVO vo:list){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String Date = sdf.format(vo.getOpendate());
			vo.setDate(Date);		}
		
		//페이지 재료들
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
		
		//메뉴 선택 구분인자
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
	
	//영화 등록
	@RequestMapping("AmovieInsert.do")
	public String movieInsert(Model model){
		
		//메뉴 선택 구분인자
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("jsp","../mypage/mypage.jsp");
	    model.addAttribute("jsp2", "../adminpage/menubar.jsp");
	    model.addAttribute("jsp3", "../adminpage/movieInsert.jsp");
		return "main/main";
	}
	
	//영화 등록 OK
	@RequestMapping("AmovieInsert_ok.do")
	public String movieInsert_ok(Model model,String title,String poster,String grade,
			String type,String runtime, String year, String month, String day, String content,
			String director, String genre, String cast, String trailer) {
		try {
			//model.setCharacterEncoding("UTF-8");
			// opendate만들기
			String sopendate = year + "-" + month + "-" + day + " 00:00:00";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date opendate = sdf.parse(sopendate);

			// 저장
			MovieVO vo = new MovieVO();			
			vo.setTitle(title);
			vo.setPoster(poster);
			vo.setGrade(grade);
			vo.setType(Integer.parseInt(type));
			vo.setRuntime(runtime + "분");
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
	
	//영화 정보 수정
	@RequestMapping("Amodifymovielist.do")
	public String modifyMovieList(Model model,String no){
		//영화정보들 가져오기
		int no2=Integer.parseInt(no);
		MovieVO vo=dao.adminMovieData(no2);
		
		//년도,월,일 분리
		SimpleDateFormat yearF=new SimpleDateFormat("yyyy");
		SimpleDateFormat monthF=new SimpleDateFormat("MM");
		SimpleDateFormat dayF=new SimpleDateFormat("dd");
		String year = yearF.format(vo.getOpendate());
		String month = monthF.format(vo.getOpendate());
		String day = dayF.format(vo.getOpendate());
		
		//상영예정영화 수정 에러방지
		String runtime=vo.getRuntime();
		if(runtime != null){
			// 상영시간 '분'빼기
			runtime.replaceAll("분", "");
			vo.setRuntime(runtime);
		}
		
		//메뉴 선택 구분인자
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
	
	//영화 수정 OK
	@RequestMapping("Amodify_Ok.do")
	public String modifyOk(Model model, String no, String title, String poster,
			String grade, String type, String runtime, String year, String month, String day,
			String content, String director, String genre, String cast, String trailer) {
		try {
			//request.setCharacterEncoding("EUC-KR");
			int no2=Integer.parseInt(no);
						
			// opendate만들기
			String sopendate = year + "-" + month + "-" + day + " 00:00:00";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date opendate = sdf.parse(sopendate);
			
			// 저장
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
	
	//캐릭터 수정
	@RequestMapping("AcharUpdate.do")
	public String charInsert(Model model,String no,String type){
		
		List<MovieVO> list=dao.AcharAllData();
		List<MovieVO> actor=dao.movieCharData(Integer.parseInt(no));
		
		//출연진이 없거나 1,2명일 경우
		switch(actor.size()){
		case 0:
			actor.add(list.get(0));
		case 1:
			actor.add(list.get(0));
		case 2:
			actor.add(list.get(0));
		}
		
		//메뉴 선택 구분인자
		String menuType="admin";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("i",0); //카운팅용
		model.addAttribute("actor",actor);
		model.addAttribute("no",no);
		model.addAttribute("type",type);
		model.addAttribute("list", list);
		model.addAttribute("jsp","../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../adminpage/menubar.jsp");
		model.addAttribute("jsp3", "../adminpage/charupdate.jsp");
		return "main/main";
	}
	
	//캐릭터 수정 OK
	@RequestMapping("AcharUpdate_ok.do")
	public String charUpdateOk(Model model, String sno, String actor, String type) {

		int no = Integer.parseInt(sno);
		// 배우번호 나누기 현재 actor=1,2,3
		System.out.println(actor);
		StringTokenizer st=new StringTokenizer(actor, ",");		
		int actor1 = Integer.parseInt(st.nextToken());
		int actor2 = Integer.parseInt(st.nextToken());
		int actor3 = Integer.parseInt(st.nextToken());

		// no=영화번호,actor=출연진번호
		List<MovieVO> beforeAL = dao.movieCharData(no);
		int[] afterAL = { actor1, actor2, actor3 };
		Map map = new HashMap();
		
		
		//이전 출연진 삭제
		for (MovieVO vo : beforeAL) {
			map.put("cno", vo.getCno());
			for (int j = 1; j < 6; j++) {
				//mno1~mno5 가져오기
				String mno = "mno" + j;
				map.put("mno", mno);
				int db_mno = dao.AactorMno(map);
				
				//가져온 번호랑 영화번호랑 같으면 삭제
				if (db_mno == no) {
					dao.AactorDeleteMno(map);
					break;
				}
			}
		}
		
		//입력받은 출연진 업데이트
		for (int cno : afterAL) {
			//중복체크용
			int check=0;
			map.put("cno", cno);
			for (int j = 1; j < 6; j++) {
				String mno = "mno" + j;
				map.put("mno", mno);
				int db_mno = dao.AactorMno(map);
				
				//출연진이 중복될 경우 break
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
	
	//예매 리스트 
	@RequestMapping("aReserveList.do")
	public String qnaList(Model model,String page){
		
		if(page == null) page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		
		//한번에 최대 표시할 페이지 수
		int block = 5;
		//block에 표시된 페이지까지 같은 block 표시
		int fromPage = ((curpage-1)/block*block)+1;
		int toPage = ((curpage-1)/block*block) + block;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<ReserveListVO> list = dao.reserveList(map);
		int totalpage = dao.reserveTotal();
		
		if(toPage > totalpage)
			toPage = totalpage;
		
		//메뉴 선택 구분인자
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