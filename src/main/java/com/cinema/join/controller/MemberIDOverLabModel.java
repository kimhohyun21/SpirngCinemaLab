package com.cinema.join.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.MemberDAO;

@Controller
public class MemberIDOverLabModel {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping("idOverlab.do") 
	public String idOverlab(Model model,String id, HttpServletRequest request){
		HttpSession session=request.getSession();//�̰Ǿ�������
		int check=dao.memberOverlab(id);
		
			if(check==0){
				model.addAttribute("overCheckId", id);//�ߺ��ƴ� ID����
				model.addAttribute("vvvv", "üũ�Ϸ�");	//üũ�Ϸᰪ ������ ��ưŬ��x
			}else{
				check=1;
		}
		model.addAttribute("check", check);
		return "join/join_ok";
	}
}
