package com.cinema.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.*;

@Controller
public class MemberDeleteOkController {
	@Autowired
	private MemberDAO dao;	
	
	@RequestMapping("delete_ok.do")
	public String delete_ok(Model model, String strno, String pwd, HttpSession session){
		try{
			int no=Integer.parseInt(strno);
			MemberVO vo=dao.memberGetAllImfor(no);
			//DB蔼
			String db_pwd=vo.getPwd();			
			
			int check=3;
			
			if(db_pwd.equals(pwd)){
				dao.memberDelete(vo);
				//历厘夌带 技记朝府扁
				session.invalidate();
				check=1;
			}else{
				check=0;
			}
			model.addAttribute("check", check);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		
		return "mypage/delete_ok";
	}
}
