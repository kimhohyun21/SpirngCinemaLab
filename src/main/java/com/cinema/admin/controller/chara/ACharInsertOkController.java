package com.cinema.admin.controller.chara;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;

@Controller
public class ACharInsertOkController {
	@Autowired
	AdminDAO dao;
	
	@RequestMapping("ACharInsert_ok.do")
	public String charInsertOk(Model model, String name, String img){
		Map map=new HashMap();
		map.put("name", name);
		map.put("img",img);
		
		dao.ACharInsert(map);
		model.addAttribute("go","ACL");
		return "adminpage/station";
	}
}
