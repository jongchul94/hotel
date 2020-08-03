package com.exe.hotel;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.LessonDAO;
import com.exe.dao.LessonUserDAO;
import com.exe.dto.LessonDTO;
import com.exe.dto.LessonUserDTO;
import com.exe.dto.LoginDTO;

@Controller
public class GymController {
	
	@Autowired
	//@Qualifier("LessonDAO")
	LessonDAO dao;
	
	@Autowired
	//@Qualifier("LessonUserDAO")
	LessonUserDAO dao2;
	
	
	@RequestMapping(value = "/gym", method = RequestMethod.GET)
	public ModelAndView indexGym() {
		
		ModelAndView mav = new ModelAndView();
		
		List<LessonDTO> lists = dao.getLessonList();
		
		mav.setViewName("gymIndex");
		mav.addObject("lists", lists);
		
		return mav;
	}
	
	@RequestMapping(value = "/gymList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView gymList(HttpServletRequest request,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		List<LessonDTO> lists = dao.getLessonList();
		
		if(session.getAttribute("login")==null) {

			String referer = request.getHeader("Referer");	//접속 경로
			request.getSession().setAttribute("redirectURI", referer);

			mav.setViewName("login");
			return mav;
		}

		mav.setViewName("gymList");
		
		mav.addObject("lists", lists);
		mav.addObject("userId",session.getAttribute("userId"));
		mav.addObject("userName",session.getAttribute("userName"));
		mav.addObject("userEmail",session.getAttribute("userEmail"));
		
		return mav;
	}
	
	@RequestMapping(value = "/gymList_ok.action", method = RequestMethod.POST)
	public String gymList_ok(HttpServletRequest request,LessonUserDTO dto) {
		
		
		dto.setLessonUserIndex(dao2.lessonGetMaxNum() + 1);
		
		dao2.insertLessonUser(dto);
		
		return "redirect:/gymCheck.action"; 
	}
	
	@RequestMapping(value = "/gymCheck.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView gymCheck(HttpSession session,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("login")==null) {

			String referer = request.getHeader("Referer");	//접속 경로
			request.getSession().setAttribute("redirectURI", referer);
			
			mav.setViewName("login");
			return mav;
		}
		
		LoginDTO login = (LoginDTO)session.getAttribute("login");
		
		mav.setViewName("gymCheck");

		List<LessonUserDTO> lists = dao2.lessonGetList(login.getUserId());
		
		String userId = request.getParameter("userId");
		//System.out.println(userId);
		
		if(userId!=null && !userId.equals("")) {
			lists = dao2.lessonGetList(userId);
			mav.addObject("lists", lists);
			return mav;
		}
		
		mav.addObject("message", "강좌 신청 내역이 없습니다");
		mav.addObject("lists", lists);
		return mav;
	}
	
	@RequestMapping(value = "/modal", method = RequestMethod.GET)
	public String modal() {
		
		return "modal";
	}
	
	@RequestMapping(value = "/gymAdmin.action", method = RequestMethod.GET)
	public ModelAndView gymAdmin(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gymAdmin");

		List<LessonDTO> lists = dao.getLessonList();
		List<LessonUserDTO> lists2;

		Map<String, List<LessonUserDTO>> nMap = new HashMap<String, List<LessonUserDTO>>();
		
		lists2 = dao2.getAdminUserList("yoga");
		nMap.put("yoga", lists2);
		
		lists2 = dao2.getAdminUserList("weights1");
		nMap.put("weights1", lists2);
		lists2 = dao2.getAdminUserList("exercise");
		nMap.put("exercise", lists2);
		
		mav.addObject("lists", lists);
		
		Map<String, Integer> cMap = new HashMap<String,Integer>();

		String message = "강좌를 신청한 사람이 없습니다.";
		
		int count = dao2.getLessonUserCount("yoga"); 
		cMap.put("yoga",count);

		count = dao2.getLessonUserCount("exercise");
		cMap.put("exercise",count);

		count = dao2.getLessonUserCount("weights1"); 
		cMap.put("weights1",count);
		
		mav.addObject("nMap", nMap);
		mav.addObject("cMap", cMap);
		mav.addObject("message", message);

		return mav;
	}
	
	@RequestMapping(value = "/gymDelete.action", method = RequestMethod.GET)
	public String deleteLessonUser(HttpServletRequest request,int lessonUserIndex) {
		
		String referer = request.getHeader("Referer");
		
		request.getParameter("lessonUserIndex");
		
		dao2.deleteLessonUser(lessonUserIndex);
	
		return "redirect:"+referer;
	}
}
