package com.ttc.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ttc.ssm.po.Examption;
import com.ttc.ssm.po.User;
import com.ttc.ssm.service.DoTestService;
import com.ttc.ssm.service.TestService;
import com.ttc.ssm.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {
	@Autowired
	UserService userservice;
	@Autowired
	DoTestService doTestService;

	// 注册
	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("err", null);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("register");
		return modelAndView;
	}

	// 注册处理
	@RequestMapping(value = "/registersubmit", method = RequestMethod.POST)
	public ModelAndView registersubmit(HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		String passwderror = "passwderror";
		String usererror = "usererror";
		HttpSession session = request.getSession();
		String pasd = request.getParameter("repassword");
		user.setUsername(request.getParameter("username"));
		user.setUserpasswd(request.getParameter("userpasswd"));
		user.setUserage(Integer.parseInt(request.getParameter("userage")));
		user.setUsersex(request.getParameter("usersex"));
		user.setEmail(request.getParameter("email"));
		user.setRole("normal");
		if (pasd.equals(user.getUserpasswd())
				&& (userservice.selectByName(user.getUsername())) == null) {
			userservice.insert(user);
			session.setAttribute("user", user);
			modelAndView.addObject("registsuccess", "registsuccess");
			List<Examption> examptions = new ArrayList<Examption>();
			examptions = doTestService.selectLowExamption();
			modelAndView.addObject("examptions", examptions);
			modelAndView.setViewName("index");
			return modelAndView;
		} else if (!pasd.equalsIgnoreCase(user.getUserpasswd())
				&& (userservice.selectByName(user.getUsername())) == null) {
			session.setAttribute("err", passwderror);
			modelAndView.addObject("userinfo", user);
			modelAndView.setViewName("register");
			return modelAndView;
		} else {
			session.setAttribute("err", usererror);
			modelAndView.setViewName("register");
			return modelAndView;
		}
	}

	// 登录
	@RequestMapping("/login")
	public ModelAndView login() {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}

	// 登录处理
	@RequestMapping(value = "/loginsubmit", method = RequestMethod.POST)
	public ModelAndView loginsubmit(HttpServletRequest request,
			ServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		String role = "manager";
		User user = new User();
		String username = request.getParameter("username");
		String password = request.getParameter("userpasswd");
		user = userservice.selectByNameAndPasswd(username, password);
		if (user != null && (!user.getRole().equals(role))) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("manager", null);
			List<Examption> examptions = new ArrayList<Examption>();
			examptions = doTestService.selectLowExamption();
			modelAndView.addObject("examptions", examptions);
			modelAndView.setViewName("index");
			return modelAndView;
		} else {
			modelAndView.addObject("passwdWrong", "passwdWrong");
			modelAndView.setViewName("login");
			return modelAndView;
		}
	}

	// 用户注销
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		ModelAndView modelAndView = new ModelAndView();
		List<Examption> examptions = new ArrayList<Examption>();
		examptions = doTestService.selectLowExamption();
		modelAndView.addObject("examptions", examptions);
		modelAndView.setViewName("index");
		return modelAndView;
	}

	// 更新用户信息
	@RequestMapping("/updateuser")
	public ModelAndView updateuaer(HttpServletRequest request) throws Exception {
		String username = request.getParameter("username");
		User user = new User();
		user = userservice.selectByName(username);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);
		modelAndView.setViewName("updateuser");
		return modelAndView;
	}

	// 更新用户信息提交处理
	@RequestMapping("/updateusersubmit")
	public ModelAndView updateusersubmit(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		user.setUserid(Integer.parseInt(request.getParameter("userid")));
		user.setUsername(request.getParameter("username"));
		user.setUserage(Integer.parseInt(request.getParameter("userage")));
		user.setUsersex(request.getParameter("usersex"));
		user.setEmail(request.getParameter("email"));
		if (user.getUserid() != null
				&& userservice.selectByName(user.getUsername()) != null) {
			userservice.updateUser(user);
			HttpSession session = request.getSession();
			session.setAttribute("user",
					userservice.selectByName(user.getUsername()));
			List<Examption> examptions = new ArrayList<Examption>();
			examptions = doTestService.selectLowExamption();
			modelAndView.addObject("examptions", examptions);
			modelAndView.setViewName("index");
			return modelAndView;
		} else {
			modelAndView.setViewName("updateuser");
			return modelAndView;
		}
	}

}
