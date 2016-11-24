package com.cinema.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	MemberDAO dao;
	
	//로그인 뷰로~
	@RequestMapping("login.do") 
	public String login(Model model){
		model.addAttribute("jsp", "../login/login.jsp");
		
		return "main/main";
	}
	
	// 로그인 체크
	@RequestMapping("login_ok.do")
	@ResponseBody
	public Map login_Ok(HttpServletRequest request,Model model,String id,
			String pwd, String referer){
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
		
		Map map=new HashMap();
		map.put("url", url);
		map.put("check", check);	
		
		return map;		
	}
	
	//로그 아웃
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request,Model model){
		HttpSession session=request.getSession();
		if(session !=null){
			//저장된 세션제거
			session.invalidate();
		}
		return "redirect:main.do";
	}
}
