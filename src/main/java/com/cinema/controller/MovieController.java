package com.cinema.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.cinema.dao.member.MemberVO;
import com.cinema.dao.movieList.*;

@Controller
public class MovieController {
	@Autowired
	private MovieDAO dao;
	
	//��ȭ ����Ʈ
	@RequestMapping("movieList.do")
	public String movieList(Model model, String type){
				
		if(type==null)
			type="1";
		int type2=Integer.parseInt(type);
		List<MovieVO> list=dao.getmovieList(type2);
		model.addAttribute("type", type);
		model.addAttribute("list", list);
		model.addAttribute("jsp", "../movie/movieList.jsp");
		
		return "main/main";
	}
	
	//��ȭ �� ������
	@RequestMapping("movieDetail.do")
	public String movieDetail(Model model, String no, String page,String type, 
								HttpSession session){
		try{
			Map map=new HashMap();
			int mNo = Integer.parseInt(no);
			MemberVO vo1 = (MemberVO) session.getAttribute("mvo");
			
			int check=0;
			if(vo1!=null){	//�α����� ���� ���
				int memberNo=vo1.getNo();
				
				//��� ��� ���� Ȯ��
				map.put("mNo", mNo);
				map.put("memberNo", memberNo);
				check=dao.replyRecordCheck(map);
			}
			
			//��ȭ �� ����
			MovieVO vo=dao.getmoviedetail(mNo);
			List<MovieVO> list = dao.getmoviecharacter(mNo);
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
			
			//������ ����
			if(page==null || page.equals("0")) page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=5;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			
			map=new HashMap();
			map.put("start", start);
			map.put("end",end);
			map.put("mNo", mNo);
			
			//��� �ִ� ��� �ѷ��ֱ�
			List<MovieVO> replyList = dao.getReplyData(map);
			int totalpage=dao.replyTotalPage(mNo);
			if(totalpage==0)curpage=0;
			
			
			int block=5;
			int frompage=((curpage-1)/block*block)+1;
			int topage=((curpage-1)/block*block)+block;
			if(topage>totalpage) topage=totalpage;
			
			model.addAttribute("url", url);
			model.addAttribute("list", list);
			model.addAttribute("vo", vo);
			model.addAttribute("jsp", "../movie/movieDetail.jsp");
			model.addAttribute("no", no);
			model.addAttribute("check", check);
			model.addAttribute("type", type);
			model.addAttribute("block", block);
			model.addAttribute("frompage", frompage);
			model.addAttribute("topage", topage);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("replyList", replyList);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return "main/main";
	}
	
	//������
	@RequestMapping("replyCheck.do")
	public String replyCheck(Model model, String no, HttpSession session, String star_input, String content, String reNo, String page){
		
		try {
			
			Map map=new HashMap();
			
			int mNo = Integer.parseInt(no);
			MemberVO vo1 = (MemberVO) session.getAttribute("mvo");
			String id = vo1.getId();
			int memberNo=vo1.getNo();
			
			//��ۻ���
			Date regDATE = new Date();
			int score=0;
			
			//���� ���� �޾ƿ� ���
			if(star_input!=null){ 
				score = Integer.parseInt(star_input);
				MovieVO vo2 = new MovieVO();
				vo2.setScore(score);
				vo2.setReContent(content);
				vo2.setRegDATE(regDATE);
				vo2.setId(id);
				vo2.setmNo(mNo);
				dao.replyInsert(vo2);
			}
			
			//��� ����
			int rno=0;
			if(reNo != null){
				rno=Integer.parseInt(reNo);
				dao.replyDelete(rno);
			}
			
			//�ش� ��ȭ ��� ���� ���ϱ�
			int totalScore=dao.replyTotalScore(mNo);
			int count=dao.replyCount(mNo);
			double result=(double)totalScore/count;
			double movieLike=Double.parseDouble(String.format("%.2f", result));
			if(Double.isNaN(movieLike))movieLike=0;
			map=new HashMap();
			map.put("movieLike", movieLike);
			map.put("mNo", mNo);
			dao.movieLikeUpdate(map);
			
			//��� ����߾����� üũ
			int check=0;
			if(vo1!=null){
				map.put("mNo", mNo);
				map.put("memberNo", memberNo);
				check=dao.replyRecordCheck(map);
			}
		
			//��ȭ �� ����
			MovieVO vo=dao.getmoviedetail(mNo);
			List<MovieVO> list = dao.getmoviecharacter(mNo);
			String url=vo.getTrailer();
			url=url.substring(url.lastIndexOf("/")+1);
		
			
			//������ ����
			if(page==null || page.equals("0")) page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=5;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			
			map=new HashMap();
			map.put("start", start);
			map.put("end",end);
			map.put("mNo", mNo);
			
			List<MovieVO> replyList = dao.getReplyData(map);
			int totalpage=dao.replyTotalPage(mNo);
			if(totalpage==0)curpage=0;
				
			int block=5;
			int frompage=((curpage-1)/block*block)+1;
			int topage=((curpage-1)/block*block)+block;
			if(topage>totalpage) topage=totalpage;
				
			model.addAttribute("url", url);
			model.addAttribute("list", list);
			model.addAttribute("vo", vo);
			model.addAttribute("check", check);
			model.addAttribute("mNo", mNo);
			model.addAttribute("block", block);
			model.addAttribute("frompage", frompage);
			model.addAttribute("topage", topage);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("replyList", replyList);
			model.addAttribute("id", id);
			model.addAttribute("jsp", "../movie/movieDetail.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	
		return "main/main";
	}
}
