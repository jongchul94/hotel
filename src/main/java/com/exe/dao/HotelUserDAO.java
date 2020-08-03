package com.exe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.HotelUserDTO;

public class HotelUserDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertUser(HotelUserDTO dto) {
		
		sessionTemplate.insert("hotelmapper.insertUser", dto);
	}
	
	public HotelUserDTO getReadUserData(String userId) {
		
		HotelUserDTO dto = sessionTemplate.selectOne("hotelmapper.getReadUserData",userId);
		
		return dto;
	}

	public void updateUserData(HotelUserDTO dto) {
		
		sessionTemplate.update("hotelmapper.updateUserData",dto);
	}

	public List<HotelUserDTO> getUserListData(){
		
		List<HotelUserDTO> list = sessionTemplate.selectList("hotelmapper.getUserListData");
		
		return list;
	}
	
	public void deleteUserData(String userId) {
		
		sessionTemplate.delete("hotelmapper.deleteUserData",userId);
	}

	public int idDupCheck(String paramId) {
		
		int check =-2;
		check = sessionTemplate.selectOne("hotelmapper.idDupCheck",paramId);
		return check;
		
	}
}
