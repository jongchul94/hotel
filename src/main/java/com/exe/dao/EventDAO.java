package com.exe.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.EventBookingDTO;
import com.exe.dto.EventCheckDTO;
import com.exe.dto.EventDTO;
import com.exe.dto.HotelBookingDTO;

public class EventDAO {
	
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public List<EventDTO> getEventList(){

		List<EventDTO> lists = sessionTemplate.selectList("eventmapper.getEventLists");
	
		return lists;
	}

	public int getMaxNum(){

		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("eventmapper.maxNum");
		
		return maxNum;
	}

	public void insertEvent(EventDTO dto){

		sessionTemplate.insert("eventmapper.insertEvent",dto);
	}

	public int getEventCount(){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		int result = sessionTemplate.selectOne("eventmapper.getEventCount",params);
		
		return result;
	}

	public EventDTO getReadEventData(int eventIndex){
		
		EventDTO dto = sessionTemplate.selectOne("eventmapper.getReadEventData",eventIndex);
		
		return dto;
	}

	public void deleteEventData(int eventIndex){

		sessionTemplate.update("eventmapper.deleteData", eventIndex);
	}

	public void updateEventData(EventDTO dto){
		
		sessionTemplate.update("eventmapper.updateData",dto);
	}
	
	
	//EventBooking=========================== EventBooking===================EventBooking====================EventBooking
	public int getBookingMaxNum(){

		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("eventmapper.bookingMaxNum");
		
		return maxNum;
	}
	
	public void insertEventBooking(EventBookingDTO dto){

		sessionTemplate.insert("eventmapper.insertBooking",dto);
	}
	
	
	//���ο��೻�� ��ȸ�ϱ�
	public EventBookingDTO getReadEventBookingData(String userId,  int eventIndex){
		
		HashMap<String, Object> params =
				new HashMap<String, Object>();
		
		params.put("userId", userId);
		params.put("eventIndex",eventIndex);
		
		
		
		return sessionTemplate.selectOne("eventmapper.readEventBookingData",params);
		
		
	}
	
	public void deleteEventBookingData(int eventBookingNum){

		sessionTemplate.update("eventmapper.deleteBookingData", eventBookingNum);
	}

	//MyPage Event ���೻�� �̾Ƴ���
	public List<EventCheckDTO> getEventListsByUserId(String userId) {

		List<EventCheckDTO> lists =
				sessionTemplate
				.selectList("eventmapper.getEventListsByUserId",userId);

		return lists; 

	}
	
	//���� ������ ��¥(start ~end date) ������� �̿� ������ �̺�Ʈ ��� ��������
	public List<EventDTO> getEventLists(Map<String, Object> params) {

		List<EventDTO> lists =
				sessionTemplate
				.selectList("eventmapper.getReadEventOut",params);

		return lists; 

	}
	
	//���۳�¥ �ֽż� 3�� ������ ����
	public List<EventDTO> getReadEventListByAsc3() {

		List<EventDTO> lists =
				sessionTemplate
				.selectList("eventmapper.getReadEventListByAsc3");

		return lists; 

	}
	
	
	
}
