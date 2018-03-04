package com.ttc.ssm.service;

import java.util.List;

import com.ttc.ssm.po.Analysis;
import com.ttc.ssm.po.Examption;
import com.ttc.ssm.po.Options;
import com.ttc.ssm.po.Question;

public interface TestService {
	
	//Examption
	public Examption selectByEname(String ename) throws Exception;
	
	public List<Examption> selectByUsername(String username) throws Exception;
	
	public void insert(Examption examption) throws Exception;
	
	public void updateExamption(int eid,String ename) throws Exception;
	
	public  void deleteExamByEid(int eid) throws Exception;
	
	public List<Examption> selectAllExamptions() throws Exception ;
	
	public void updateExamptionUKL(Examption examption) throws Exception;
	
	public void updateExamptionQnumbers(int eid) throws Exception;
	
	public void updateExamptionQnumbers2(int eid) throws Exception;
	
	//Question
	public Question selectByQname(String qname) throws Exception;
	
	public void insertQuestion(Question question) throws Exception;
	
	public void deleteQuestionByQid(int qid) throws Exception;
	
	public List<Question> selectQuestionByEid(int eid) throws Exception;
	
	public  Question selectQuestionByQid(int qid) throws Exception;
	
	public void updateQuestion(Question question) throws Exception;
	
	//Options
	public Options selectByQid(int qid) throws Exception;
	
	public  void insertOption(Options options) throws Exception;
	
	public void deleteOptionByOid(int oid) throws Exception;
	
	public List<Options> selectOptionsByEid(int eid) throws Exception;
	
	public void updateOptions(Options options) throws Exception;


	
	//Analysis
	public Analysis selectAnalysisByEid(int eid) throws Exception;
	
	public  void insertAnalysis(Analysis analysis) throws Exception;
	
	public void deleteAnalysisByAid(int aid) throws Exception;
	
	public void updateAnalysis(Analysis analysis)throws Exception;


}
