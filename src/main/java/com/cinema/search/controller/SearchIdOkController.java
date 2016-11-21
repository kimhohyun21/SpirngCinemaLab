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
	
	@RequestMapping("searchId_ok.do")
	public String searchId_ok(Model model, String phone, String birth, String name){
		try{
			MemberVO vo=new MemberVO();
			
			vo.setName(name);
			vo.setBirth(birth);
			vo.setPhone(phone);
			
			String id=dao.memberFindId(vo);
			model.addAttribute("pwd", "ÆÐ½º");
			model.addAttribute("id", id);
			model.addAttribute("jsp", "../search/giveimpo.jsp");
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return "main/main";
	}
}
