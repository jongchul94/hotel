package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.LessonDTO;

public class LessonDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		
		this.sessionTemplate = sessionTemplate;
	}
	
	public int getLessonMaxNum() {
		
		int lessonMaxNum = 0;
		
		lessonMaxNum = sessionTemplate.selectOne("lessonmapper.lessonMaxNum");
		
		return lessonMaxNum;
	}
	
	public int getLessonCount() {
		
		
		int result = sessionTemplate.selectOne("lessonmapper.getLessonCount");
		
		return result;
	}
	
	public List<LessonDTO> getLessonList() {

		List<LessonDTO> lists = sessionTemplate.selectList("lessonmapper.getLessonList");
		
		return lists;
	}
	
}