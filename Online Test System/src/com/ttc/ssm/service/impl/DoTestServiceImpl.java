package com.ttc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ttc.ssm.mapper.TestMapper;
import com.ttc.ssm.po.Examption;
import com.ttc.ssm.po.History;
import com.ttc.ssm.service.DoTestService;

public class DoTestServiceImpl implements DoTestService{
	
	@Autowired
	TestMapper testMapper;
	
	public Examption selectExamptionByEid(int eid) {
		return testMapper.selectExamptionByEid(eid);
	}
	
	public List<Examption> selectLowExamption() {
		return testMapper.selectLowExamption();
	}
	
	public void inserHistory(History history) throws Exception{
		testMapper.inserHistory(history);
	}
	
	public List<Examption> selectExamByKeywords(String keywords) throws Exception{
		return testMapper.selectExamByKeywords(keywords);
	}
	
	public List<History> selectHistoriesByUsername(String username) throws Exception{
		return testMapper.selectHistoriesByUsername(username);
	}
	
	public History selectHistoryByHid(int hid) throws Exception{
		return testMapper.selectHistoryByHid(hid);
	}
	
	public List<History> selectHistoriesByKeywords(String keywords,String username) throws Exception{
		return testMapper.selectHistoriesByKeywords(keywords,username);
	}
	
	public void deleteHistoryByHid(int hid) throws Exception{
		testMapper.deleteHistoryByHid(hid);
	}
}
