package com.exe.dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.HotelBookingDTO;
import com.exe.dto.RoomDTO;

public class HotelBookingDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate)
			throws Exception {
		
		this.sessionTemplate = sessionTemplate;

	} 

	public void insertData(HotelBookingDTO dto){

		sessionTemplate.insert("hotelmapper.insertBookingData",dto);

	}


	public List<HotelBookingDTO> getRoomLists(String checkin, String checkout) {

		HashMap<String, Object> params = 
				new HashMap<String, Object>();


		params.put("checkin", checkin);
		params.put("checkout", checkout);

		List<HotelBookingDTO> lists =
				sessionTemplate
				.selectList("hotelmapper.getReadBookingOut",params);

		return lists; 

	}
	
	 //userId를 가지고 예약정보 가져오기 (마이페이지용)
	public  List<HotelBookingDTO> getReadBookingData(String userId){
		
		
		List<HotelBookingDTO> lists  =
				sessionTemplate
				.selectList("hotelmapper.getReadBookingData", userId);
		

		
		return lists; 

	}

	public int getMaxNum(){

		int maxNum = 0;

		maxNum =
				sessionTemplate.selectOne("hotelmapper.maxHotelNum");

		return maxNum;

	}

	public int getInterval2(String checkin, String checkout){

		HashMap<String, String> params = 
				new HashMap<String, String>();

		params.put("checkin", checkin);
		params.put("checkout", checkout);

		int interval = 
				sessionTemplate.selectOne("hotelmapper.intervalDay2",params);
		return interval;
	}
	
	
	public void deleteData(int bookingId){
		
		sessionTemplate
			.update("hotelmapper.deleteData",bookingId);

	}
	
	

	public List<HotelBookingDTO> getReadBookingList(int roomIndex) {
		
		List<HotelBookingDTO> list = sessionTemplate.selectList("hotelmapper.getReadBookingList",roomIndex);
		
		return list;
	}
	
	public void deleteBookingData(int bookingId) {
		
		sessionTemplate.delete("hotelmapper.deleteBookingData",bookingId);
		
	}
	
}

