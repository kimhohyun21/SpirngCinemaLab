package com.cinema.movieList.dao;

import java.util.*;
import org.mybatis.spring.support.*;

public class MovieDAO extends SqlSessionDaoSupport{
	
	//��ȭ ����Ʈ �ҷ�����
	public List<MovieVO> getmovieList(int type2){
		List<MovieVO> list = getSqlSession().selectList("Mlist",type2);
		return list;
	}
	
	//��ȭ �� ���� �ҷ�����
	public MovieVO getmoviedetail(int mNo){
		MovieVO vo = getSqlSession().selectOne("Mdetail",mNo);
		return vo;
	}
	
	//��ȭ �⿬ ��� �ҷ�����
	public List<MovieVO> getmoviecharacter(int mNo){
		List<MovieVO> list = getSqlSession().selectList("Mcharacter",mNo);
		return list;
	}
	
	//��� ���
	public List<MovieVO> getReplyData(Map map){
		List<MovieVO> replyList=getSqlSession().selectList("MReplyData",map);
		return replyList;
	}
	
	//��� ����
	public void replyInsert(MovieVO vo){
		getSqlSession().insert("replyInsert",vo);
	}
	
	//��� �� ������
	public int replyTotalPage(int mNo){
		int totalpage=getSqlSession().selectOne("replyTotalPage",mNo);
		return totalpage;
	}
	
	//�� ��� ī��Ʈ
	public int replyCount(int mNo){
		int count=getSqlSession().selectOne("replyCount",mNo);
		return count;
	}
	
	//��� ����
	public void replyDelete(int reNo){
		getSqlSession().delete("replyDelete",reNo);
	}
	
	//��� ������
	public int replyTotalScore(int mNo){
		int totalScore=getSqlSession().selectOne("replyTotalScore", mNo);
		return totalScore;
	}
	
	//��� ���� ������Ʈ
	public void movieLikeUpdate(Map map){
		getSqlSession().update("movieLikeUpdate", map);
	}
	
	//��� ��� ���� Ȯ��
	public int replyRecordCheck(Map map){
		//�ش� ��ȭ�� ��� �ۼ����� ������
		int count=getSqlSession().selectOne("replyRecordCheck",map);
		return count;
	}
}
