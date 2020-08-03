package com.exe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.GalleryDTO;

public class GalleryDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertGallery(GalleryDTO dto) {
		
		sessionTemplate.insert("hotelmapper.insertGallery",dto);
	}
	
	public int getMaxNum() {
		
		int maxNum = sessionTemplate.selectOne("hotelmapper.galleryGetMaxNum");
	
		return maxNum;
	}
	
	public List<GalleryDTO> getList(){
		
		List<GalleryDTO> lists = sessionTemplate.selectList("hotelmapper.galleryGetList");
		
		return lists;
	}
}
