package com.cinema.login.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.*;

@Controller
public class MemberLoginOkModel {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping("login_ok.do") // 로그인 체크
	public String login_Ok(HttpServletRequest request,Model model,String id,
			String pwd, String loginType,String referer){
		try{
			request.setCharacterEncoding("EUC-KR");
		}catch(Exception ex){
			ex.printStackTrace();
		}		
		
		String check="";
		
		int idcheck=dao.memberIdCheck(id);
		
		if(idcheck==0){
			check="idnot";
		}else{
			MemberVO vo = dao.memberGetImfor(id);			
			if(pwd.equals(vo.getPwd())){
				HttpSession session=request.getSession();
				//패스워드 초기화
				vo.setPwd("");
				//회원정보 저장(name,no,id,admin)
				session.setAttribute("mvo", vo);
				check="ok";
			}else{
				check="pwdnot";
			}
		}
		// 로그인하기 이전 URL
		String url=request.getHeader("referer");		
		model.addAttribute("url", url);
		model.addAttribute("loginType", loginType);
		model.addAttribute("check", check);		
		
		
		return "login/login_ok.jsp";		
	}
}
