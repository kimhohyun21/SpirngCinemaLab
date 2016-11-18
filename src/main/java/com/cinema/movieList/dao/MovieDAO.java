package com.cinema.movieList.dao;

/*import java.util.*;
import org.apache.ibatis.session.*;
import com.cinema.dao.CreateSqlSessionFactory;*/

public class MovieDAO {
	/*private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	//영화 리스트 불러오기
	public static List<MovieVO> getmovieList(int type2){
		SqlSession session = ssf.openSession();
		System.out.println(type2);
		List<MovieVO> list = session.selectList("Mlist",type2);
		session.close();
		
		return list;
	}
	
	//영화 상세 내용 불러오기
	public static MovieVO getmoviedetail(int mNo){
		SqlSession session = ssf.openSession();
		System.out.println(mNo);
		MovieVO vo = session.selectOne("Mdetail",mNo);
		session.close();
		
		return vo;
	}
	
	//영화 출연 배우 불러오기
	public static List<MovieVO> getmoviecharacter(int mNo){
		SqlSession session = ssf.openSession();
		System.out.println(mNo);
		List<MovieVO> list = session.selectList("Mcharacter",mNo);
		session.close();
		
		return list;
	}
	
	//댓글 출력
	public static List<MovieVO> getReplyData(Map map){
		SqlSession session=ssf.openSession();
		List<MovieVO> replyList=session.selectList("MReplyData",map);
		session.close();
		
		return replyList;
	}
	
	//댓글 삽입
	public static void replyInsert(MovieVO vo){
		SqlSession session=ssf.openSession();
		session.insert("replyInsert",vo);
		session.commit();
		session.close();
	}
	
	//댓글 총 페이지
	public static int replyTotalPage(int mNo){
		SqlSession session=ssf.openSession();
		int totalpage=session.selectOne("replyTotalPage",mNo);
		session.close();
		
		return totalpage;
	}
	
	//총 댓글 카운트
	public static int replyCount(int mNo){
		SqlSession session=ssf.openSession();
		int count=session.selectOne("replyCount",mNo);
		session.close();
		
		return count;
	}
	
	//댓글 삭제
	public static void replyDelete(int reNo){
		SqlSession session=ssf.openSession();
		session.delete("replyDelete",reNo);
		session.commit();
		session.close();
	}
	
	//댓글 총평점
	public static int replyTotalScore(int mNo){
		SqlSession session=ssf.openSession();
		int totalScore=session.selectOne("replyTotalScore", mNo);
		session.close();
		
		return totalScore;
	}
	
	//댓글 평점 업데이트
	public static void movieLikeUpdate(Map map){
		SqlSession session=ssf.openSession();
		session.update("movieLikeUpdate", map);
		session.commit();
		session.close();
	}
	
	//댓글 기록 여부 확인
	public static int replyRecordCheck(Map map){
		SqlSession session=ssf.openSession();
		//해당 영화에 댓글 작성한적 있으면
		int count=session.selectOne("replyRecordCheck",map);
		System.out.println("체크"+count);
		//해당 영화에 댓글 작성한 적 없으면
		session.close();
		
		return count;
	}*/
}





















