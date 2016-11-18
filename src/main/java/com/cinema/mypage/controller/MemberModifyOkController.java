package com.cinema.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;

@Controller
public class MemberModifyOkController {
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("modify_ok.do")
	public String memberModify_Ok(Model model, String strno, String pwd, String name, String phone, String birth, HttpSession session){
		int no=Integer.parseInt(strno);		
		// DB값
		MemberVO vo=dao.memberGetAllImfor(no);		
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
			//바뀐값 세션에 새로저장
			session.removeAttribute("mvo");
			session.setAttribute("mvo", vo);			
		}else{
			pCheck=false;
		}
		model.addAttribute("pCheck", pCheck);
		
		return "mypage/modify_ok.jsp";
	}
}
