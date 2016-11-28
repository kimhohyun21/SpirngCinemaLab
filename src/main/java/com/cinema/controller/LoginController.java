package com.cinema.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.dao.member.MemberDAO;
import com.cinema.dao.member.MemberVO;

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
			MemberVO vo = dao.memberGetInfo(id);			
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
	
	//���̵� �˻�
	@RequestMapping("searchId.do")
	public String searchID(Model model){
		model.addAttribute("jsp", "../login/searchId.jsp");
		return "main/main";
	}
	
	//���̵� �˻� �Ϸ�
	@RequestMapping("searchId_ok.do")
	public String searchId_ok(Model model, String phone, String birth, String name){
		MemberVO vo=new MemberVO();
		phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
		birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
		
		vo.setName(name);
		vo.setBirth(birth);
		vo.setPhone(phone);
		
		String id=dao.memberFindId(vo);
		
		model.addAttribute("pwd", "�н�");
		model.addAttribute("id", id);
		model.addAttribute("jsp", "../login/giveInfo.jsp");
		
		return "main/main";
	}
	
	//�н����� �˻�
	@RequestMapping("searchPwd.do")
	public String searchPwd(Model model){
		model.addAttribute("jsp", "../login/searchPwd.jsp");
		return "main/main";
	}
	
	//�н����� �˻� �Ϸ�
	@RequestMapping("searchPwd_ok.do")
	public String searchPwd_ok(Model model, String phone, String id, String name){
		
		MemberVO vo=new MemberVO();
		
		phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
		
		vo.setPhone(phone);
		vo.setName(name);
		vo.setId(id);
		String pwd=dao.memberFindPwd(vo);
		model.addAttribute("id", "�н�");
		model.addAttribute("pwd", pwd);
		model.addAttribute("jsp", "../login/giveInfo.jsp");
		
		return "main/main";
	}
	
	//ȸ�� ���� ȭ������
	@RequestMapping("join.do") 
	public String join(Model model){
		
		model.addAttribute("jsp", "../login/join.jsp");		
		return "main/main";
	}
	
	//ȸ�� �ߺ� ���� üũ
	@RequestMapping("idOverlab.do")
	@ResponseBody
	public Map idOverlab(Model model,String id, HttpServletRequest request){
		int check=dao.memberOverlab(id);
		Map map=new HashMap();
		
		if(check==0){
			map.put("overCheckId", id);//�ߺ��ƴ� ID����
		}			
		map.put("check", check);
		
		return map;
	}
	
	//ȸ�� ���� OK Ȯ��
	@RequestMapping("join_ok.do") //ȸ�����
	public String join_ok(Model model,String id, String pwd, String name,
			String phone, String birth){
		try{
			//request.setCharacterEncoding("EUC-KR");
			
			//��,���� ��� ���߱�  ex) 1984-11-29
			phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
						
			MemberVO vo=new MemberVO();
			vo.setId(id);
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setPhone(phone);
			vo.setBirth(birth);
			
			//�ѹ��� �ߺ�üũ
			int check=dao.memberOverlab(id);
			
			//�ߺ����������
			if(check==0){
				dao.memberInsert(vo);
				model.addAttribute("join", "���Լ���");			
			}else{
				//�ߺ��ϰ��
				model.addAttribute("join", "�ߺ�");
			}
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		model.addAttribute("jsp", "../login/login.jsp");

		return "main/main";
	}
}
