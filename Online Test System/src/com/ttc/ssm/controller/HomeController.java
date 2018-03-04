package com.ttc.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ttc.ssm.po.Examption;
import com.ttc.ssm.service.DoTestService;
import com.ttc.ssm.service.TestService;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	DoTestService doTestService;
	
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.setAttribute("manager", null);
		ModelAndView modelAndView = new ModelAndView();
		List<Examption> examptions = new ArrayList<Examption>();
		examptions = doTestService.selectLowExamption();
		modelAndView.addObject("examptions", examptions);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping("/managerLogin")
	public ModelAndView managerLogin(){
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("manager/managerLogin");
		return modelAndView;
	}
	
	@RequestMapping("/manager")
	public ModelAndView manager(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("manager/managerIndex");
		return modelAndView;
	}

}
