package com.ttc.ssm.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.management.relation.Role;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.bcel.internal.generic.INEG;
import com.ttc.ssm.po.Analysis;
import com.ttc.ssm.po.Examption;
import com.ttc.ssm.po.History;
import com.ttc.ssm.po.Options;
import com.ttc.ssm.po.Question;
import com.ttc.ssm.po.User;
import com.ttc.ssm.service.DoTestService;
import com.ttc.ssm.service.TestService;

@Controller
@RequestMapping("/dotest")
public class DoTestController {

	@Autowired
	DoTestService doTestService;
	@Autowired
	TestService testService;

	// 开始测试
	@RequestMapping("/startTest")
	public ModelAndView startTest(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String role = null;
		ModelAndView modelAndView = new ModelAndView();
		Examption examption = new Examption();
		List<Question> questionsList = new ArrayList<Question>();
		List<Options> optionsList = new ArrayList<Options>();
		int eid = Integer.parseInt(request.getParameter("eid"));
		examption = doTestService.selectExamptionByEid(eid);
		int elevel = examption.getElevel();
		if ((user == null && elevel > 1)) {
			List<Examption> examptions = new ArrayList<Examption>();
			examptions = doTestService.selectLowExamption();
			modelAndView.addObject("examptions", examptions);
			modelAndView.addObject("levelWrong", "levelWrong");
			modelAndView.setViewName("index");
			return modelAndView;
		} else if (user != null) {
			role = user.getRole();
			if ((role.equals("normal") && elevel > 2)) {
				List<Examption> examptions = new ArrayList<Examption>();
				examptions = doTestService.selectLowExamption();
				modelAndView.addObject("examptions", examptions);
				modelAndView.addObject("levelWrong", "levelWrong");
				modelAndView.setViewName("index");
				return modelAndView;
			} else if (role.equals("issuer")) {
				List<Examption> examptions = new ArrayList<Examption>();
				examptions = doTestService.selectLowExamption();
				modelAndView.addObject("examptions", examptions);
				modelAndView.addObject("issuer", "notsupport");
				modelAndView.setViewName("index");
				return modelAndView;
			}
		}
		questionsList = testService.selectQuestionByEid(eid);
		optionsList = testService.selectOptionsByEid(eid);
		request.setAttribute("questionsList", questionsList);
		request.setAttribute("optionsList", optionsList);
		modelAndView.addObject("examption", examption);
		modelAndView.setViewName("dotest/doTest");
		return modelAndView;
	}

	// 中级测试
	@RequestMapping("/midtest")
	public ModelAndView midtest(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		List<Examption> examptions = new ArrayList<Examption>();
		List<Examption> allExamptions = new ArrayList<Examption>();
		allExamptions = testService.selectAllExamptions();
		for (int i = 0; i < allExamptions.size(); i++) {
			if (allExamptions.get(i).getElevel() == 2) {
				examptions.add(allExamptions.get(i));
			}
		}
		modelAndView.addObject("examptions", examptions);
		modelAndView.addObject("level", "中级测试");
		modelAndView.setViewName("index");
		return modelAndView;
	}

	// 高级测试
	@RequestMapping("/hightest")
	public ModelAndView hightest(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		List<Examption> examptions = new ArrayList<Examption>();
		List<Examption> allExamptions = new ArrayList<Examption>();
		allExamptions = testService.selectAllExamptions();
		for (int i = 0; i < allExamptions.size(); i++) {
			if (allExamptions.get(i).getElevel() == 3) {
				examptions.add(allExamptions.get(i));
			}
		}
		modelAndView.addObject("examptions", examptions);
		modelAndView.addObject("level", "高级测试");
		modelAndView.setViewName("index");
		return modelAndView;
	}

	// 查询所有中的某张试卷
	@RequestMapping("/queryAllTest")
	public ModelAndView queryAllTest(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		List<Examption> examptions = new ArrayList<Examption>();
		String keywords = request.getParameter("ename");
		if (keywords.length() != 0) {
			examptions = doTestService.selectExamByKeywords(keywords);
			if (examptions.size() != 0) {
				modelAndView.addObject("examptions", examptions);
			} else {
				modelAndView.addObject("notExist", "notExist");
				modelAndView.addObject("inputvoid", "notvoid");
				examptions = doTestService.selectLowExamption();
				modelAndView.addObject("examptions", examptions);
			}
		} else {
			modelAndView.addObject("inputvoid", "inputvoid");
			modelAndView.addObject("notExist", "false");
			examptions = doTestService.selectLowExamption();
			modelAndView.addObject("examptions", examptions);
		}
		modelAndView.setViewName("index");
		return modelAndView;
	}

