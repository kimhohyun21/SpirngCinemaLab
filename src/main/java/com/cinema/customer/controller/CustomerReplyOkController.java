package com.cinema.customer.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.customer.dao.*;
import com.cinema.member.dao.MemberVO;

@Controller
public class CustomerReplyOkController {
	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping("qreply_ok.do")
	public String handlerRequest(Model model, HttpSession session, String content, String strno, String subject){		
		try {
			int qno=Integer.parseInt(strno);
			
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			int no=mvo.getNo();
			CustomerVO pvo=dao.customerGroupData(qno);
			dao.StepUpdate(pvo);
			
			CustomerVO vo = new CustomerVO();
			vo.setGroup_id(pvo.getGroup_id());
			vo.setGroup_step(pvo.getGroup_step()+1);
			vo.setGroup_tab(pvo.getGroup_tab()+1);
			vo.setNo(no);
			vo.setRoot(qno);
			vo.setQsubject(subject);
			vo.setQcontent(content);
			dao.customerReply(vo);
			
		} catch (Exception e) {			
			System.out.println(e.getMessage());
		}		
		
		return "customer/reply_ok";
	
	}
}
