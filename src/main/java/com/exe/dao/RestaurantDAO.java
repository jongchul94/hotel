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
	
	
	//������� ������ ����
	public RestaurantDTO getReadResDetail(String resName) {
		
		RestaurantDTO dto = sessionTemplate.selectOne("resmapper.getReadResDetail",resName);
		
		return dto;
	}
	
	//�����μ�Ʈ
	public void resInsert(RestaurantBookingDTO dto) {
		
		sessionTemplate.insert("resmapper.insertResBookingg",dto);
	}
	
	//���༿��
	public RestaurantBookingDTO getReadResBooking(int resBookNo){
		
		RestaurantBookingDTO dto = 
				sessionTemplate.selectOne("resmapper.getReadResBooking",resBookNo);
		
		return dto;
	}
	
	//�������������� ������� ���� ����
	public List<RestaurantBookingDTO> getMyResBooking(String userId) {
		
		List<RestaurantBookingDTO> lists = sessionTemplate.selectList("resmapper.getMyResBooking",userId);
		
		return lists;
		
	}
	
	//�������
	public void resDelete(int resBookNo) {
		
		sessionTemplate.delete("resmapper.resDelete",resBookNo);
	}
	
	//��ȸ���� ����Ȯ��
	public List<RestaurantBookingDTO> getCheckResBooking(int resBookNo, String phone){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("resBookNo", resBookNo);
		params.put("phone", phone);
		
		List<RestaurantBookingDTO> lists = sessionTemplate.selectList("resmapper.getCheckResBooking",params);
		
		return lists;
	}

	
	

}
