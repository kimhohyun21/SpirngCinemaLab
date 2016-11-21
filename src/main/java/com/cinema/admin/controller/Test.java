package com.cinema.admin.controller;

import java.util.List;
import java.util.Map;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

public class Test {
	public static void main(String[] args) {
		AdminDAO dao=new AdminDAO();
		List<MovieVO> list = dao.movieCharName(5);
		for (MovieVO vo : list) {
			String[] actor={vo.getCname()};
			System.out.println(actor[0]);
			System.out.println(actor);
		}
	}
}
