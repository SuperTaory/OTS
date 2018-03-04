package com.ttc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.regexp.internal.recompile;
import com.ttc.ssm.mapper.TestMapper;
import com.ttc.ssm.po.Analysis;
import com.ttc.ssm.po.Examption;
import com.ttc.ssm.po.Options;
import com.ttc.ssm.po.Question;
import com.ttc.ssm.po.User;
import com.ttc.ssm.service.TestService;

public class TestServiceImpl implements TestService {
	
	@Autowired
	TestMapper testMapper;
	
	//Examption
	public void insert(Examption examption) throws Exception{
		testMapper.insert(examption);
	}
	
	public Examption selectByEname(String ename) throws Exception{
		return testMapper.selectByEname(ename);
	}

	public void updateExamption(int eid,String ename) throws Exception{
		testMapper.updateExamption(eid,ename);
	}

	public List<Examption> selectByUsername(String username) throws Exception{
		return testMapper.selectByUsername(username);
	}
	
	public  void deleteExamByEid(int eid) throws Exception{
		testMapper.deleteExamByEid(eid);
	}

	public List<Examption> selectAllExamptions() {
		return testMapper.selectAllExamptions();
	}
	
	public void updateExamptionUKL(Examption examption) throws Exception{
		testMapper.updateExamptionUKL(examption);
	}
	public void updateExamptionQnumbers(int eid) throws Exception{
		testMapper.updateExamptionQnumbers(eid);
	}
	
	public void updateExamptionQnumbers2(int eid) throws Exception{
		testMapper.updateExamptionQnumbers2(eid);
	}
	//Question
	public Question selectByQname(String qname) throws Exception{
		return testMapper.selectByQname(qname);
	}
	
	public void insertQuestion(Question question) throws Exception{
		testMapper.insertQuestion(question);
	}
	
	public void deleteQuestionByQid(int qid) throws Exception{
		testMapper.deleteQuestionByQid(qid);
	}
	
	public  List<Question> selectQuestionByEid(int eid) {
		return testMapper.selectQuestionByEid(eid);
	}
	public  Question selectQuestionByQid(int qid) throws Exception{
		return testMapper.selectQuestionByQid(qid);
	}
	
	public void updateQuestion(Question question) {
		testMapper.updateQuestion(question);
	}

	
	//Options
	public Options selectByQid(int qid) throws Exception{
		return testMapper.selectByQid(qid);
		
	}
	
	public  void insertOption(Options options) throws Exception{
		testMapper.insertOption(options);
	}
	
	public void deleteOptionByOid(int oid) throws Exception{
		testMapper.deleteOptionByOid(oid);
	}
	
	public  List<Options> selectOptionsByEid(int eid) {
		return testMapper.selectOptionsByEid(eid);
	}
	
	public void updateOptions(Options options) {
		testMapper.updateOptions(options);
	}
	//Analysis
	public Analysis selectAnalysisByEid(int eid) throws Exception{
		return testMapper.selectAnalysisByEid(eid);
	}

	public  void insertAnalysis(Analysis analysis) throws Exception{
		testMapper.insertAnalysis(analysis);
	}
	
	public void deleteAnalysisByAid(int aid) throws Exception{
		testMapper.deleteAnalysisByAid(aid);
	}
	public void updateAnalysis(Analysis analysis)throws Exception{
		testMapper.updateAnalysis(analysis);
	}

	
}
