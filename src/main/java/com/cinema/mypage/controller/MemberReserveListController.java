package com.cinema.mypage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.*;

@Controller
public class MemberReserveListController {
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("reserveList.do")
	public String reserveList(Model model, String no, String type, String sPage) {
		//���ų���,�������� ����
		int ino = Integer.parseInt(no);
		List<MemberReserveListVO> list;
		
		//������ ���
		if(sPage==null) sPage="1";
		
		int page=Integer.parseInt(sPage);	// ����������
		int start;							// ó����ȣ
		int end;							// ��������ȣ
		int row=3;							// �÷� ������
		int rowCount;						// �� ����
		int totalPage=1;					// �� ������
		int block;
		int fromPage;
		int toPage;
		
		if (type == null)
			type = "0";
		
		if (type.equals("1")) {	// ��������			
			list = dao.memberWhatchData(ino);
			//������������
			rowCount=dao.ReserveCount(ino);
			
		} else {		//���ų���
			list = dao.memberReserveList(ino);
			//������������
			rowCount=dao.ReserveCount2(ino);
		}
		
		//��¥���� �ٲٱ� )yyyy-MM-dd HH:mm:ss -> yyyy.MM.dd
		try {
			for (MemberReserveListVO vo : list) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				String sDate = sdf.format(vo.getRdate());
				vo.setListdate(sDate);
			}			
		} catch (Exception e) {
				System.out.println(e.getMessage());
		}
		
		//������ ���ϱ�	
		start = (page*row)-(row); // 0, 3, 6...
		end = (page*row)-1; // 2, 5, 8
		totalPage=(rowCount/row)+1;
		
		//������ �ѹ���
		block=5;
		fromPage=((page-1)/block*block)+1;
		toPage=((page-1)/block*block)+block;
		
		if(toPage>totalPage)
			toPage=totalPage;
		
		//������� �񱳿�
		Date today=new Date();
		
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("page", page);		
		model.addAttribute("today", today);	
		model.addAttribute("type", type);
		model.addAttribute("list", list);
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/reserveList.jsp");

		return "main/main";
	}
}
