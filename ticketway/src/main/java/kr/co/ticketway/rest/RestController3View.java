package kr.co.ticketway.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( value = "/restmbrbrdview" )
public class RestController3View {

	private final static Logger logger = LoggerFactory.getLogger(RestController3View.class);

	@RequestMapping( value = "/detail_page", method = RequestMethod.GET )
	public String detailPage( String board_no, Model model ) {
		model.addAttribute( "board_no", board_no );
		return "rest/detail_page";//jsp file name
	}//detailPage

	@RequestMapping( value = "/list_page", method = RequestMethod.GET )
	public String listPage() {
		return "rest/list_page";//jsp file name
	}//listPage

}//class











