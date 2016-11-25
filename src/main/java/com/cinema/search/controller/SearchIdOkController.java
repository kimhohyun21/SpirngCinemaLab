package com.cinema.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class SearchIdOkController {
	@Autowired
	private MemberDAO dao;
	
	/*@RequestMapping("searchId_ok.do")
	public String searchId_ok(Model model, String phone, String birth, String name){
		
			MemberVO vo=new MemberVO();
			phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
			
			vo.setName(name);
			vo.setBirth(birth);
			vo.setPhone(phone);
			
			String id=dao.memberFindId(vo);
			model.addAttribute("pwd", "ÆÐ½º");
			model.addAttribute("id", id);
			model.addAttribute("jsp", "../search/giveimpo.jsp");
			
		return "main/main";
	}*/
}
