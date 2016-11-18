package com.cinema.member.dao;

/*import java.io.*;
import java.util.*;

import javax.websocket.Session;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.cinema.dao.CreateSqlSessionFactory;*/

public class MemberDAO {
	/*private static SqlSessionFactory ssf; //생성하면 db connection
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static void memberInsert(MemberVO vo){
		SqlSession session=ssf.openSession();
		session.insert("memberInsert",vo);
		session.commit();
		session.close();
	}
	
	public static int memberIdCheck(String id){
		SqlSession session=ssf.openSession();
		int check=session.selectOne("memberIdCheck",id);
		session.close();
		return check;
	}
	
	public static MemberVO memberGetImfor(String id){
		SqlSession session=ssf.openSession();		
		MemberVO list=session.selectOne("memberImfor",id);		
		session.close();
		return list;		
	}
	
	public static MemberVO memberGetAllImfor(int no){
		SqlSession session=ssf.openSession();		
		MemberVO list=session.selectOne("memberAllImfor",no);		
		session.close();
		return list;		
	}
	
	public static String memberFindId(MemberVO vo){
		SqlSession session=ssf.openSession();
		String id=session.selectOne("memberFindId",vo);
		session.close();		
		return id;
		
	}
	
	public static String memberFindPwd(MemberVO vo){
		SqlSession session=ssf.openSession();
		String pwd=session.selectOne("memberFindPwd",vo);		
		session.close();		
		return pwd;
		
	}
	
	public static void memberDelete(MemberVO vo){
		SqlSession session=ssf.openSession();
		int i=session.delete("memberDelete",vo);
		System.out.println(i);
		session.commit();
		session.close();
	}
	
	public static int memberOverlab(String id){
		SqlSession session=ssf.openSession();
		int countid=session.selectOne("memberOverlab", id);
		session.close();
		return countid;
	}
	
	public static String memberGetPwd(int no){
		SqlSession session=ssf.openSession();
		String pwd=session.selectOne("memberGetPwd",no);
		session.close();
		return pwd;
	}
	
	public static void memberModify(MemberVO vo){
		SqlSession session=ssf.openSession();
		session.update("memberModify",vo);
		session.commit();
		session.close();		
	}
	
	public static void memberChangePwd(MemberVO vo){
		SqlSession session=ssf.openSession();
		session.update("memberChangePwd",vo);
		System.out.println(vo.getPwd()+" ---- DAO입니다");
		System.out.println(vo.getNo()+" ---- DAO입니다");
		session.commit();
		session.close();		
	}
	
	public static List<MemberReserveListVO> memberWhatchData(int no){
		SqlSession session=ssf.openSession();
		List<MemberReserveListVO> list=session.selectList("memberWhatchData",no);
		session.close();
		return list;		
	}
	
	public static List<MemberReserveListVO> memberReserveList(int no){//@@@@@@@@@@@
		SqlSession session=ssf.openSession();
		List<MemberReserveListVO> list=session.selectList("memberReserveList",no);
		session.close();
		return list;		
	}
	
	public static int ReserveCount(int no){
		SqlSession session=ssf.openSession();
		int total=session.selectOne("ReserveCount",no);				
		session.close();
		return total;
	}
	
	public static int ReserveCount2(int no){
		SqlSession session=ssf.openSession();
		int total=session.selectOne("ReserveCount2",no);				
		session.close();
		return total;
	}*/

}
