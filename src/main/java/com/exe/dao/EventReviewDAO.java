package com.exe.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.EventReviewDTO;
import com.exe.dto.ReviewDTO;

public class EventReviewDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertReviewData(EventReviewDTO dto) {
		
		sessionTemplate.insert("eventmapper.insertReview",dto);
	}
	
	public int reviewMaxNum() {
		
		return sessionTemplate.selectOne("eventmapper.reviewMaxNum");
	}
	
	public List<EventReviewDTO> getReviewList(int eventIndex){
		
		List<EventReviewDTO> lists = new ArrayList<EventReviewDTO>();
		
		lists = sessionTemplate.selectList("eventmapper.getReviewList",eventIndex);
		
		return lists;
	}
	
	public void deleteReviewData(int eventReviewNum) {
		
		sessionTemplate.delete("eventmapper.deleteReviewData",eventReviewNum);
	}
	
	public int countReview(int eventIndex) {
		
		return sessionTemplate.selectOne("eventmapper.countReview",eventIndex);
	}
}
