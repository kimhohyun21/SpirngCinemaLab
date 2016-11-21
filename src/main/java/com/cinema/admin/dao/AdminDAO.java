package com.cinema.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cinema.movieList.dao.MovieVO;

public class AdminDAO extends SqlSessionDaoSupport{
	
	public List<MovieVO> adminMovieAllList(){
		List<MovieVO> list=getSqlSession().selectList("AMovieAllList");
		//getSqlSession().close();	
		return list;
	}
	
	
	//���� ����Ʈ �ҷ�����
	public List<ReserveListVO> reserveList(Map map){		
		List<ReserveListVO> list = getSqlSession().selectList("RList", map);
		//getSqlSession().close();
		return list;
	}
	
	//�� ������ �� �ҷ�����
	public  int reserveTotal() {		
		int total = getSqlSession().selectOne("RTotal");
		//getSqlSession().close();		
		return total;
	}
	
	//���� ���� ������ �ҷ�����
	public ReserveListVO reserveContent(int no){		
		ReserveListVO vo = getSqlSession().selectOne("RContent",no);
		//getSqlSession().close();
		return vo;
	}
	
	
	public MovieVO adminMovieData(int no){		
		MovieVO vo=getSqlSession().selectOne("AMovieData",no);
		//getSqlSession().close();
		return vo;
	}
	
	public  void adminMovieModify(MovieVO vo){		
		getSqlSession().update("AMovieModify",vo);
		getSqlSession().commit();
		//getSqlSession().close();
	}
	
	public void adminMovieInsert(MovieVO vo){
		getSqlSession().insert("AMovieInsert",vo);
		getSqlSession().commit();
		//getSqlSession().close();
	}
	
	public int adminMovieCount(){		
		int count=getSqlSession().selectOne("AMovieCount");
		//getSqlSession().close();
		return count;
	}
	
	public List<MovieVO> AcharAllData(){		
		List<MovieVO> list=getSqlSession().selectList("AcharAllData");
		//getSqlSession().close();
		return list;
	}
	
	public List<MovieVO> movieCharName(int no){		
		List<MovieVO> list=getSqlSession().selectList("Aactortest",no);
		//getSqlSession().close();
		return list;
	}
}
