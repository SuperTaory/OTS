package com.ttc.ssm.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.javafx.sg.prism.NGShape.Mode;
import com.sun.xml.internal.ws.resources.ModelerMessages;
import com.ttc.ssm.po.Analysis;
import com.ttc.ssm.po.Examption;
import com.ttc.ssm.po.Options;
import com.ttc.ssm.po.Question;
import com.ttc.ssm.po.User;
import com.ttc.ssm.service.TestService;
import com.ttc.ssm.service.UploadService;
import com.ttc.ssm.service.UserService;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	TestService testService;

	@Autowired
	UploadService uploadService;

	// 做测试
	@RequestMapping("/dotest")
	public ModelAndView dotest() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("dotest");
		return modelAndView;
	}

	// 查询历史测试
	@RequestMapping("/historytest")
	public ModelAndView historytest() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("historytest");
		return modelAndView;
	}

	// 创建试卷
	@RequestMapping("/createtest")
	public ModelAndView createtest(HttpServletRequest request) {
		String username = request.getParameter("username");

		HttpSession session = request.getSession();
		session.setAttribute("examerror", null);
		session.setAttribute("voiderror", null);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("username", username);
		modelAndView.setViewName("test/createtest");
		return modelAndView;
	}

	// 创建试卷提交
	@RequestMapping(value = "/createtestsubmit", method = RequestMethod.POST)
	public String createtestsubmit(Model model, HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		Examption exam = new Examption();
		String examerror = "examerror";
		String voidname = "voidname";
		HttpSession session = request.getSession();
		exam.setEname(request.getParameter("ename"));
		exam.setUsername(request.getParameter("username"));
		exam.setEkind(request.getParameter("ekind"));
		exam.setElevel(Integer.parseInt(request.getParameter("elevel")));
		exam.setQnumbers(Integer.parseInt(request.getParameter("qnumbers")));
		if (testService.selectByEname(exam.getEname()) == null) {
			testService.insert(exam);
			session.setAttribute("eid",
					testService.selectByEname(exam.getEname()).getEid());
			model.addAttribute("qnum", 1);
			model.addAttribute("qnumbers", exam.getQnumbers());
			return "test/createquestion";
		}
		/*
		 * else if(exam.getEname()==null){ session.setAttribute("voiderror",
		 * voidname); return "test/createtest"; }
		 */
		else {
			session.setAttribute("examerror", examerror);
			return "test/createtest";
		}
	}

	// 创建问题提交处理
	@RequestMapping(value = "/createQuestionSubmit", method = RequestMethod.POST)
	public String createQuestionSubmit(Model model, HttpServletRequest request,
			MultipartFile tpic, MultipartFile apic, MultipartFile bpic,
			MultipartFile cpic, MultipartFile dpic, MultipartFile tvideo,
			MultipartFile taudio) throws Exception {
		request.setCharacterEncoding("utf-8");

		int i = Integer.parseInt(request.getParameter("qnum"));
		int j = Integer.parseInt(request.getParameter("qnumbers"));

		Question question = new Question();
		question.setEid(Integer.parseInt(request.getParameter("eid")));
		question.setTanswer(request.getParameter("tanswer"));
		question.setTword(request.getParameter("tword"));
		question.setTscore(Integer.parseInt(request.getParameter("tscore")));
		if (question.getTword() != null
				&& testService.selectByQname(question.getTword()) == null) {
			question.setTpic(uploadService.uploadPic(tpic));
			question.setTvideo(uploadService.uploadPic(tvideo));
			question.setTaudio(uploadService.uploadPic(taudio));
			testService.insertQuestion(question);

			Options options = new Options();
			options.setQid(testService.selectByQname(question.getTword())
					.getQid());
			options.setEid(question.getEid());
			options.setAword(request.getParameter("aword"));
			options.setApic(uploadService.uploadPic(apic));
			options.setBword(request.getParameter("bword"));
			options.setBpic(uploadService.uploadPic(bpic));
			options.setCword(request.getParameter("cword"));
			options.setCpic(uploadService.uploadPic(cpic));
			options.setDword(request.getParameter("dword"));
			options.setDpic(uploadService.uploadPic(dpic));

			int param = options.getQid();
			if (options.getQid() != null) {
				if (testService.selectByQid(param) == null) {
					testService.insertOption(options);
				}
			}
		}
		if (i < j) {
			i = i + 1;
			model.addAttribute("qnum", i);
			model.addAttribute("qnumbers", j);
			return "test/createquestion";
		}
		return "test/createAnalysis";
	}

	// 打印试卷列表
	@RequestMapping("/testlist")
	public ModelAndView managetest(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		List<Examption> examlist = new ArrayList<Examption>();
		examlist = testService.selectByUsername(username);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("examlist", examlist);
		modelAndView.addObject("username", username);
		modelAndView.setViewName("test/testlist");
		return modelAndView;
	}

	// 修改试卷
	@RequestMapping("/update_test")
	public ModelAndView manage_test(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String ename = request.getParameter("ename");
		Examption exam = new Examption();

		exam = testService.selectByEname(ename);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exam", exam);
		modelAndView.setViewName("test/update_test");
		return modelAndView;
	}

	// 删除试卷
	@RequestMapping("/delete_test")
	public ModelAndView delete_test(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String ename = request.getParameter("ename");
		String username = null;
		Examption exam = new Examption();
		exam = testService.selectByEname(ename);
		if (exam != null) {
			int eid = exam.getEid();
			username = exam.getUsername();
			List<Question> quesList = testService.selectQuestionByEid(eid);
			if (quesList != null) {
				for (int j = 0; j < quesList.size(); j++) {
					testService.deleteQuestionByQid(quesList.get(j).getQid());
				}
			}
			List<Options> optionslist = testService.selectOptionsByEid(eid);
			if (optionslist != null) {
				for (int k = 0; k < optionslist.size(); k++) {
					testService.deleteOptionByOid(optionslist.get(k).getOid());
				}
			}
			Analysis analysis = testService.selectAnalysisByEid(eid);
			if (analysis != null) {
				testService.deleteAnalysisByAid(analysis.getAid());
			}
			testService.deleteExamByEid(eid);
		}
		List<Examption> examlist = new ArrayList<Examption>();
		examlist = testService.selectByUsername(username);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("examlist", examlist);
		modelAndView.setViewName("test/testlist");
		return modelAndView;
	}

	// 查询试卷
	@RequestMapping("/querytest")
	public ModelAndView querytest(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		String ename = request.getParameter("ename");
		String username = request.getParameter("username");
		List<Examption> examlist = new ArrayList<Examption>();
		Examption exam = new Examption();
		if (ename.length() != 0) {
			exam = testService.selectByEname(ename);
			if (exam != null) {
				examlist.add(exam);
			} else {
				examlist = testService.selectByUsername(username);
				modelAndView.addObject("examNotExist", "examNotExist");
				modelAndView.addObject("voidinput", null);
			}
		} else {
			modelAndView.addObject("examNotExist", null);
			modelAndView.addObject("voidinput", "voidinput");
			examlist = testService.selectByUsername(username);
		}

		modelAndView.addObject("examlist", examlist);
		modelAndView.addObject("username", username);
		modelAndView.setViewName("test/testlist");
		return modelAndView;
	}

	// 查询某个试卷-分析维护
	@RequestMapping("/queryAnalysis")
	public ModelAndView queryAnalysis(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String ename = request.getParameter("ename");
		String username = request.getParameter("username");
		ModelAndView modelAndView = new ModelAndView();
		List<Examption> examlist = new ArrayList<Examption>();
		Examption exam = new Examption();
		if (ename.length() != 0) {
			exam = testService.selectByEname(ename);
			if (exam != null) {
				examlist.add(exam);
			} else {
				examlist = testService.selectByUsername(username);
				modelAndView.addObject("examNotExist", "examNotExist");
				modelAndView.addObject("voidinput", null);
			}
		} else {
			modelAndView.addObject("examNotExist", null);
			modelAndView.addObject("voidinput", "voidinput");
			examlist = testService.selectByUsername(username);
		}

		modelAndView.addObject("username", username);
		modelAndView.addObject("examlist", examlist);
		modelAndView.setViewName("test/manageanalysis");
		return modelAndView;
	}

	// 查询某个试卷-试卷问题维护
	@RequestMapping("/queryQuestion")
	public ModelAndView queryQuestion(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String ename = request.getParameter("ename");
		String username = request.getParameter("username");
		ModelAndView modelAndView = new ModelAndView();
		List<Examption> examlist = new ArrayList<Examption>();
		Examption exam = new Examption();
		if (ename.length() != 0) {
			exam = testService.selectByEname(ename);
			if (exam != null) {
				examlist.add(exam);
			} else {
				examlist = testService.selectByUsername(username);
				modelAndView.addObject("examNotExist", "examNotExist");
				modelAndView.addObject("voidinput", null);
			}
		} else {
			modelAndView.addObject("voidinput", "voidinput");
			modelAndView.addObject("examNotExist", null);
			examlist = testService.selectByUsername(username);
		}
		modelAndView.addObject("username", username);
		modelAndView.addObject("examlist", examlist);
		modelAndView.setViewName("test/managequestion");
		return modelAndView;
	}

	// 试卷维护
	@RequestMapping("/managetestsubmit")
	public ModelAndView managetestsubmit(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int eid = Integer.parseInt(request.getParameter("eid"));
		String ename = request.getParameter("ename");
		testService.updateExamption(eid, ename);
		String username = testService.selectByEname(ename).getUsername();
		List<Examption> examlist = new ArrayList<Examption>();
		examlist = testService.selectByUsername(username);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("examlist", examlist);
		modelAndView.addObject("username", username);
		modelAndView.setViewName("test/testlist");
		return modelAndView;
	}

	// 提交试卷分析
	@RequestMapping("/analysisSubmit")
	public ModelAndView analysisSubmit(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		Analysis analysis = new Analysis();
		HttpSession session = request.getSession();
		int eid = Integer.parseInt(request.getParameter("eid"));
		analysis.setEid(eid);
		analysis.setAcontent1(request.getParameter("acontent1"));
		analysis.setAcontent2(request.getParameter("acontent2"));
		analysis.setAcontent3(request.getParameter("acontent3"));
		analysis.setAcontent4(request.getParameter("acontent4"));

		if (analysis.getEid() != null) {
			if (testService.selectAnalysisByEid(analysis.getEid()) == null) {
				testService.insertAnalysis(analysis);
				session.setAttribute("success", "success");
			} else {
				int aid = testService.selectAnalysisByEid(analysis.getEid())
						.getAid();
				analysis.setAid(aid);
				testService.updateAnalysis(analysis);
				session.setAttribute("updateAnalysis", "success");
			}
		}
		User user = (User) session.getAttribute("user");
		String username = user.getUsername();
		ModelAndView modelAndView = new ModelAndView();
		List<Examption> examlist = new ArrayList<Examption>();
		examlist = testService.selectByUsername(username);
		modelAndView.addObject("username", username);
		modelAndView.addObject("examlist", examlist);
		modelAndView.setViewName("test/manageanalysis");
		return modelAndView;
	}

	// 试卷分析维护-打印试卷列表
	@RequestMapping("/manageanalysis")
	public ModelAndView manageanalysis(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		String username = request.getParameter("username");
		List<Examption> examlist = new ArrayList<Examption>();
		examlist = testService.selectByUsername(username);
		modelAndView.addObject("username", username);
		modelAndView.addObject("examlist", examlist);
		modelAndView.setViewName("test/manageanalysis");
		return modelAndView;
	}

	// 修改试卷分析
	@RequestMapping("/update_analysis")
	public ModelAndView update_analysis(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int eid = Integer.parseInt(request.getParameter("eid"));
		Analysis analysis = new Analysis();
		analysis = testService.selectAnalysisByEid(eid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("analysis", analysis);
		modelAndView.addObject("eid", eid);
		modelAndView.setViewName("test/update_analysis");
		return modelAndView;
	}

	// 试卷问题维护-打印试卷列表
	@RequestMapping("/managequestion")
	public ModelAndView managequestion(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		List<Examption> examlist = new ArrayList<Examption>();
		examlist = testService.selectByUsername(username);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("examlist", examlist);
		modelAndView.addObject("username", username);
		modelAndView.setViewName("test/managequestion");
		return modelAndView;
	}

	// 修改试卷问题(eid-session)
	@RequestMapping("/update_question")
	public ModelAndView update_question(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int eid = Integer.parseInt(request.getParameter("eid"));
		session.setAttribute("eid", eid);
		List<Question> questionsList = testService.selectQuestionByEid(eid);
		ModelAndView modelAndView = new ModelAndView();
		if (questionsList != null) {
			modelAndView.addObject("questionList", questionsList);
			modelAndView.addObject("eid", eid);
		}
		modelAndView.setViewName("test/update_question");
		return modelAndView;
	}

	// 修改问题和选项
	@RequestMapping("/update_options")
	public ModelAndView update_options(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		Question question = new Question();
		Options options = new Options();
		ModelAndView modelAndView = new ModelAndView();
		int qid = Integer.parseInt(request.getParameter("qid"));
		if (qid != 0) {
			question = testService.selectQuestionByQid(qid);
			options = testService.selectByQid(qid);
			modelAndView.addObject("question", question);
			modelAndView.addObject("options", options);
		}
		modelAndView.setViewName("test/update_options");
		return modelAndView;
	}

	// 删除问题
	@RequestMapping("/delete_question")
	public ModelAndView delete_question(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		int qid = Integer.parseInt(request.getParameter("qid"));
		if (testService.selectQuestionByQid(qid) != null) {
			int eid = testService.selectQuestionByQid(qid).getEid();
			if (testService.selectByQid(qid) != null) {
				// 删除问题
				testService.deleteQuestionByQid(qid);
				testService.deleteOptionByOid(testService.selectByQid(qid)
						.getOid());
				testService.updateExamptionQnumbers2(eid);// 删除试题后，试卷题数减一
				// 重新查询试题列表
				List<Question> questionsList = testService
						.selectQuestionByEid(eid);
				if (questionsList != null) {
					modelAndView.addObject("questionList", questionsList);
					modelAndView.addObject("eid", eid);
				}
			}
		}
		modelAndView.setViewName("test/update_question");
		return modelAndView;
	}

	// 添加问题
	@RequestMapping("/addQuestion")
	public ModelAndView addQuestion(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("test/addQuestion");
		return modelAndView;
	}

	// 添加问题提交处理
	@RequestMapping("/addQuestionSubmit")
	public ModelAndView addQuestionSubmit(HttpServletRequest request,
			MultipartFile tpic, MultipartFile apic, MultipartFile bpic,
			MultipartFile cpic, MultipartFile dpic, MultipartFile tvideo,
			MultipartFile taudio) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		Question question = new Question();
		int eid = Integer.parseInt(request.getParameter("eid"));
		question.setEid(eid);
		question.setTanswer(request.getParameter("tanswer"));
		question.setTword(request.getParameter("tword"));
		question.setTscore(Integer.parseInt(request.getParameter("tscore")));
		question.setTpic(uploadService.uploadPic(tpic));
		question.setTvideo(uploadService.uploadPic(tvideo));
		question.setTaudio(uploadService.uploadPic(taudio));
		if (question.getTword() != null
				&& testService.selectByQname(question.getTword()) == null) {
			// 添加试题
			testService.insertQuestion(question);
			Options options = new Options();
			options.setQid(testService.selectByQname(question.getTword())
					.getQid());
			options.setEid(question.getEid());
			options.setAword(request.getParameter("aword"));
			options.setApic(uploadService.uploadPic(apic));
			options.setBword(request.getParameter("bword"));
			options.setBpic(uploadService.uploadPic(bpic));
			options.setCword(request.getParameter("cword"));
			options.setCpic(uploadService.uploadPic(cpic));
			options.setDword(request.getParameter("dword"));
			options.setDpic(uploadService.uploadPic(dpic));
			int param = options.getQid();
			if (options.getQid() != null) {
				if (testService.selectByQid(param) == null) {
					testService.insertOption(options);
					testService.updateExamptionQnumbers(eid);
					modelAndView.addObject("addsuccess", "addsuccess");

				}
			}
		}
		List<Question> questionsList = testService.selectQuestionByEid(eid);
		if (questionsList != null) {
			modelAndView.addObject("questionList", questionsList);
			modelAndView.addObject("eid", eid);
		}
		modelAndView.setViewName("test/update_question");
		return modelAndView;
	}

	// 查询问题
	@RequestMapping("/searchQuestion")
	public ModelAndView searchQuestion(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		String tword = request.getParameter("qname");
		int eid = Integer.parseInt(request.getParameter("eid"));
		List<Question> questions = new ArrayList<Question>();
		if (tword != null) {
			if (testService.selectByQname(tword) != null) {
				questions.add(testService.selectByQname(tword));
			} else {
				questions = testService.selectQuestionByEid(eid);
				modelAndView.addObject("questionNotExist", "questionNotExist");
			}
		} else {
			questions = testService.selectQuestionByEid(eid);
		}
		modelAndView.addObject("questionList", questions);
		modelAndView.addObject("eid", eid);
		modelAndView.setViewName("test/update_question");
		return modelAndView;
	}

	// 修改试题提交处理
	@RequestMapping("/updateQuestionSubmit")
	public ModelAndView updateQuestionSubmit(HttpServletRequest request,
			MultipartFile tpic, MultipartFile apic, MultipartFile bpic,
			MultipartFile cpic, MultipartFile dpic, MultipartFile tvideo, MultipartFile taudio)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String pic=request.getParameter("pic");
		String video=request.getParameter("video");
		String audio=request.getParameter("audio");
		String pica=request.getParameter("pica");
		String picb=request.getParameter("picb");
		String picc=request.getParameter("picc");
		String picd=request.getParameter("picd");
		ModelAndView modelAndView = new ModelAndView();
		Question question = new Question();
		Options options = new Options();
		int qid = Integer.parseInt(request.getParameter("qid"));
		question = testService.selectQuestionByQid(qid);
		options = testService.selectByQid(qid);
		if (question != null) {
			if (options != null) {
				int oid = testService.selectByQid(qid).getOid();
				question.setQid(qid);
				question.setTanswer(request.getParameter("tanswer"));
				question.setTword(request.getParameter("tword"));
				if(pic!=null&&pic.equals("deletepic")){
					question.setTpic(null);
				}
				else{
					if (tpic.getSize() != 0) {
						question.setTpic(uploadService.uploadPic(tpic));
					}
				}
				if(video!=null&&video.equals("deletevideo")){
					question.setTvideo(null);
				}
				else{
					if (tvideo.getSize() != 0) {
						question.setTvideo(uploadService.uploadPic(tvideo));
					}
				}
				if(audio!=null&&audio.equals("deleteaudio")){
					question.setTaudio(null);
				}
				else{
					if(taudio.getSize()!=0){
						question.setTaudio(uploadService.uploadPic(taudio));
					}
				}
				
				
				question.setTscore(Integer.parseInt(request
						.getParameter("tscore")));
				options.setOid(oid);
				options.setAword(request.getParameter("aword"));
				if(pica!=null&&pica.equals("deletepic")){
					options.setApic(null);
				}
				else{
					if (apic.getSize() != 0) {
						options.setApic(uploadService.uploadPic(apic));
					}
				}
				
				options.setBword(request.getParameter("bword"));
				if(picb!=null&&picb.equals("deletepic")){
					options.setBpic(null);
				}
				else{
					if (bpic.getSize() != 0) {
						options.setBpic(uploadService.uploadPic(bpic));
					}
				}
				
				options.setCword(request.getParameter("cword"));
				if(picc!=null&&picc.equals("deletepic")){
					options.setCpic(null);
				}
				else{
					if (cpic.getSize() != 0) {
						options.setCpic(uploadService.uploadPic(cpic));
					}
				}
				
				options.setDword(request.getParameter("dword"));
				if(picd!=null&&picd.equals("deletepic")){
					options.setDpic(null);
				}
				else{
					if (dpic.getSize() != 0) {
						options.setDpic(uploadService.uploadPic(dpic));
					}
				}
				
				testService.updateQuestion(question);
				testService.updateOptions(options);
				modelAndView.addObject("updatesuccess", "updatesuccess");
				int eid = testService.selectQuestionByQid(qid).getEid();
				List<Question> questionsList = testService
						.selectQuestionByEid(eid);
				if (questionsList != null) {
					modelAndView.addObject("questionList", questionsList);
					modelAndView.addObject("eid", eid);
				}
			}
		}
		modelAndView.setViewName("test/update_question");
		return modelAndView;
	}
}
