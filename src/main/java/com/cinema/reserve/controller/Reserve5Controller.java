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
		//요청정보 받아오기
		int rNo=0;
		if(pid!=null)rNo=dao.getRno(pid);
		if(rno!=null){
			rNo=Integer.parseInt(rno);
			ReserveVO vo=dao.getReserveData(rNo);
			pid=vo.getPaymentId();
		}
		
		//취소를 위한 클라이언트 생성
		IamportClient client;
		String api_key = "9046148780607955";
		String api_secret = "lSLsAIFwNaaTD0Cs2dtMaYiSrZRvwEERxqk89ZEWaPQOPsgSGKEQIXI9WzFsejkLJETSEyPOnFCd8T5O";
		client = new IamportClient(api_key, api_secret);
		
		//취소 접근 권한 얻기
		IamportResponse<AccessToken> auth_response = client.getAuth();
		
		//취소 진행
		boolean cancelCheck=false;
		String cancelMsg="예매가 취소되었습니다.";
		if(auth_response.getResponse()!=null){
			CancelData cancel_data = new CancelData(pid, true);
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			if(payment_response.getResponse()!=null){ //개발자 모드에서 하루 지나면 자동 취소 되는 경우 때문에 주석처리
				cancelCheck=true;
				
				//예매 내역 삭제 처리
				dao.updateCancel(rNo);
				
				//예매율 수정
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
		
		//세션 정보 얻기
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		
		Map map=new HashMap();
		map.put("no", mvo.getNo());
		map.put("cancelMsg", cancelMsg);
		map.put("cancelCheck", cancelCheck);
		
		return map;
	}*/
}
