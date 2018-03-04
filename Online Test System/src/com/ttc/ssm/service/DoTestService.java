package com.ttc.ssm.service;

import java.util.List;

import com.ttc.ssm.po.Examption;
import com.ttc.ssm.po.History;

public interface DoTestService {
	
	public Examption selectExamptionByEid(int eid) throws Exception; 
	
	public  List<Examption> selectLowExamption() throws Exception;
	
	public void inserHistory(History history) throws Exception;
	
	public List<Examption> selectExamByKeywords(String keywords) throws Exception;
	
	public List<History> selectHistoriesByUsername(String username) throws Exception;
	
	public History selectHistoryByHid(int hid) throws Exception;
	
	public List<History> selectHistoriesByKeywords(String keywords,String username) throws Exception;
	
	public void deleteHistoryByHid(int hid) throws Exception;
	
}
