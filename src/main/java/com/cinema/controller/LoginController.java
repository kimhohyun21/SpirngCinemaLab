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
	
	//�α��� ���~
	@RequestMapping("login.do") 
	public String login(Model model){
		model.addAttribute("jsp", "../login/login.jsp");
		
		return "main/main";
	}
	
	// �α��� üũ
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
				//�н����� �ʱ�ȭ
				vo.setPwd("");
				//ȸ������ ����(name,no,id,admin)
				session.setAttribute("mvo", vo);
				check="ok";
			}else{
				check="pwdnot";
			}
		}
		// �α����ϱ� ���� URL
		String url=request.getHeader("referer");
		
		Map map=new HashMap();
		map.put("url", url);
		map.put("check", check);	
		
		return map;		
	}
	
	//�α� �ƿ�
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request,Model model){
		HttpSession session=request.getSession();
		if(session !=null){
			//����� ��������
			session.invalidate();
		}
		return "redirect:main.do";
	}
}
