package com.cinema.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class SearchPwdOkModel {
	@Autowired
	private MemberDAO dao;
	
	/*@RequestMapping("searchPwd_ok.do")
	public String searchPwd_ok(Model model, String phone, String id, String name){
		try{
			MemberVO vo=new MemberVO();
				
			phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			
			vo.setPhone(phone);
			vo.setName(name);
			vo.setId(id);
			String pwd=dao.memberFindPwd(vo);
			model.addAttribute("id", "ÆÐ½º");
			model.addAttribute("pwd", pwd);
			model.addAttribute("jsp", "../search/giveimpo.jsp");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		return "main/main";
	}*/
}
