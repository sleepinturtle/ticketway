package kr.co.ticketway.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping( value = "/rest1" )
public class RestController1 {

	private final static Logger logger = LoggerFactory.getLogger(RestController1.class);

	@RequestMapping( value = "/step1" )
	@ResponseBody
	public String step1() {
		return "rest/step1";
	}//step1

	/*
	 * Rest API : REpresentational State Transfer API : json 주고 받기.
	 * json : javascript object notation
	 * @ResponseBody : 일반 컨트롤러에서 restful service를 가능하게 해주는 어노테이션.
	 *  -> restful service를 전담하는 controller -> @RestController
	 */

}//class
