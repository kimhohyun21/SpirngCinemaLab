package com.cinema.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cinema.movieList.dao.MovieVO;

public class AdminDAO extends SqlSessionDaoSupport{
	
	public List<MovieVO> adminMovieAllList(){
		List<MovieVO> list=getSqlSession().selectList("AMovieAllList");			
		return list;
	}
	
	
	//예매 리스트 불러오기
	public List<ReserveListVO> reserveList(Map map){		
		List<ReserveListVO> list = getSqlSession().selectList("RList", map);		
		return list;
	}
	
	//총 페이지 수 불러오기
	public  int reserveTotal() {		
		int total = getSqlSession().selectOne("RTotal");				
		return total;
	}
	
	//예매 내역 컨텐츠 불러오기
	public ReserveListVO reserveContent(int no){		
		ReserveListVO vo = getSqlSession().selectOne("RContent",no);		
		return vo;
	}
	
	
	public MovieVO adminMovieData(int no){		
		MovieVO vo=getSqlSession().selectOne("AMovieData",no);		
		return vo;
	}
	
	public  void adminMovieModify(MovieVO vo){		
		getSqlSession().update("AMovieModify",vo);
		getSqlSession().commit();		
	}
	
	public void adminMovieInsert(MovieVO vo){
		getSqlSession().insert("AMovieInsert",vo);
		getSqlSession().commit();		
	}
	
	public int adminMovieCount(){		
		int count=getSqlSession().selectOne("AMovieCount");		
		return count;
	}
	
	public List<MovieVO> AcharAllData(){		
		List<MovieVO> list=getSqlSession().selectList("AcharAllData");		
		return list;
	}
	
	public List<MovieVO> movieCharData(int no){		
		List<MovieVO> list=getSqlSession().selectList("AmovieActorData",no);		
		return list;
	}
	
	public int AactorMno(Map map){
		int mno=getSqlSession().selectOne("AactorMno",map);
		return mno;
	}
	
	public void AactorDeleteMno(Map map){
		getSqlSession().update("AactorDeleteMno",map);		
	}
	
	public void AactorInsertMno(Map map){
		getSqlSession().update("AactorInsertMno",map);		
	}
	
	public List<MovieVO> AactorAllMno(int cno){
		List<MovieVO> vo=getSqlSession().selectList("AactorAllMno", cno);
		return vo;
	}
	
	public int ACharCount(){
		int count=getSqlSession().selectOne("AcharCount");
		return count;
	}
	
	public MovieVO AcharContent(int cno){
		MovieVO vo=getSqlSession().selectOne("AcharContent",cno);
		return vo;
	}
	
	public List<MovieVO> AmovieAllData(){
		List<MovieVO> list=getSqlSession().selectList("AmovieAllData");
		return list;
	}
	
	public void ACmodify(Map map){
		getSqlSession().update("ACmodify",map);
	}
	
	public void ACharInsert(Map map){
		getSqlSession().insert("ACharInsert",map);
	}
}
