package com.cinema.main.dao;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class MainDAO extends SqlSessionDaoSupport{	
	//���� �������� �ʿ��� ��ȭ ���� ��������
	public List<MainVO> getMovieListData(){		
		List<MainVO> list=getSqlSession().selectList("getMovieListData");	
		return list;
	}
}
