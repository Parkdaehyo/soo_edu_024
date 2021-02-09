package com.soo.project;

import java.awt.*;
import java.text.DateFormat;

import java.util.Date;
import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;






/**
 * Handles requests for the application home page.
 */
@Controller
public class Soo_projectController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(Soo_projectController.class);
	
	/**
	 * Simply selects the home view to render by returning its name. 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws AWTException {
		logger.info("Welcome", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);	
		
		return "views/soo_edu_Main";
	}
	
	///test/mvcPattern.do
	@RequestMapping(value = "/test/mvcPattern.do", method = RequestMethod.GET)
	public String test() {
		
		
		return "index";
	}
	
}
