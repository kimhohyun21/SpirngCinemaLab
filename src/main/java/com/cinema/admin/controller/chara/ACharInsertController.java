package com.cinema.admin.controller.chara;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ACharInsertController {
	
	@RequestMapping("ACharInsert.do")
	public String charInsert(Model model){
		
				
		model.addAttribute("jsp","../adminpage/char/charInsert.jsp");
		return "main/main";
	}
}
