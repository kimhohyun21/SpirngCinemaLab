package com.cinema.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

public class Test {
	public static void main(String[] args) {
		
		AdminDAO dao=new AdminDAO();
		List<MovieVO> vo=dao.AactorAllMno(1);
		for(MovieVO voo:vo){
			System.out.println(voo.getMno1());
			System.out.println(voo.getMno2());
			System.out.println(voo.getMno3());
			System.out.println(voo.getMno4());
			System.out.println(voo.getMno5());
		}
		
		
	}
}
