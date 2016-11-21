package com.cinema.customer.dao;

import java.util.*;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class CustomerDAO extends SqlSessionDaoSupport{
	
	//고객센터 리스트 불러오기
	public List<CustomerVO> getcustomerList(Map map){
		List<CustomerVO> list = getSqlSession().selectList("CList", map);
		return list;
	}
	
	//총 페이지 표시하여 출력할 수 있게 해주기
	public int customerTotal() {
		int total = getSqlSession().selectOne("CTotal");
		return total;
		
	}
	
	//QnA 글쓰기
	public void customerInsert(CustomerVO vo){
		getSqlSession().insert("CInsert", vo);
	}
	
	//QnA컨텐츠 내용보기
	public CustomerVO customerContent(int no){
		//클릭시 조회수를 하나씩 늘려줌
		getSqlSession().update("CHit", no);
		CustomerVO vo = getSqlSession().selectOne("CContent", no);
		return vo;
	}
	
	//QnA 수정하기에서 insert와 같은 기능
	public CustomerVO customerUpdate(int no){
		CustomerVO vo = getSqlSession().selectOne("CContent", no);
		return vo;
	}
	
	//수정하기했을때 DB와 연동하여 수정해주는 기능
	public void customerUpdate_ok(CustomerVO vo){
		getSqlSession().update("CUpdate", vo);
	}
	
	
	public List<CustomerVO> getfaqList(){
		List<CustomerVO> list = getSqlSession().selectList("faqlist");
		return list;
	}
	
	//삭제 기능
	public void customerDelete(CustomerVO vo){
		getSqlSession().delete("CDelete", vo);
	}
	
	//답변에서 insert와 같은 기능
	public void customerReply(CustomerVO vo){
		getSqlSession().insert("CReply", vo);
	}
	
	//부모글 구분하는 기능
	public CustomerVO customerGroupData(int qno){
		CustomerVO vo = getSqlSession().selectOne("GroupData", qno);
		return vo;
	}
	
	public void StepUpdate(CustomerVO vo){
		getSqlSession().update("StepUpdate",vo);
	}
}