package com.cinema.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;
import com.cinema.reserve.dao.ReserveDAO;

@Controller
public class MemberChangePwdOkController {
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("changepwd_ok.do")
	public String ChangePwdOk(Model model, String strno, String pwd, String change_pwd) {
		int no=Integer.parseInt(strno);
		MemberVO vo=dao.memberGetAllImfor(no);

		// DB값 가져오기
		String db_pwd = vo.getPwd();
		boolean pCheck = false;
		
		if (db_pwd.equals(pwd)) {
			pCheck = true;
			// 바꿀 비밀번호
			vo.setNo(no);
			vo.setPwd(change_pwd);
			dao.memberChangePwd(vo);
		} else {
			pCheck = false;
		}
		model.addAttribute("pCheck", pCheck);

		return "mypage/change_pwd_ok.jsp";
	}
}