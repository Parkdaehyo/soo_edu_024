package com.soo.projectmain;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class Soo_projectMainController {
	
	@Resource(name = "Soo_projectMainService")
	private Soo_projectMainService service;
	
	@RequestMapping(value = "/soo_project_main/soo_project_main.do")
	public String soo_project_main(ModelMap model, Soo_projectMainVO vo) throws Exception {
		return "views/soo_edu_Main";
		
	}
	@RequestMapping(value = "/test/mvcPattern.do")
	public String test() throws Exception{
		
		return "board/board_list";
	}
	
	@RequestMapping(value = "/soo_project_main/soo_project_mainpage.do")
	public String soo_project_mainpage() throws Exception {
		return "views/soo_edu_Main";
		
	}
	
	@RequestMapping(value = "/soo_project_main/soo_project_map.do")
	public String soo_project_map() throws Exception {
		
		return "views/map";
		
	}
	
/*	@RequestMapping(value = "/soo_project_main/soo_project_loginForm.do")
	public String loginForm() {
		
		return "views/loginForm";
	}*/
	
	
	
}
