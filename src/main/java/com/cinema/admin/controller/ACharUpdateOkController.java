package com.cinema.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class ACharUpdateOkController {
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("AcharUpdate_ok.do")
	public String charUpdateOk(Model model, String sno, String actor){
		//배우번호 나누기 현재 actor=1,2,3
		String actor1=actor.substring(0,1);
		String actor2=actor.substring(2,3);
		String actor3=actor.substring(4,5);
		System.out.println(actor1+actor2+actor3+"???");
		List<MovieVO> mnoList=dao.AgetActorMno(Integer.parseInt(actor1));
		for(MovieVO vo:mnoList){
			int i=1;
			System.out.println(vo.getMno1()+"    ^^"+"<-");
		}
		return null;
	}
}
