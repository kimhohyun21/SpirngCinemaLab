package com.cinema.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.dao.customer.*;
import com.cinema.dao.member.MemberVO;

@Controller
public class CustomerController {
	@Autowired
	private CustomerDAO dao;
	
	//QNA 리스트
	@RequestMapping("customer.do")
	public String qnaList(Model model, String page, Map map){
		
		if(page == null) page = "1";
		int curpage = Integer.parseInt(page);
		//한 페이지에 출력할 컨텐츠 수
		int rowSize = 10;
		int start = (curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		
		map.put("start", start);		
		map.put("end", end);
		
		List<CustomerVO> list = dao.getcustomerList(map);
		int totalpage = dao.customerTotal();
		
		model.addAttribute("list", list);
		model.addAttribute("page", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("jsp", "../customer/list.jsp");
		
		return "main/main";
	}
	
	//QNA 상세 보기
	@RequestMapping("content.do")
	public String content(Model model, String page, String no){
	
		//DAO에서 정리한 쿼리문 불러오기
		CustomerVO vo = dao.customerContent(Integer.parseInt(no));
		model.addAttribute("no", no);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		model.addAttribute("jsp", "list.jsp");
		model.addAttribute("jsp", "../customer/content.jsp");
		
		return "main/main";
		
	}
	
	//QNA 새글 등록
	@RequestMapping("insert.do")
	public String handlerRequest(Model model){
		//insert.jsp의 내용을 jsp로 함축
		model.addAttribute("jsp", "../customer/insert.jsp");
		return "main/main";
	}
	
	//QNA 새글 등록 OK
	@RequestMapping("insert_ok.do")
	public String handlerRequest(Model model, String no, String name, String content, String subject){		
		try {
			
			int intno=Integer.parseInt(no);
			
			//vo 껍데기에 컬럼 넣기
			CustomerVO vo = new CustomerVO();
			vo.setName(name);
			vo.setNo(intno);
			vo.setQsubject(subject);
			vo.setQcontent(content);
			dao.customerInsert(vo);
		} catch (Exception e) {			
			System.out.println(e.getMessage());
		}
	
		
		return "customer/insert_ok";
	
	}
	
	//QNA 답글
	@RequestMapping("reply.do")
	public String reply(Model model, String no, String page){

		//no,page값 저장
		model.addAttribute("page", page);
		model.addAttribute("no", no);
		model.addAttribute("jsp", "../customer/reply.jsp");
		
		return "main/main";
	}
	
	//QNA 답글 OK
	@RequestMapping("qreply_ok.do")
	public String qreply_ok(Model model, HttpSession session, String content, String strno, String subject){		
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
	
	//QNA 수정
	@RequestMapping("update.do")
	public String update(Model model, String page, int no){
		
		CustomerVO vo=dao.customerUpdate(no);
		
		model.addAttribute("vo",vo);
		model.addAttribute("no", no);
		model.addAttribute("jsp", "../customer/update.jsp");
		
		return "main/main";
	}
	
	//QNA 수정 OK
	@RequestMapping("update_ok.do")
	public String update_ok(Model model, String content, String subject, int no, String page){
		
		CustomerVO vo = new CustomerVO();
		vo.setQcontent(content);
		vo.setQsubject(subject);
		vo.setQno(no);
		
		dao.customerUpdate_ok(vo);
		
		model.addAttribute("page", page);
		
		return "customer/update_ok";
	}
	
	//QNA 삭제
	@RequestMapping("delete.do")
	public String delete(Model model, String strPage, String strNo, String subject, String content){
		try{
			int no=Integer.parseInt(strNo);
			
			//vo 껍데기를 만들어 컬럼 넣기
			CustomerVO vo = new CustomerVO();
			vo.setQcontent(content);
			vo.setQsubject(subject);
			vo.setQno(no);
			dao.customerDelete(vo);
			model.addAttribute("page", strPage);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		return "customer/delete";
	}
	
	//FAQ 보기
	@RequestMapping("faq.do")
	public String main(Model model){
		
		List<CustomerVO> list = dao.getfaqList();
		model.addAttribute("list", list);
		model.addAttribute("jsp", "../customer/faq.jsp");
		
		return "main/main";
	}
}