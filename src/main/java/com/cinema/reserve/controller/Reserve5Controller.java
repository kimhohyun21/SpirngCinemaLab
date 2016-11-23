package com.cinema.reserve.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.member.dao.MemberVO;
import com.cinema.reserve.dao.ReserveDAO;
import com.cinema.reserve.dao.ReserveVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class Reserve5Controller {
	
	@Autowired
	public ReserveDAO dao;
	
	/*@RequestMapping("reserve5_Cancel.do")
	@ResponseBody
	public Map reserve5_Cancel(Model model, String rno, String pid, String title, HttpSession session){
		//��û���� �޾ƿ���
		int rNo=0;
		if(pid!=null)rNo=dao.getRno(pid);
		if(rno!=null){
			rNo=Integer.parseInt(rno);
			ReserveVO vo=dao.getReserveData(rNo);
			pid=vo.getPaymentId();
		}
		
		//��Ҹ� ���� Ŭ���̾�Ʈ ����
		IamportClient client;
		String api_key = "9046148780607955";
		String api_secret = "lSLsAIFwNaaTD0Cs2dtMaYiSrZRvwEERxqk89ZEWaPQOPsgSGKEQIXI9WzFsejkLJETSEyPOnFCd8T5O";
		client = new IamportClient(api_key, api_secret);
		
		//��� ���� ���� ���
		IamportResponse<AccessToken> auth_response = client.getAuth();
		
		//��� ����
		boolean cancelCheck=false;
		String cancelMsg="���Ű� ��ҵǾ����ϴ�.";
		if(auth_response.getResponse()!=null){
			CancelData cancel_data = new CancelData(pid, true);
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			if(payment_response.getResponse()!=null){ //������ ��忡�� �Ϸ� ������ �ڵ� ��� �Ǵ� ��� ������ �ּ�ó��
				cancelCheck=true;
				
				//���� ���� ���� ó��
				dao.updateCancel(rNo);
				
				//������ ����
				int totalReserve=dao.getTotalReserve();
				int reserveNum=dao.getReserveNum(title);
				double reserveRate=((double)reserveNum/totalReserve)*100;	
				double rank = Double.parseDouble(String.format("%.2f",reserveRate));

				Map map=new HashMap();
				map.put("title", title);
				map.put("rank", rank);
				dao.updateRank(map);	
				
			}else{
				cancelMsg=payment_response.getResponse().getFailReason();				
			  }			  
			 				
		}
		
		//���� ���� ���
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		
		Map map=new HashMap();
		map.put("no", mvo.getNo());
		map.put("cancelMsg", cancelMsg);
		map.put("cancelCheck", cancelCheck);
		
		return map;
	}*/
}
