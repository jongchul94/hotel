package com.exe.dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.HotelUserDTO;
import com.exe.dto.RoomDTO;

public class RoomDAO {


	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate)
			throws Exception {
		this.sessionTemplate = sessionTemplate;

	} 
	
	public int getMaxNum(){

		int maxNum = 0;
		
		maxNum =
				sessionTemplate.selectOne("hotelmapper.roomMaxNum");
		
		return maxNum;

	}
	public List<RoomDTO> getRoomLists(int[] roomIndex){
		
		List<RoomDTO> lists=new ArrayList<RoomDTO>();

		DecimalFormat formatter = new DecimalFormat("###,###");
		
		for (int i=0; i<roomIndex.length; i++) {
			
			System.out.println(roomIndex[i]);
			
			RoomDTO dto  =
					sessionTemplate
					.selectOne("hotelmapper.getRoomLists",roomIndex[i]);
			
			

		
		if(dto != null) {
			dto.setPricePerNight2(formatter.format(dto.getPricePerNight()));
				lists.add(dto);
		}
			
		}
		
		return lists; 

	}
	
	public RoomDTO getReadRoomData(int roomIndex){
		
		
		RoomDTO dto =
				sessionTemplate
				.selectOne("hotelmapper.getReadRoomData", roomIndex);
		
				
		return dto; 
	}

}


































