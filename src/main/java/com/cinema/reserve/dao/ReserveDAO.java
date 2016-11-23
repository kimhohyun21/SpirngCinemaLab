package com.cinema.reserve.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ReserveDAO extends SqlSessionDaoSupport{
	
	
	//���� ����Ʈ �޾ƿ���
	public List<ReserveVO> localData(){		
		List<ReserveVO> localList=getSqlSession().selectList("localData");
		return localList;
	}
	
	//������ ��ȭ�� ���� ��������
	public List<ReserveVO> theaterData(String local){
		List<ReserveVO> theaterList=getSqlSession().selectList("theaterData",local);
		return theaterList;
	}	
	
	//��ȭ���� ��ȭ ���� ��������
	public List<ReserveVO> movieData(String tname){		
		List<ReserveVO> movieList=getSqlSession().selectList("movieData", tname);
		return movieList;
	}
	
	//��ȭ�� �󿵰� ���� ��������
	public int theaterNoData(Map map){
		int theaterNo2=getSqlSession().selectOne("theaterNoData",map);
		return theaterNo2;
	}
	
	//��ȭ�� �󿵽ð� ���� ��������
	public List<ReserveVO> timeData(Map map){
		List<ReserveVO> timeList=getSqlSession().selectList("timeData", map);
		return timeList;
	}
	
	//����� �¼���ȣ ��������
	public List<ReserveVO> reserveData(Map map){
		List<ReserveVO> rlist=getSqlSession().selectList("reserveData",map);
		return rlist;
	}
	
	//�󿵰� ��ȣ ��������
	public int getTno(Map map){
		int tno=getSqlSession().selectOne("getTno", map);
		return tno;
	}
	
	//���� ������ ������Ʈ
	public void regReserve(Map map){
		getSqlSession().insert("regReserve", map);
	}
	
	//��ü ���� �� ��������
	public int getTotalReserve(){
		int totalReserve=getSqlSession().selectOne("getTotalReserve");		
		return totalReserve;
	}
	
	//Ư�� ��ȭ�� ���� �� ��������
	public int getReserveNum(String title){
		int reserveNum=getSqlSession().selectOne("getReserveNum", title);
		return reserveNum;
	}
	
	//������ ������Ʈ
	public void updateRank(Map map){
		getSqlSession().update("updateRank", map);
	}
	
	//��� ���� ��������
	public ReserveVO getReserveData(int rNo){
		ReserveVO vo=getSqlSession().selectOne("getReserveData", rNo);
		return vo;
	}	

	//���� ��ȣ ��������
	public int getRno(String pid){
		int rNo=getSqlSession().selectOne("getRno", pid);
		return rNo;
	}
	
	//��� ���� ������Ʈ
	public void updateCancel(int rNo){
		getSqlSession().update("updateCancel", rNo);
	}
	
	//��ȭ ��ȣ �޾ƿ���
	public int getMno(String title){
		int nMo=getSqlSession().selectOne("getMno", title);
		return nMo;
	}
}
















