package com.cinema.dao.member;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cinema.dao.reserve.ReserveVO;

/*import java.io.*;
import java.util.*;

import javax.websocket.Session;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.cinema.dao.CreateSqlSessionFactory;*/

public class MemberDAO extends SqlSessionDaoSupport{
	public void memberInsert(MemberVO vo){
		getSqlSession().insert("memberInsert",vo);
	}
	
	public int memberIdCheck(String id){
		int check= getSqlSession().selectOne("memberIdCheck",id);
		return check;
	}
	
	public MemberVO memberGetInfo(String id){
		MemberVO list=getSqlSession().selectOne("memberInfo",id);		
		return list;		
	}
	
	public MemberVO memberGetAllInfo(int no){
		MemberVO list=getSqlSession().selectOne("memberAllInfo",no);		
		return list;		
	}
	
	public String memberFindId(MemberVO vo){
		String id=getSqlSession().selectOne("memberFindId",vo);
		return id;
		
	}
	
	public String memberFindPwd(MemberVO vo){
		String pwd=getSqlSession().selectOne("memberFindPwd",vo);		
		return pwd;
		
	}
	
	public void memberDelete(int no){
		int i=getSqlSession().delete("memberDelete", no);
	}
	
	public int memberOverlab(String id){
		int countid=getSqlSession().selectOne("memberOverlab", id);
		return countid;
	}
	
	public String memberGetPwd(int no){
		String pwd=getSqlSession().selectOne("memberGetPwd",no);
		return pwd;
	}
	
	public void memberModify(MemberVO vo){
		getSqlSession().update("memberModify",vo);
	}
	
	public void memberChangePwd(MemberVO vo){
		getSqlSession().update("memberChangePwd",vo);
	}
	
	public List<MemberReserveListVO> memberWhatchData(int no){
		List<MemberReserveListVO> list=getSqlSession().selectList("memberWhatchData",no);
		return list;		
	}
	
	public List<MemberReserveListVO> memberReserveList(int no){
		List<MemberReserveListVO> list=getSqlSession().selectList("memberReserveList",no);
		return list;		
	}
	
	public int ReserveCount(int no){
		int total=getSqlSession().selectOne("ReserveCount",no);				
		return total;
	}
	
	public int ReserveCount2(int no){
		int total=getSqlSession().selectOne("ReserveCount2",no);				
		return total;
	}

}
