package com.cinema.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.member.dao.*;

@Controller
public class MyPageController {
	@Autowired
	private MemberDAO dao;
	
	//���� ���� ����Ʈ
	@RequestMapping("reserveList.do")
	public String reserveList(Model model, String no, String type, String sPage) {
		//���ų���,�������� ����
		int ino = Integer.parseInt(no);
		List<MemberReserveListVO> list;
		
		//������ ���
		if(sPage==null || sPage.equals("0")) sPage="1";
		int curpage=Integer.parseInt(sPage);	// ����������
		int rowSize=5;						//�÷�������
		int start;						
		int end;							// ��������ȣ						
		int rowCount;						// �� ����
		int totalPage;					// �� ������
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
		start = (curpage*rowSize)-(rowSize-1); // 0, 3, 6...
		end = curpage*rowSize; // 2, 5, 8
		totalPage=(rowCount/rowSize)+1;
		if(totalPage==0) curpage=0;
		
		//������ �ѹ���
		block=5;
		fromPage=((curpage-1)/block*block)+1;
		toPage=((curpage-1)/block*block)+block;
		
		if(toPage>totalPage)
			toPage=totalPage;
		
		//������� �񱳿�
		Date today=new Date();
		
		//�޴� ���� ��������
		String menuType="reserveList";
		
		model.addAttribute("menuType", menuType);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("curpage", curpage);		
		model.addAttribute("today", today);	
		model.addAttribute("type", type);
		model.addAttribute("list", list);
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/mypage_reserveList.jsp");

		return "main/main";
	}
	
	
	//ȸ������ ����
	@RequestMapping("memberModify.do")
	public String memberModify(Model model, String strno){
		int no=Integer.parseInt(strno);		
		MemberVO vo=dao.memberGetAllImfor(no);
		String birth=vo.getBirth();
		String phone=vo.getPhone();
		String name=vo.getName();
		
		// �Է��� ���߱�  )1998-11-11 => 19981111
		birth=birth.replace("-", "");
		phone=phone.replace("-", "");
		
		//�޴� ���� ��������
		String menuType="memberModify";
		
		model.addAttribute("menuType", menuType);		
		model.addAttribute("name", name);
		model.addAttribute("phone", phone);
		model.addAttribute("birth", birth);
		
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/mypage_modify.jsp");
		
		return "main/main";
	}
	
	//ȸ�� ���� ���� OK
	@RequestMapping("modify_ok.do")
	public String memberModify_Ok(Model model, String strno, String pwd, String name, 
								  String phone, String birth, HttpSession session){
		int no=Integer.parseInt(strno);		
		// DB��
		MemberVO vo=dao.memberGetAllImfor(no);		
		String db_pwd=vo.getPwd();
	
		boolean pCheck=false;
		if(db_pwd.equals(pwd)){
			pCheck=true;
			phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
			
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setPhone(phone);
			vo.setBirth(birth);
			vo.setNo(no);
			dao.memberModify(vo);
			//�ٲﰪ ���ǿ� ��������
			session.removeAttribute("mvo");
			session.setAttribute("mvo", vo);			
		}else{
			pCheck=false;
		}
		model.addAttribute("pCheck", pCheck);
		
		return "mypage/mypage_modify_ok";
	}
	
	//ȸ�� ��й�ȣ ����
	@RequestMapping("memberChangePwd.do")
	public String memberChangePwd(Model model){
		
		//�޴� ���� ��������
		String menuType="memberChangePwd";
		
		model.addAttribute("menuType", menuType);	
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/mypage_change_pwd.jsp");
		return "main/main";
	}
	
	//��� ��ȣ ���� OK
	@RequestMapping("MemeberChangePwd.do")
	public String ChangePwdOk(Model model, String strno, String pwd, String change_pwd) {
		int no=Integer.parseInt(strno);
		MemberVO vo=dao.memberGetAllImfor(no);

		// DB�� ��������
		String db_pwd = vo.getPwd();
		boolean pCheck = false;
		
		if (db_pwd.equals(pwd)) {
			pCheck = true;
			// �ٲ� ��й�ȣ
			vo.setNo(no);
			vo.setPwd(change_pwd);
			dao.memberChangePwd(vo);
		} else {
			pCheck = false;
		}
		model.addAttribute("pCheck", pCheck);

		return "mypage/mypage_change_pwd_ok";
	}
	
	//ȸ�� Ż��
	@RequestMapping("memberDelete.do")
	public String memberDelete(Model model){
		
		//�޴� ���� ��������
		String menuType="memberDelete";
		
		model.addAttribute("menuType", menuType);		
		model.addAttribute("jsp", "../mypage/mypage.jsp");
		model.addAttribute("jsp2", "../mypage/mypage_delete.jsp");
		return "main/main";
	}
	
	//ȸ�� Ż�� OK
	@RequestMapping("delete_ok.do")
	public String delete_ok(Model model, String strno, String pwd, HttpSession session){
		try{
			int no=Integer.parseInt(strno);
			MemberVO vo=dao.memberGetAllImfor(no);
			//DB��
			String db_pwd=vo.getPwd();			
			
			int check=3;
			
			if(db_pwd.equals(pwd)){
				dao.memberDelete(vo);
				//������ ���ǳ�����
				session.invalidate();
				check=1;
			}else{
				check=0;
			}
			model.addAttribute("check", check);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		
		return "mypage/mypage_delete_ok";
	}
}