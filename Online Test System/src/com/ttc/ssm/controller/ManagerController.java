package com.ttc.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.IntData;
import com.ttc.ssm.po.Examption;
import com.ttc.ssm.po.History;
import com.ttc.ssm.po.Question;
import com.ttc.ssm.po.User;
import com.ttc.ssm.service.DoTestService;
import com.ttc.ssm.service.TestService;
import com.ttc.ssm.service.UserService;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	UserService userservice;
	@Autowired
	TestService testService;
	@Autowired
	DoTestService dotestService;

	// 打印用户列表
	@RequestMapping("/userManage")
	public ModelAndView authorization() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		List<User> userList = new ArrayList<User>();
		userList = userservice.selectAllUser();
		modelAndView.addObject("userList", userList);
		modelAndView.setViewName("manager/userManage");
		return modelAndView;
	}

	// 修改用户权限
	@RequestMapping("/updateRole")
	public ModelAndView updateRole(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		User user = new User();
		user = userservice.selectByName(username);
		if (user != null) {
			modelAndView.addObject("user", user);
		}
		modelAndView.setViewName("manager/updateRole");
		return modelAndView;
	}

	// 修改权限提交处理
	@RequestMapping("/updateRoleSubmit")
	public ModelAndView updateRoleSubmit(HttpServletRequest request)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		List<User> userList = new ArrayList<User>();
		userList = null;
		User user = new User();
		int userid = Integer.parseInt(request.getParameter("userid"));
		user.setUserid(userid);
		String role = request.getParameter("role");
		if (role.equals("normal")) {
			user.setRole(role);
			user.setLevel(0);
		} else if (role.equals("vip1")) {
			user.setRole("vip");
			user.setLevel(1);
		} else if (role.equals("vip2")) {
			user.setRole("vip");
			user.setLevel(2);
		} else if (role.equals("vip3")) {
			user.setRole("vip");
			user.setLevel(3);
		} else if (role.equals("issuer")) {
			user.setRole(role);
			user.setLevel(0);
		} else {
			user.setRole("normal");
			user.setLevel(0);
		}
		userservice.updateUserRole(user);
		userList = userservice.selectAllUser();
		modelAndView.addObject("userList", userList);
		modelAndView.addObject("updateRoleSuccess", "updateRoleSuccess");
		modelAndView.setViewName("manager/userManage");
		return modelAndView;
	}

	// 删除用户
	@RequestMapping("/deleteUser")
	public ModelAndView deleteUser(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		List<User> userList = new ArrayList<User>();
		userList = null;
		int hid = 0;
		String username = request.getParameter("username");
		if (userservice.selectByName(username) != null) {
			int userid = userservice.selectByName(username).getUserid();
			userservice.deleteUser(userid);
			List<History> histories = dotestService.selectHistoriesByUsername(username);
			for(int j = 0;j<histories.size();j++){
				hid = histories.get(j).getHid();
				dotestService.deleteHistoryByHid(hid);
			}
			List<Examption> examptions = testService.selectByUsername(username);
			for (int i = 0; i < examptions.size(); i++) {
				if (examptions.get(i) != null) {
					int eid = examptions.get(i).getEid();
					testService.deleteExamByEid(eid);
					List<Question> questions = testService
							.selectQuestionByEid(eid);
					for (int j = 0; j < questions.size(); j++) {
						if (questions.get(j) != null) {
							int qid = questions.get(j).getQid();
							testService.deleteQuestionByQid(qid);
							int oid = testService.selectByQid(qid).getOid();
							testService.deleteOptionByOid(oid);
						}
					}
					int aid = testService.selectAnalysisByEid(eid).getAid();
					testService.deleteAnalysisByAid(aid);
				}
			}
			userList = userservice.selectAllUser();
			modelAndView.addObject("userList", userList);
		}
		modelAndView.setViewName("manager/userManage");
		return modelAndView;
	}

	// 搜索用户
	@RequestMapping("/searchUser")
	public ModelAndView searchUser(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		List<User> userList = new ArrayList<User>();
		//User user = new User();
		String username = request.getParameter("username");
		if (username.length()!=0) {
			userList = userservice.selectUserByKeywords(username);
			if (userList.size()!=0) {
				modelAndView.addObject("userList", userList);
			} else {
				userList = userservice.selectAllUser();
				modelAndView.addObject("userList", userList);
				modelAndView.addObject("NotExist", "notexist");
				modelAndView.addObject("voidInput",null);
			}
		} else {
			userList = userservice.selectAllUser();
			modelAndView.addObject("userList", userList);
			modelAndView.addObject("NotExist", null);
			modelAndView.addObject("voidInput","voidInput");
		}
		modelAndView.setViewName("manager/userManage");
		return modelAndView;
	}

	// 试卷管理
	@RequestMapping("/updateUKL")
	public ModelAndView updateUKL(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		List<Examption> examptionsList = new ArrayList<Examption>();
		examptionsList = testService.selectAllExamptions();
		modelAndView.addObject("examptionsList", examptionsList);
		modelAndView.setViewName("manager/updateUKL");
		return modelAndView;
	}

	// 搜索试卷
	@RequestMapping("/searchExam")
	public ModelAndView searchExam(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		String ename = request.getParameter("ename");
		List<Examption> examptionsList = new ArrayList<Examption>();
		if (ename.length()!=0) {
			examptionsList = dotestService.selectExamByKeywords(ename);
			if (examptionsList.size()!=0) {
				modelAndView.addObject("examptionsList", examptionsList);
			} else {
				examptionsList = testService.selectAllExamptions();
				modelAndView.addObject("examptionsList", examptionsList);
				modelAndView.addObject("examNotExist", "examnotexist");
				modelAndView.addObject("inputvoid", null);
			}
		} else {
			examptionsList = testService.selectAllExamptions();
			modelAndView.addObject("examptionsList", examptionsList);
			modelAndView.addObject("inputvoid", "inputvoid");
			modelAndView.addObject("examNotExist", null);
		}
		modelAndView.setViewName("manager/updateUKL");
		return modelAndView;
	}

	// 修改试卷等级、类别、所属用户
	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		String ename = request.getParameter("ename");
		Examption examption = new Examption();
		List<User> userList = new ArrayList<User>();
		userList = userservice.selectAllIssuer();
		examption = testService.selectByEname(ename);
		if (examption != null) {
			modelAndView.addObject("exam", examption);
			modelAndView.addObject("userList", userList);
		}
		modelAndView.setViewName("manager/update");
		return modelAndView;
	}

	// 修改试卷等级、类别、所属用户的提交处理
	@RequestMapping("/updateSubmit")
	public ModelAndView updateSubmit(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		int eid = Integer.parseInt(request.getParameter("eid"));
		Examption examption = new Examption();
		examption.setEid(eid);
		examption.setUsername(request.getParameter("username"));
		examption.setEkind(request.getParameter("ekind"));
		examption.setElevel(Integer.parseInt(request.getParameter("elevel")));
		testService.updateExamptionUKL(examption);
		modelAndView.addObject("updateSuccess", "updateSuccess");
		List<Examption> examptionsList = new ArrayList<Examption>();
		examptionsList = testService.selectAllExamptions();
		modelAndView.addObject("examptionsList", examptionsList);
		modelAndView.setViewName("manager/updateUKL");
		return modelAndView;
	}

	// 管理员登录
	@RequestMapping("/managerLogin")
	public ModelAndView managerLogin(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		String role = "manager";
		User user = new User();
		String username = request.getParameter("username");
		String password = request.getParameter("userpasswd");
		user = userservice.selectByNameAndPasswd(username, password);
		if (user != null && user.getRole().equals(role)) {
			HttpSession session = request.getSession();
			session.setAttribute("manager", user);
			session.setAttribute("user", null);
			List<User> userList = new ArrayList<User>();
			userList = userservice.selectAllUser();
			modelAndView.addObject("userList", userList);
			modelAndView.setViewName("manager/userManage");
			return modelAndView;
		} else {
			modelAndView.addObject("loginWrong", "loginWrong");
			modelAndView.setViewName("manager/managerLogin");
			return modelAndView;
		}
	}

	// 管理员注销
	@RequestMapping("/managerLogout")
	public ModelAndView managerLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("manager", null);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("manager/managerLogin");
		return modelAndView;
	}
}