	// 查询历史测试
	@RequestMapping("/historytest")
	public ModelAndView historytest(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			String username = user.getUsername();
			List<History> histories = doTestService
					.selectHistoriesByUsername(username);
			modelAndView.addObject("histories", histories);
		}
		modelAndView.setViewName("dotest/historyTest");
		return modelAndView;
	}

	// 查询所有中的某张试卷
	@RequestMapping("/queryHistoryTest")
	public ModelAndView queryHistoryTest(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ModelAndView modelAndView = new ModelAndView();
		List<History> histories = new ArrayList<History>();
		String keywords = request.getParameter("ename");
		String username = user.getUsername();
		if (keywords.length() != 0) {
			histories = doTestService.selectHistoriesByKeywords(keywords,
					username);
			if (histories.size() != 0) {
				modelAndView.addObject("histories", histories);
			} else {
				modelAndView.addObject("notExist", "notExist");
				modelAndView.addObject("inputvoid", "notvoid");
				histories = doTestService.selectHistoriesByUsername(username);
				modelAndView.addObject("histories", histories);
			}
		} else {
			modelAndView.addObject("inputvoid", "inputvoid");
			modelAndView.addObject("notExist", "false");
			histories = doTestService.selectHistoriesByUsername(username);
			modelAndView.addObject("histories", histories);
		}
		modelAndView.setViewName("dotest/historyTest");
		return modelAndView;
	}

	// 查看详细历史测试信息
	@RequestMapping("/detail")
	public ModelAndView detail(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		int hid = Integer.parseInt(request.getParameter("hid"));
		History history = doTestService.selectHistoryByHid(hid);
		modelAndView.addObject("history", history);
		modelAndView.setViewName("dotest/detailHistoryTest");
		return modelAndView;
	}

	// 交卷处理
	@RequestMapping("/doTestSubmit")
	public ModelAndView doTestSubmit(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int eid = Integer.parseInt(request.getParameter("eid"));
		int num = doTestService.selectExamptionByEid(eid).getQnumbers();
		int score = 0;
		int totalScore = 0;
		String choose = "num";
		String value = null;
		List<Question> questions = testService.selectQuestionByEid(eid);
		History history = new History();
		history.setEid(eid);
		history.setEname(doTestService.selectExamptionByEid(eid).getEname());
		if (user == null) {
			history.setUsername("游客");
		} else {
			history.setUsername(user.getUsername());
		}
		for (int i = 0; i < num; i++) {
			choose = choose + i;
			value = request.getParameter(choose);
			if (value != null && questions.get(i).getTanswer().equals(value)) {
				score = score + questions.get(i).getTscore();
			} else {
				score = score + 0;
			}
			totalScore = totalScore + questions.get(i).getTscore();
			choose = "num";
		}
		history.setHscore(score);
		Analysis analysis = testService.selectAnalysisByEid(eid);
		if (score <= totalScore / 4) {
			history.setAnalysis(analysis.getAcontent1());
		} else if (score <= totalScore / 2 && score > totalScore / 4) {
			history.setAnalysis(analysis.getAcontent2());
		} else if (score > totalScore / 2
				&& score <= (totalScore - totalScore / 4)) {
			history.setAnalysis(analysis.getAcontent3());
		} else {
			history.setAnalysis(analysis.getAcontent4());
		}
		java.sql.Timestamp testtime = new java.sql.Timestamp(
				new Date().getTime());
		history.setTesttime(testtime);
		if (user != null) {
			doTestService.inserHistory(history);
		}
		modelAndView.addObject("history", history);
		modelAndView.setViewName("dotest/doTestResult");
		return modelAndView;
	}

	// 删除历史
	@RequestMapping("/deleteHistory")
	public ModelAndView deleteHistory(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		int hid = Integer.parseInt(request.getParameter("hid"));
		if (doTestService.selectHistoryByHid(hid) != null) {
			doTestService.deleteHistoryByHid(hid);
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			String username = user.getUsername();
			List<History> histories = doTestService
					.selectHistoriesByUsername(username);
			modelAndView.addObject("histories", histories);
		}
		modelAndView.setViewName("dotest/historyTest");
		return modelAndView;
	}
}
