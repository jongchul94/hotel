package com.exe.hotel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exe.dao.RestaurantDAO;
import com.exe.dto.LoginDTO;
import com.exe.dto.RestaurantBookingDTO;
import com.exe.dto.RestaurantDTO;

@Controller
public class RestaurantController {
	
	@Autowired
	@Qualifier("RestaurantDAO")
	RestaurantDAO dao;
	
	//----------------------------------------------------------------------------
	
	//레스토랑 메인
	@RequestMapping(value = "/restaurantMain.action", method = RequestMethod.GET)
	public String restaurantMain() {

		return "restaurantMain";
	}
	
	//레스토랑 디테일페이지 갈때
	@RequestMapping(value = "/res-details.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView resDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		String resName = request.getParameter("resName");
			
		RestaurantDTO dto = dao.getReadResDetail(resName);
			
		ModelAndView mav = new ModelAndView();
			
		mav.setViewName("res-details");
			
		mav.addObject("dto",dto);
		//mav.addObject("resName",resName);

		return mav;
	}
	
	
	//메인에서 예약으로 바로 갈때
	//레스토랑/날짜/시간/성인/어린이 가지고 들어감
	@RequestMapping(value = "/resBookingMain.action", method = RequestMethod.POST)
	public String resBookingMain(HttpServletRequest request, RedirectAttributes redirect ) {
		
		//메인에서 선택한 값 담고
		String resName = request.getParameter("resName");
		String checkin = request.getParameter("checkin");
		String time = request.getParameter("time");
		String adult = request.getParameter("adult");
		String children = request.getParameter("children");
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("resName", resName);
		map.put("checkin", checkin);
		map.put("time", time);
		map.put("adult", adult);
		map.put("children", children);
		
		redirect.addFlashAttribute("res", map);
		
		return "redirect:/res-booking.action";
	}
	
	//예약 페이지로!
	@RequestMapping(value = "/res-booking.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView resBookingMa (HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String resName = request.getParameter("resName");
		
		ModelAndView mav = new ModelAndView();
		
		//디테일에서 오는 경우
		//레스토랑 이름만 넘어옴
		if(resName != null) {
			
			RestaurantDTO dto = dao.getReadResDetail(resName);
			mav.addObject("dto",dto);
		}
		
		mav.setViewName("res-booking");
		
		return mav;
	}
	
	

	//레스토랑 예약 인서트
	@RequestMapping(value = "/res-BookOk2.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String resBookOk(HttpServletRequest request, HttpServletResponse response, RestaurantBookingDTO dto2) {
			
		//예약번호 랜덤으로 만들고
		int rNum = (int)(Math.random()*999999+1);
		
		dto2.setResBookNo(rNum);
		
		//날짜변환
		//12/31/2019 => 2019/12/31
		String dates[] = dto2.getCheckin().split("/");       
		String checkin = dates[2]+"/"+dates[0]+"/"+dates[1]; 
		
		dto2.setCheckin(checkin);
		
		dao.resInsert(dto2);
			
		return "redirect:/res-confirm.action?resBookNo=" + rNum;
	}
		
	
	//레스토랑 예약내용 보여줌!
	@RequestMapping(value = "/res-confirm.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView resConfirm(HttpServletRequest request, HttpServletResponse response, RestaurantBookingDTO dto) {
		
		int resBookNo = Integer.parseInt(request.getParameter("resBookNo"));
		
		dto = dao.getReadResBooking(resBookNo);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("res-confirm");
		
		mav.addObject("dto",dto);

		return mav;
	}
	
	
	//마이페이지에서 레스토랑 예약확인
	@RequestMapping(value = "/res-myBooking.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView resMyConfirm(HttpServletRequest request, HttpServletResponse response, RestaurantBookingDTO dto) {

		HttpSession session = request.getSession();
		
		ModelAndView mav = new ModelAndView();
		
		String msg = "";
		
		LoginDTO login = (LoginDTO) session.getAttribute("login");	
		
		if(login==null) {
			
			mav.setViewName("res-selectBooking");
			
			return mav;
		}
		
		List<RestaurantBookingDTO> lists = dao.getMyResBooking(login.getUserId());
		
		if(lists.isEmpty()) {
			msg = "레스토랑 예약건이 없습니다.";
			mav.setViewName("res-myBooking");
			mav.addObject("msg",msg);
			return mav;
		}
		
		mav.setViewName("res-myBooking");
		mav.addObject("lists",lists);
		
		return mav;
	}
	
	
	//예약취소
	@RequestMapping(value = "/res-delete.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String resDelete(HttpServletRequest request, HttpServletResponse response) {
		
		int resBookNo = Integer.parseInt(request.getParameter("resBookNo"));
		
		dao.resDelete(resBookNo);
		
		return "redirect:/res-myBooking.action";
	}
	
	//비회원의 예약 확인
	@RequestMapping(value = "/res-checkRes.action",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getCheckResBooking(HttpServletRequest requset, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		int resBookNo = Integer.parseInt(requset.getParameter("resBookNo"));
		String phone = requset.getParameter("phone");
		String msg = "";
		
		List<RestaurantBookingDTO> lists =  dao.getCheckResBooking(resBookNo, phone);
		
		if(lists.isEmpty()) {
			msg = "레스토랑 예약건이 없습니다.";
			mav.setViewName("res-myBooking");
			mav.addObject("msg",msg);
			return mav;
		}
		
		mav.setViewName("res-myBooking");
		mav.addObject("lists",lists);
		
		return mav;
	}
	
	

	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
