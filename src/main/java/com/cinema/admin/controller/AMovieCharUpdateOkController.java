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
		// 배우번호 나누기 현재 actor=1,2,3
		System.out.println(actor);
		StringTokenizer st=new StringTokenizer(actor, ",");		
		int actor1 = Integer.parseInt(st.nextToken());
		int actor2 = Integer.parseInt(st.nextToken());
		int actor3 = Integer.parseInt(st.nextToken());

		// no=영화번호,actor=출연진번호
		List<MovieVO> beforeAL = dao.movieCharData(no);
		int[] afterAL = { actor1, actor2, actor3 };
		Map map = new HashMap();
		
		
		//이전 출연진 삭제
		for (MovieVO vo : beforeAL) {
			map.put("cno", vo.getCno());
			for (int j = 1; j < 6; j++) {
				//mno1~mno5 가져오기
				String mno = "mno" + j;
				map.put("mno", mno);
				int db_mno = dao.AactorMno(map);
				
				//가져온 번호랑 영화번호랑 같으면 삭제
				if (db_mno == no) {
					dao.AactorDeleteMno(map);
					break;
				}
			}
		}
		
		
		System.out.println();
		
		//입력받은 출연진 업데이트
		for (int cno : afterAL) {
			//중복체크용
			int check=0;
			map.put("cno", cno);
			for (int j = 1; j < 6; j++) {
				String mno = "mno" + j;
				map.put("mno", mno);
				int db_mno = dao.AactorMno(map);
				
				//출연진이 중복될 경우 break
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

		/*
		 * //이전의 출연진 for(MovieVO vo: beforeActor){
		 * System.out.println(vo.getCno()+"==이전 배우요"); //지금의 출연진이랑 다르면 삭제
		 * if(vo.getCno()!=Integer.parseInt(actor1)){ for(int i=1;i<6;i++){
		 * String m="mno"+i; String c=vo.getCno(); SELECT m FROM CharacterList
		 * WHERE cno=
		 * 
		 * Map map=new HashMap(); map.put("mno", "mno"+i); map.put("sno", sno);
		 * 
		 * } } }
		 */
		/*
		 * //배우1의 mno1~mno5 가져오기 List<MovieVO>
		 * mnoList1=dao.AgetActorMno(Integer.parseInt(actor1)); for(MovieVO
		 * vo:mnoList1){ // 이미 출연진에 있는경우 if(vo.getMno1()==no || vo.getMno2()==no
		 * || vo.getMno3()==no || vo.getMno4()==no || vo.getMno5()==no){ break;
		 * } if(vo.getMno1() == 0){ // no=>영화번호, actor=>배우번호 vo.setMno1(no);
		 * vo.setNo(Integer.parseInt(actor1)); dao.AactorInsertMno1(vo); break;
		 * }else if(vo.getMno2() == 0){ vo.setMno2(no);
		 * vo.setNo(Integer.parseInt(actor1)); dao.AactorInsertMno2(vo); break;
		 * }else if(vo.getMno3() == 0){ vo.setMno3(no);
		 * vo.setNo(Integer.parseInt(actor1)); dao.AactorInsertMno3(vo); break;
		 * } else if(vo.getMno4() == 0){ vo.setMno4(no);
		 * vo.setNo(Integer.parseInt(actor1)); dao.AactorInsertMno4(vo); break;
		 * } else if(vo.getMno5() == 0){ vo.setMno5(no);
		 * vo.setNo(Integer.parseInt(actor1)); dao.AactorInsertMno5(vo); break;
		 * } }
		 */

		model.addAttribute("no", no);
		model.addAttribute("type", type);
		model.addAttribute("go", "MD");

		return "adminpage/station";
	}
}
