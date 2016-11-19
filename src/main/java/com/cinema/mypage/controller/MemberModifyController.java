package com.cinema.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;

@Controller
public class MemberModifyController {
	@Autowired
	private MemberDAO dao;	
	
	@RequestMapping("memberModify.do")
	public String memberModify(Model model, String strno){
		int no=Integer.parseInt(strno);		
		MemberVO vo=dao.memberGetAllImfor(no);
		String birth=vo.getBirth();
		String phone=vo.getPhone();
		String name=vo.getName();
		
		// 입력폼 맞추기  )1998-11-11 => 19981111
		birth=birth.replace("-", "");
		phone=phone.replace("-", "");
		
		model.addAttribute("name", name);
		model.addAttribute("phone", phone);
		model.addAttribute("birth", birth);
		
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/modify.jsp");
		
		return "main/main.jsp";
	}
}
