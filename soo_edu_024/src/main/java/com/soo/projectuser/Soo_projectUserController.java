package com.soo.projectuser;

import java.sql.SQLException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/user")
public class Soo_projectUserController {
	
	@Resource
	private Soo_projectUserService service;
	
	@RequestMapping("/soo_project1_user_list.do")
	public String userList(ModelMap model,Soo_projectUserVO vo) throws Exception {
		
		return "views/user/list";
	}
	
	
	//로그인 창으로 진입
	@RequestMapping(value = "/loginForm.do", method =  RequestMethod.GET)
	public ModelAndView loginForm(@RequestParam(value= "result", required=false) String result,
			 					  @RequestParam(value= "action", required=false) String action, //board_view.jsp action값이 세팅됨.
		       HttpServletRequest request, 
		       HttpServletResponse response)  throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println("viewName이 뭐지" + viewName); // /user/loginForm을 가져온다.
		HttpSession session = request.getSession();
		session.setAttribute("action", action);  
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
			
	}
	
	//회원가입창 들어가는 메서드
	@RequestMapping(value="/memberForm.do" ,method = RequestMethod.GET)
	public String memberForm() {
		
		
		return "/views/soo_edu_user_insert";
	}
	
	
	//회원가입창에서 저장버튼 누르는 순간 작동하는 메서드
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("user") Soo_projectUserVO user,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		Integer result = 0;
		result = service.addMember(user);
		 
		String message;

		ModelAndView mav = new ModelAndView("redirect:/board/soo_project1_Board_list.do");
		
	/*	 message = " <script>";
         message +=" alert('회원가입 축하드립니다.');');";
         message +=" location.href= " +mav;
         message +=" </script>";
         
         String join = message;*/
         
		return mav;
	}
	

	//아이디와 비밀번호를 입력하고 로그인버튼 클릭하는 순간 
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member")  Soo_projectUserVO UserVO,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	UserVO = service.loginbyId(UserVO); //로그인 정보를 불러온다.
	System.out.println("UserVO값:" + UserVO);
	
	if(UserVO != null) { //UserVO가 null이 아니면
	    HttpSession session = request.getSession();
	    session.setAttribute("member", UserVO);
	    session.setAttribute("isLogOn", true); //isLogOn을 true로 설정.
	    session.setAttribute("accessTime", UserVO);
	 
	    boolean bl = (boolean) session.getAttribute("isLogOn");
	    System.out.println(bl); //로그인한 순간 isLogOn이 true로 설정된다.
	   
	    //mav.setViewName("redirect:/board/soo_project1_Board_list.do");
	    
	    String action = (String)session.getAttribute("action");
	    session.removeAttribute("action");
	    
	    if(action!= null) {
	       mav.setViewName("redirect:"+action);
	    }else {
	       mav.setViewName("redirect:/board/soo_project1_Board_list.do");	
	    }

	}else {
	   rAttr.addAttribute("result","loginFailed");
	   mav.setViewName("redirect:/user/loginForm.do");
	}
	return mav;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(Soo_projectUserVO uservo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Date timenow = new Date();
		System.out.println("현재시간" + timenow);
		service.accessTime(timenow);
		
		//System.out.println(uservo);
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		session.removeAttribute("accessTime");
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/soo_project_main/soo_project_mainpage.do");
		return mav;
	}	
	

	@RequestMapping(value = "/Findinfo.do", method =  RequestMethod.GET)
	public String Findid() {
		
		
		return "/views/user/Find";
	}
	
	@RequestMapping(value = "/Findid.do", method =  RequestMethod.POST)
	@ResponseBody
	public Soo_projectUserVO FindId(@RequestBody Soo_projectUserVO inputData) throws SQLException{
		
		System.out.println("생년월일과 휴대폰번호" + inputData.getSoo_user_birth() + inputData.getSoo_user_phone());
		Soo_projectUserVO  outputData = null;
		if(!inputData.getSoo_user_birth().equals("") && inputData.getSoo_user_phone() != null) {    // name, phone이 빈값이 아닐 경우
			outputData =  service.findid(inputData); //service에서 연결한 이 값은 DB아 데이터가 일치하지 않는 경우에 null을 리턴한다.
		System.out.println(outputData);
		} 
		
		//그래서 이 값이 null이 라면
		if(outputData == null) { //이게 쉬운 로직은 아님 님 자꾸 코드를 바꿔서 약간 헷갈림..ㅇㅋ 아무튼 아무튼 ㄳㅂㅂㅂ
			outputData = new Soo_projectUserVO(); //UserVO의 빈객체를 넣는다.
		}
		
		return outputData;
		
	}
	
	
	
	
	
}
