package com.cinema.customer.dao;

import java.util.*;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class CustomerDAO extends SqlSessionDaoSupport{
	
	//������ ����Ʈ �ҷ�����
	public List<CustomerVO> getcustomerList(Map map){
		List<CustomerVO> list = getSqlSession().selectList("CList", map);
		return list;
	}
	
	//�� ������ ǥ���Ͽ� ����� �� �ְ� ���ֱ�
	public int customerTotal() {
		int total = getSqlSession().selectOne("CTotal");
		return total;
		
	}
	
	//QnA �۾���
	public void customerInsert(CustomerVO vo){
		getSqlSession().insert("CInsert", vo);
	}
	
	//QnA������ ���뺸��
	public CustomerVO customerContent(int no){
		//Ŭ���� ��ȸ���� �ϳ��� �÷���
		getSqlSession().update("CHit", no);
		CustomerVO vo = getSqlSession().selectOne("CContent", no);
		return vo;
	}
	
	//QnA �����ϱ⿡�� insert�� ���� ���
	public CustomerVO customerUpdate(int no){
		CustomerVO vo = getSqlSession().selectOne("CContent", no);
		return vo;
	}
	
	//�����ϱ������� DB�� �����Ͽ� �������ִ� ���
	public void customerUpdate_ok(CustomerVO vo){
		getSqlSession().update("CUpdate", vo);
	}
	
	
	public List<CustomerVO> getfaqList(){
		List<CustomerVO> list = getSqlSession().selectList("faqlist");
		return list;
	}
	
	//���� ���
	public void customerDelete(CustomerVO vo){
		getSqlSession().delete("CDelete", vo);
	}
	
	//�亯���� insert�� ���� ���
	public void customerReply(CustomerVO vo){
		getSqlSession().insert("CReply", vo);
	}
	
	//�θ�� �����ϴ� ���
	public CustomerVO customerGroupData(int qno){
		CustomerVO vo = getSqlSession().selectOne("GroupData", qno);
		return vo;
	}
	
	public void StepUpdate(CustomerVO vo){
		getSqlSession().update("StepUpdate",vo);
	}
}