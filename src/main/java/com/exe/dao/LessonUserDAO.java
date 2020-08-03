package com.exe.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.LessonUserDTO;

public class LessonUserDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertLessonUser(LessonUserDTO dto) {

		sessionTemplate.insert("lessonmapper.insertLessonUser",dto);
	
	}
	
	public int lessonGetMaxNum() {
		
		return sessionTemplate.selectOne("lessonmapper.lessonGetMaxNum");
		
	}
	
	public List<LessonUserDTO> lessonGetList(String lessonUserId) {
		
		List<LessonUserDTO> lists = new ArrayList<LessonUserDTO>();
		
		lists =sessionTemplate.selectList("lessonmapper.getLessonUserList", lessonUserId);
		
		return lists;
		
	}

	public int getLessonUserCount(String className) {
		
		return sessionTemplate.selectOne("lessonmapper.getLessonUserCount", className);
	}
	
	public void deleteLessonUser(int lessonUserIndex) {
		sessionTemplate.delete("lessonmapper.deleteLessonUser",lessonUserIndex);
	}
	
	public List<LessonUserDTO> getAdminUserList(String ClassName) {

		List<LessonUserDTO> lists = new ArrayList<LessonUserDTO>();

		lists =sessionTemplate.selectList("lessonmapper.getAdminUserList", ClassName);

		return lists;
	}
	
}