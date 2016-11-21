package com.cinema.movieList.dao;

import java.util.*;
import org.mybatis.spring.support.*;

public class MovieDAO extends SqlSessionDaoSupport{
	
	//¿µÈ­ ¸®½ºÆ® ºÒ·¯¿À±â
	public List<MovieVO> getmovieList(int type2){
		List<MovieVO> list = getSqlSession().selectList("Mlist",type2);
		return list;
	}
	
	//¿µÈ­ »ó¼¼ ³»¿ë ºÒ·¯¿À±â
	public MovieVO getmoviedetail(int mNo){
		MovieVO vo = getSqlSession().selectOne("Mdetail",mNo);
		return vo;
	}
	
	//¿µÈ­ Ãâ¿¬ ¹è¿ì ºÒ·¯¿À±â
	public List<MovieVO> getmoviecharacter(int mNo){
		List<MovieVO> list = getSqlSession().selectList("Mcharacter",mNo);
		return list;
	}
	
	//´ñ±Û Ãâ·Â
	public List<MovieVO> getReplyData(Map map){
		List<MovieVO> replyList=getSqlSession().selectList("MReplyData",map);
		return replyList;
	}
	
	//´ñ±Û »ðÀÔ
	public void replyInsert(MovieVO vo){
		getSqlSession().insert("replyInsert",vo);
	}
	
	//´ñ±Û ÃÑ ÆäÀÌÁö
	public int replyTotalPage(int mNo){
		int totalpage=getSqlSession().selectOne("replyTotalPage",mNo);
		return totalpage;
	}
	
	//ÃÑ ´ñ±Û Ä«¿îÆ®
	public int replyCount(int mNo){
		int count=getSqlSession().selectOne("replyCount",mNo);
		return count;
	}
	
	//´ñ±Û »èÁ¦
	public void replyDelete(int reNo){
		getSqlSession().delete("replyDelete",reNo);
	}
	
	//´ñ±Û ÃÑÆòÁ¡
	public int replyTotalScore(int mNo){
		int totalScore=getSqlSession().selectOne("replyTotalScore", mNo);
		return totalScore;
	}
	
	//´ñ±Û ÆòÁ¡ ¾÷µ¥ÀÌÆ®
	public void movieLikeUpdate(Map map){
		getSqlSession().update("movieLikeUpdate", map);
	}
	
	//´ñ±Û ±â·Ï ¿©ºÎ È®ÀÎ
	public int replyRecordCheck(Map map){
		//ÇØ´ç ¿µÈ­¿¡ ´ñ±Û ÀÛ¼ºÇÑÀû ÀÖÀ¸¸é
		int count=getSqlSession().selectOne("replyRecordCheck",map);
		return count;
	}
}
