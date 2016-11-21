package com.cinema.join.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.*;

@Controller
public class MemberJoinOkModel {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping("join_ok.do") //회원등록
	public String join_ok(Model model,String id, String pwd, String name,
			String phone, String birth){
		try{
			//request.setCharacterEncoding("EUC-KR");
			
			//폰,생일 양식 맞추기  ex) 1984-11-29
			phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
						
			MemberVO vo=new MemberVO();
			vo.setId(id);
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setPhone(phone);
			vo.setBirth(birth);
			
			//한번더 중복체크
			int check=dao.memberOverlab(id);
			
			//중복값없을경우
			if(check==0){
				dao.memberInsert(vo);
				model.addAttribute("join", "가입성공");			
			}else{
				//중복일경우
				model.addAttribute("join", "중복");
			}
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		model.addAttribute("jsp", "../login/login.jsp");

		return "main/main";
	}
}
