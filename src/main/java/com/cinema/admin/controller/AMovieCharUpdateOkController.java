package com.cinema.admin.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class AMovieCharUpdateOkController {
	@Autowired
	private AdminDAO dao;

	@RequestMapping("AcharUpdate_ok.do")
	public String charUpdateOk(Model model, String sno, String actor, String type) {

		int no = Integer.parseInt(sno);
		// ����ȣ ������ ���� actor=1,2,3
		System.out.println(actor);
		StringTokenizer st=new StringTokenizer(actor, ",");		
		int actor1 = Integer.parseInt(st.nextToken());
		int actor2 = Integer.parseInt(st.nextToken());
		int actor3 = Integer.parseInt(st.nextToken());

		// no=��ȭ��ȣ,actor=�⿬����ȣ
		List<MovieVO> beforeAL = dao.movieCharData(no);
		int[] afterAL = { actor1, actor2, actor3 };
		Map map = new HashMap();
		
		
		//���� �⿬�� ����
		for (MovieVO vo : beforeAL) {
			map.put("cno", vo.getCno());
			for (int j = 1; j < 6; j++) {
				//mno1~mno5 ��������
				String mno = "mno" + j;
				map.put("mno", mno);
				int db_mno = dao.AactorMno(map);
				
				//������ ��ȣ�� ��ȭ��ȣ�� ������ ����
				if (db_mno == no) {
					dao.AactorDeleteMno(map);
					break;
				}
			}
		}
		
		//�Է¹��� �⿬�� ������Ʈ
		for (int cno : afterAL) {
			//�ߺ�üũ��
			int check=0;
			map.put("cno", cno);
			for (int j = 1; j < 6; j++) {
				String mno = "mno" + j;
				map.put("mno", mno);
				int db_mno = dao.AactorMno(map);
				
				//�⿬���� �ߺ��� ��� break
				if(j==1){
					List<MovieVO> mnoL=dao.AactorAllMno(cno);					
					for(MovieVO vo:mnoL){
						if(vo.getMno1()==no || vo.getMno2()==no || 
								vo.getMno3()==no || vo.getMno4()==no || 
								vo.getMno5()==no){
							check=1;
						}
					}
				}
				
				//insert
				if (db_mno == 0 && check==0) {			
					map.put("movieNo", no);
					dao.AactorInsertMno(map);
					break;
				}				
			}
		}
		
		model.addAttribute("no", no);
		model.addAttribute("type", type);
		model.addAttribute("go", "MD");

		return "adminpage/station";
	}
}
