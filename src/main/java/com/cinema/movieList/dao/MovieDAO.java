package com.cinema.movieList.dao;

/*import java.util.*;
import org.apache.ibatis.session.*;
import com.cinema.dao.CreateSqlSessionFactory;*/

public class MovieDAO {
	/*private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	//��ȭ ����Ʈ �ҷ�����
	public static List<MovieVO> getmovieList(int type2){
		SqlSession session = ssf.openSession();
		System.out.println(type2);
		List<MovieVO> list = session.selectList("Mlist",type2);
		session.close();
		
		return list;
	}
	
	//��ȭ �� ���� �ҷ�����
	public static MovieVO getmoviedetail(int mNo){
		SqlSession session = ssf.openSession();
		System.out.println(mNo);
		MovieVO vo = session.selectOne("Mdetail",mNo);
		session.close();
		
		return vo;
	}
	
	//��ȭ �⿬ ��� �ҷ�����
	public static List<MovieVO> getmoviecharacter(int mNo){
		SqlSession session = ssf.openSession();
		System.out.println(mNo);
		List<MovieVO> list = session.selectList("Mcharacter",mNo);
		session.close();
		
		return list;
	}
	
	//��� ���
	public static List<MovieVO> getReplyData(Map map){
		SqlSession session=ssf.openSession();
		List<MovieVO> replyList=session.selectList("MReplyData",map);
		session.close();
		
		return replyList;
	}
	
	//��� ����
	public static void replyInsert(MovieVO vo){
		SqlSession session=ssf.openSession();
		session.insert("replyInsert",vo);
		session.commit();
		session.close();
	}
	
	//��� �� ������
	public static int replyTotalPage(int mNo){
		SqlSession session=ssf.openSession();
		int totalpage=session.selectOne("replyTotalPage",mNo);
		session.close();
		
		return totalpage;
	}
	
	//�� ��� ī��Ʈ
	public static int replyCount(int mNo){
		SqlSession session=ssf.openSession();
		int count=session.selectOne("replyCount",mNo);
		session.close();
		
		return count;
	}
	
	//��� ����
	public static void replyDelete(int reNo){
		SqlSession session=ssf.openSession();
		session.delete("replyDelete",reNo);
		session.commit();
		session.close();
	}
	
	//��� ������
	public static int replyTotalScore(int mNo){
		SqlSession session=ssf.openSession();
		int totalScore=session.selectOne("replyTotalScore", mNo);
		session.close();
		
		return totalScore;
	}
	
	//��� ���� ������Ʈ
	public static void movieLikeUpdate(Map map){
		SqlSession session=ssf.openSession();
		session.update("movieLikeUpdate", map);
		session.commit();
		session.close();
	}
	
	//��� ��� ���� Ȯ��
	public static int replyRecordCheck(Map map){
		SqlSession session=ssf.openSession();
		//�ش� ��ȭ�� ��� �ۼ����� ������
		int count=session.selectOne("replyRecordCheck",map);
		System.out.println("üũ"+count);
		//�ش� ��ȭ�� ��� �ۼ��� �� ������
		session.close();
		
		return count;
	}*/
}





















