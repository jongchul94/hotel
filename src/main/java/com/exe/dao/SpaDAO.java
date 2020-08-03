package com.exe.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.SpaDTO;

public class SpaDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}

	public List<SpaDTO> getSpaList(){

		List<SpaDTO> lists = sessionTemplate.selectList("spamapper.getSpaLists");

		return lists;
	}

	public int getMaxNum(){

		int maxNum = 0;

		maxNum = sessionTemplate.selectOne("spamapper.maxNum");


		return maxNum;
	}

	public void insertspa(SpaDTO dto){

		sessionTemplate.insert("spamapper.insertSpa",dto);
	}

	public int getspaCount(){

		HashMap<String, Object> params = new HashMap<String, Object>();

		int result = sessionTemplate.selectOne("spamapper.getspaCount",params);

		return result;
	}

	public SpaDTO getReadspaData(int spaIndex){

		SpaDTO dto = sessionTemplate.selectOne("spamapper.getReadspaData",spaIndex);

		return dto;
	}

	public void deletespaData(int spaIndex){

		sessionTemplate.delete("spamapper.deleteData", spaIndex);
	}

	public void updatespaData(SpaDTO dto){

		sessionTemplate.update("spamapper.updateData",dto);
	}


	//spaBooking=========================== spaBooking===================spaBooking====================spaBooking
	public int getBookingMaxNum(){

		int maxNum = 0;

		maxNum = sessionTemplate.selectOne("spamapper.bookingMaxNum");

		return maxNum;
	}

	public void insertspaBooking(SpaDTO dto){

		sessionTemplate.insert("spamapper.insertBooking",dto);
	}


	//개인예약내역 조회하기
	public SpaDTO getReadspaBookingData(String spaUserId,int spaBookingNum){

		HashMap<String, Object> params =
				new HashMap<String, Object>();

		params.put("spaUserId", spaUserId);
		params.put("spaBookingNum",spaBookingNum);



		return sessionTemplate.selectOne("spamapper.readspaBookingData",params);


	}

	public void deletespaBookingData(int spaBookingNum){

		sessionTemplate.delete("spamapper.deletespaBookingData", spaBookingNum);
	}

	public String getReadSaveFileName(String spaType) {

		String savefileName = sessionTemplate.selectOne("spamapper.readSaveFileName",spaType);
		
		return savefileName;
	}

	public String getReadPrice(String spaType) {

		String price = sessionTemplate.selectOne("spamapper.readPrice");

		return price;
	}
	

	public List<SpaDTO> getSpaBookingList(String spaUserId){

		List<SpaDTO> lists = sessionTemplate.selectList("spamapper.getSpaBookingLists",spaUserId);

		return lists;
	}


}
