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
			String cno, String mno1, String mno2, 
			String mno3, String mno4, String mno5){
		int title1=Integer.parseInt(mno1);
		int title2=Integer.parseInt(mno2);
		int title3=Integer.parseInt(mno3);
		int title4=Integer.parseInt(mno4);
		int title5=Integer.parseInt(mno5);
		int title[]={title1,title2,title3,title4,title5};
			
		Map map = new HashMap();
		map.put("cno", Integer.parseInt(cno));
		map.put("cname", name);
		map.put("img", img);
		
		//이름,이미지 수정
		dao.ACmodify(map);
		
		//이전 mno1~mno5 삭제
		for(int i=1 ; i<6 ; i++){
			String mno="mno"+i;
			map.put("mno", mno);
			dao.AactorDeleteMno(map);
		}
		int i=0;
		for(int t:title){
			i++;			
			//영화를 안골랐을때
			if(t==0)
				break;
			map.put("movieNo", t);
			String mno="mno"+i;
			map.put("mno", mno);
			dao.AactorInsertMno(map);
		}
		
		model.addAttribute("go","AKL");
		return "adminpage/station";
	}
}
