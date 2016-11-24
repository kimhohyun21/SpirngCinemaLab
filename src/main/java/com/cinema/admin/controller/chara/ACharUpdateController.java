package com.cinema.admin.controller.chara;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.admin.dao.AdminDAO;
import com.cinema.movieList.dao.MovieVO;

@Controller
public class ACharUpdateController {
	@Autowired
	AdminDAO dao;
	
	@RequestMapping("ACUpdate.do")
	public String charUpdate(Model model, String name, String img,
			String cno, String mno1, String mno2, 
			String mno3, String mno4, String mno5){
		int title1=Integer.parseInt(mno1);
		int title2=Integer.parseInt(mno2);
		int title3=Integer.parseInt(mno3);
		int title4=Integer.parseInt(mno4);
		int title5=Integer.parseInt(mno5);
		int title[]={title1,title2,title3,title4,title5};
			
		Map map = new HashMap();
		map.put("cno", Integer.parseInt(cno));
		map.put("cname", name);
		map.put("img", img);
		
		//이름,이미지 수정
		dao.ACmodify(map);
		
		//이전 mno1~mno5 삭제
		for(int i=1 ; i<6 ; i++){
			String mno="mno"+i;
			map.put("mno", mno);
			dao.AactorDeleteMno(map);
		}
		int i=0;
		for(int t:title){
			//이미 영화번호가 들어가 있을때
			List<MovieVO> mnoList=dao.AactorAllMno(Integer.parseInt(cno));
			int check=0;		
			for(MovieVO vo:mnoList){
				if(vo.getMno1()==t || vo.getMno2()==t || vo.getMno3()==t
						|| vo.getMno4()==t || vo.getMno5()==t){
					check=1;
				}
			}
			if(check==1){
				break;
			}
			i++;			
			//영화를 안골랐을때
			if(t==0){
				break;
			}
			map.put("movieNo", t);
			String mno="mno"+i;
			map.put("mno", mno);
			dao.AactorInsertMno(map);
		}
		
		
		model.addAttribute("go","ACL");
		return "adminpage/station";
	}
}
