package com.exe.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.ReviewDTO;

public class ReviewDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertReviewData(ReviewDTO dto) {
		sessionTemplate.insert("hotelmapper.insertReview",dto);
	}
	
	public int reviewMaxNum() {
		
		return sessionTemplate.selectOne("hotelmapper.reviewMaxNum");
	
	}
	
	public List<ReviewDTO> getReviewList(int roomIndex){
		
		List<ReviewDTO> lists = new ArrayList<ReviewDTO>();
		
		lists = sessionTemplate.selectList("hotelmapper.getReviewList",roomIndex);
		
		return lists;
	}
	
	public void deleteReviewData(int reviewNum) {
		
		sessionTemplate.delete("hotelmapper.deleteReviewData",reviewNum);
	}
	
	public int countReview(int roomIndex) {
		
		return sessionTemplate.selectOne("hotelmapper.countReview",roomIndex);
	}
	
}
