package com.cinema.theater.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cinema.reserve.dao.ReserveVO;

public class TheaterDAO extends SqlSessionDaoSupport{
	public List<TheaterVO> localData2(){
		List<TheaterVO> localList=getSqlSession().selectList("localData2");
		return localList;
	}
	
	public List<TheaterVO> theaterData2(String local){
		List<TheaterVO> theaterList=getSqlSession().selectList("theaterData2",local);
		return theaterList;
	}
	
	public List<TheaterVO> movieData2(String theater){
		List<TheaterVO> movieList=getSqlSession().selectList("movieData2", theater);
		return movieList;
	}
	
	public List<TheaterVO> timeData2(Map map){
		List<TheaterVO> timeList=getSqlSession().selectList("timeData2", map);
		return timeList;
	}
	
	public int theaterNoData2(Map map){
		int theaterNo2=getSqlSession().selectOne("theaterNoData2",map);
		return theaterNo2;
	}
}
