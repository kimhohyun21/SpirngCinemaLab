package com.cinema.admin.controller.chara;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;

@Controller
public class ACharUpdateController {
	@Autowired
	AdminDAO dao;
	
	@RequestMapping("ACUpdate.do")
	public String charUpdate(Model model, String name, String img,
			String cno, String title1, String title2, 
			String title3, String title4, String title5){
		
		int no=Integer.parseInt(cno);
		String title[]={title1,title2,title3,title4,title5};
		Map map = new HashMap();
		
		for(String t:title){
			//입력사항 없을때
			if(t=="")
				break;
			
			int mno=dao.AtitleToMno(t);			
			
		}
		
		
		return "main/main";
	}
}
