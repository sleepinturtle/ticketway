package kr.co.ticketway.rest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.ticketway.board.free.FreeBoardDTO;
import kr.co.ticketway.board.free.FreeBoardService;

@RestController
@RequestMapping( value = "/rest2" )
public class RestController2 {

	private final static Logger logger = LoggerFactory.getLogger(RestController2.class);

	@Autowired
	private FreeBoardService freeBoardService;

	@RequestMapping( value = "/step7", method = RequestMethod.POST )
	public void step7( @RequestBody FreeBoardDTO dto ) {
		System.out.println( dto.getTitle() );
		System.out.println( dto.getWriter() );
		System.out.println( dto.getPwd() );
		System.out.println( dto.getContents() );
	}//step7	//@RequestBody : json data를 dto로 변환해 주는 역할.

	@RequestMapping( value = "/step6/{data1}/{data2}", method = RequestMethod.GET )
	public String step6( @PathVariable("data1") int intVar1, @PathVariable("data2") String sVar1 ) {

		return "<h1>Your input data is [" + intVar1 + "] and [" + sVar1 + "].</h1>";

	}//step6

	@RequestMapping( value = "/step5/{data1}", method = RequestMethod.GET )
	public String step5( @PathVariable("data1") int intVar1 ) {

		return "<h1>Your input data is [" + intVar1 + "].</h1>";

	}//step5

	@RequestMapping( value = "/step4", method = RequestMethod.GET )
	public List<FreeBoardDTO> step4() {
		List<FreeBoardDTO> list = freeBoardService.list();
		return list;
	}//step4

	@RequestMapping( value = "/step3", method = RequestMethod.GET )
	public FreeBoardDTO step3() {
		List<FreeBoardDTO> list = freeBoardService.list();
		return list.get(0);
	}//step3

	@RequestMapping( value = "/step2", method = RequestMethod.GET )
	public String step2() {
		return "rest/step1";
	}//step2

	/*
	 * 일반 Controller는 @ResponseBody가 있는 메소드만 restful service.
	 * RestController는 모든 메소드가 restful service.
	 */

}//class







