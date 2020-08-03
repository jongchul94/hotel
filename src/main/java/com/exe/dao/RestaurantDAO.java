package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.RestaurantBookingDTO;
import com.exe.dto.RestaurantDTO;

public class RestaurantDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	
	//레스토랑 디테일 내용
	public RestaurantDTO getReadResDetail(String resName) {
		
		RestaurantDTO dto = sessionTemplate.selectOne("resmapper.getReadResDetail",resName);
		
		return dto;
	}
	
	//예약인서트
	public void resInsert(RestaurantBookingDTO dto) {
		
		sessionTemplate.insert("resmapper.insertResBookingg",dto);
	}
	
	//예약셀렉
	public RestaurantBookingDTO getReadResBooking(int resBookNo){
		
		RestaurantBookingDTO dto = 
				sessionTemplate.selectOne("resmapper.getReadResBooking",resBookNo);
		
		return dto;
	}
	
	//마이페이지에서 레스토랑 예약 셀렉
	public List<RestaurantBookingDTO> getMyResBooking(String userId) {
		
		List<RestaurantBookingDTO> lists = sessionTemplate.selectList("resmapper.getMyResBooking",userId);
		
		return lists;
		
	}
	
	//예약삭제
	public void resDelete(int resBookNo) {
		
		sessionTemplate.delete("resmapper.resDelete",resBookNo);
	}
	
	//비회원의 예약확인
	public List<RestaurantBookingDTO> getCheckResBooking(int resBookNo, String phone){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("resBookNo", resBookNo);
		params.put("phone", phone);
		
		List<RestaurantBookingDTO> lists = sessionTemplate.selectList("resmapper.getCheckResBooking",params);
		
		return lists;
	}

	
	

}
