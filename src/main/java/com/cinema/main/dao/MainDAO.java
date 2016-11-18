package com.cinema.main.dao;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class MainDAO extends SqlSessionDaoSupport{	
	//메인 페이지에 필요한 영화 정보 가져오기
	public List<MainVO> getMovieListData(){		
		List<MainVO> list=getSqlSession().selectList("getMovieListData");	
		return list;
	}
}
