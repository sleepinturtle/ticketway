package kr.co.ticketway.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( value = "/restview" )
public class RestViewController {

	private final static Logger logger = LoggerFactory.getLogger(RestViewController.class);

	@RequestMapping( value = "/step7view" )
	public String step7View() {
		return "rest/step7";//jsp file name
	}//step7View

	@RequestMapping( value = "/step5view" )
	public String step5View() {
		return "rest/step5";//jsp file name
	}//step5View

}//class












