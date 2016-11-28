package com.cinema.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.dao.member.*;

@Controller
public class MyPageController {
	@Autowired
	private MemberDAO dao;
	
	//예매 내역 리스트
	@RequestMapping("reserveList.do")
	public String reserveList(Model model, String no, String type, String page) {
		//예매내역,관람내역 구분
		int ino = Integer.parseInt(no);

		List<MemberReserveListVO> list=new ArrayList<>();
		
		//페이지 재료
		if(page==null || page.equals("0")) page="1";
		int curpage=Integer.parseInt(page);	// 현재페이지
		int rowSize=4;						//컬럼사이즈
		int start;						
		int end;							// 마지막번호						
		double rowCount;						// 총 내역
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
		
		//페이지 구하기	
		start = (curpage*rowSize)-(rowSize-1); // 0, 3, 6...
		end = curpage*rowSize; // 2, 5, 8
		totalPage=(int) Math.ceil(rowCount/rowSize);
		if(totalPage==0) curpage=0;

		//페이지 넘버링
		block=5;
		fromPage=((curpage-1)/block*block)+1;
		toPage=((curpage-1)/block*block)+block;
		
		if(toPage>totalPage)
			toPage=totalPage;
		
		//예매취소 비교용
		Date today=new Date();		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String source=sdf.format(today);
		try {
			today=sdf.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
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
		model.addAttribute("jsp2", "../mypage/mypage_reserveList.jsp");

		return "main/main";
	}
	
	
	//회원정보 수정
	@RequestMapping("memberModify.do")
	public String memberModify(Model model, String strno){
		int no=Integer.parseInt(strno);		
		MemberVO vo=dao.memberGetAllInfo(no);
		String birth=vo.getBirth();
		String phone=vo.getPhone();
		String name=vo.getName();
		
		// 입력폼 맞추기  )1998-11-11 => 19981111
		birth=birth.replace("-", "");
		phone=phone.replace("-", "");
		
		//메뉴 선택 구분인자
		String menuType="memberModify";
		
		model.addAttribute("menuType", menuType);		
		model.addAttribute("name", name);
		model.addAttribute("phone", phone);
		model.addAttribute("birth", birth);
		
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/mypage_modify.jsp");
		
		return "main/main";
	}
	
	//회원 정보 수정 OK
	@RequestMapping("modify_ok.do")
	@ResponseBody
	public boolean memberModify_Ok(Model model, String strno, String pwd, String name, 
								  String phone, String birth){
		int no=Integer.parseInt(strno);		
		// DB값
		MemberVO vo=dao.memberGetAllInfo(no);		
		String db_pwd=vo.getPwd();
	
		boolean pCheck=false;
		if(db_pwd.equals(pwd)){
			pCheck=true;
			phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
			
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setPhone(phone);
			vo.setBirth(birth);
			vo.setNo(no);
			dao.memberModify(vo);
	;			
		}else{
			pCheck=false;
		}
		
		return pCheck;
	}
	
	//회원 비밀번호 수정
	@RequestMapping("memberChangePwd.do")
	public String memberChangePwd(Model model){
		
		//메뉴 선택 구분인자
		String menuType="memberChangePwd";
		
		model.addAttribute("menuType", menuType);	
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/mypage_change_pwd.jsp");
		return "main/main";
	}
	
	//비밀 번호 수정 OK
	@RequestMapping("MemeberChangePwd_ok.do")
	@ResponseBody
	public boolean ChangePwdOk(Model model, String strno, String pwd, String change_pwd) {
		int no=Integer.parseInt(strno);
		MemberVO vo=dao.memberGetAllInfo(no);

		// DB값 가져오기
		String db_pwd = vo.getPwd();
		boolean pCheck = false;
		
		if (db_pwd.equals(pwd)) {
			pCheck = true;
			// 바꿀 비밀번호
			vo.setNo(no);
			vo.setPwd(change_pwd);
			dao.memberChangePwd(vo);
		} else {
			pCheck = false;
		}

		return pCheck;
	}
	
	//회원 탈퇴
	@RequestMapping("memberDelete.do")
	public String memberDelete(Model model){
		
		//메뉴 선택 구분인자
		String menuType="memberDelete";
		
		model.addAttribute("menuType", menuType);		
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/mypage_delete.jsp");
		return "main/main";
	}
	
	//회원 탈퇴 OK
	@RequestMapping("delete_ok.do")
	@ResponseBody
	public int delete_ok(Model model, String strno, String pwd, HttpSession session){
		int no=Integer.parseInt(strno);
		MemberVO vo=dao.memberGetAllInfo(no);
		//DB값
		String db_pwd=vo.getPwd();			
		
		int check=3;
		
		if(db_pwd.equals(pwd)){
			dao.memberDelete(no);
			//저장됬던 세션날리기
			session.invalidate();
			check=1;
		}else{
			check=0;
		}		
		
		return check;
	}
}
