package com.cinema.reserve.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ReserveDAO extends SqlSessionDaoSupport{
	
	
	//지역 리스트 받아오기
	public List<ReserveVO> localData(){		
		List<ReserveVO> localList=getSqlSession().selectList("localData");
		return localList;
	}
	
	//지역별 영화관 정보 가져오기
	public List<ReserveVO> theaterData(String local){
		List<ReserveVO> theaterList=getSqlSession().selectList("theaterData",local);
		return theaterList;
	}	
	
	//영화관별 영화 정보 가져오기
	public List<ReserveVO> movieData(String tname){		
		List<ReserveVO> movieList=getSqlSession().selectList("movieData", tname);
		return movieList;
	}
	
	//영화별 상영관 정보 가져오기
	public int theaterNoData(Map map){
		int theaterNo2=getSqlSession().selectOne("theaterNoData",map);
		return theaterNo2;
	}
	
	//영화별 상영시간 정보 가져오기
	public List<ReserveVO> timeData(Map map){
		List<ReserveVO> timeList=getSqlSession().selectList("timeData", map);
		return timeList;
	}
	
	//예약된 좌석번호 가져오기
	public List<ReserveVO> reserveData(Map map){
		List<ReserveVO> rlist=getSqlSession().selectList("reserveData",map);
		return rlist;
	}
	
	//상영관 번호 가져오기
	public int getTno(Map map){
		int tno=getSqlSession().selectOne("getTno", map);
		return tno;
	}
	
	//예매 데이터 업데이트
	public void regReserve(Map map){
		getSqlSession().insert("regReserve", map);
	}
	
	//전체 예매 수 가져오기
	public int getTotalReserve(){
		int totalReserve=getSqlSession().selectOne("getTotalReserve");		
		return totalReserve;
	}
	
	//특정 영화의 예매 수 가져오기
	public int getReserveNum(String title){
		int reserveNum=getSqlSession().selectOne("getReserveNum", title);
		return reserveNum;
	}
	
	//예매율 업데이트
	public void updateRank(Map map){
		getSqlSession().update("updateRank", map);
	}
	
	//취소 정보 가져오기
	public ReserveVO getReserveData(int rNo){
		ReserveVO vo=getSqlSession().selectOne("getReserveData", rNo);
		return vo;
	}	

	//예약 번호 가져오기
	public int getRno(String pid){
		int rNo=getSqlSession().selectOne("getRno", pid);
		return rNo;
	}
	
	//취소 정보 업데이트
	public void updateCancel(int rNo){
		getSqlSession().update("updateCancel", rNo);
	}
	
	//영화 번호 받아오기
	public int getMno(String title){
		int nMo=getSqlSession().selectOne("getMno", title);
		return nMo;
	}
}
















