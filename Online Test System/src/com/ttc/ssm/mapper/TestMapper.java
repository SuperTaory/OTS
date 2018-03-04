package com.ttc.ssm.mapper;

import org.apache.ibatis.annotations.Param;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
import com.ttc.ssm.po.Analysis;
import com.ttc.ssm.po.Examption;
import com.ttc.ssm.po.History;
import com.ttc.ssm.po.Options;
import com.ttc.ssm.po.Question;

public interface TestMapper {
	
	//Examption
	void insert(Examption examption);
	
	void updateExamption(@Param("eid")int eid,@Param("ename")String ename);
	
	Examption selectByEname(@Param("ename")String ename);
	
	java.util.List<Examption> selectByUsername(@Param("username")String username);
	
	void deleteExamByEid(@Param("eid")int eid);
	
	java.util.List<Examption> selectAllExamptions();
	
	void updateExamptionUKL(Examption examption);
	
	void updateExamptionQnumbers(@Param("eid")int eid);
	
	void updateExamptionQnumbers2(@Param("eid")int eid);
	
	Examption selectExamptionByEid(@Param("eid")int eid);
	
	java.util.List<Examption> selectLowExamption();
	
	java.util.List<Examption> selectExamByKeywords(@Param("keywords")String keywords);
	
	//Question
	Question selectByQname(@Param("qname")String qname);
	
	void insertQuestion(Question question);
	
	void deleteQuestionByQid(@Param("qid")int qid);
	
	java.util.List<Question> selectQuestionByEid(@Param("eid")int eid); 
	
	Question selectQuestionByQid(@Param("qid")int qid);
	
	void updateQuestion(Question question);
	
	//Options
	Options selectByQid(@Param("qid")int qid);
	
	void insertOption(Options options);
	
	void deleteOptionByOid(@Param("oid")int oid);
	
	java.util.List<Options> selectOptionsByEid(@Param("eid")int eid);
	
	void updateOptions(Options options);
	
	//Analysis
	Analysis selectAnalysisByEid(@Param("eid")int eid);
	
	void insertAnalysis(Analysis analysis);
	
	void deleteAnalysisByAid(@Param("aid")int aid);
	
	void updateAnalysis(Analysis analysis);
	
	//History
	void inserHistory(History history);
	
	java.util.List<History> selectHistoriesByUsername(@Param("username")String username);
	
	History selectHistoryByHid(@Param("hid")int hid);
	
	java.util.List<History> selectHistoriesByKeywords(@Param("keywords")String keywords,@Param("username")String username);
	
	void deleteHistoryByHid(@Param("hid")int hid);
	
}
