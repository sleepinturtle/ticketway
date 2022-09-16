package kr.co.ticketway.ticketing;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( value = "ticketing" )
public class TicketingController {

	private static final Logger logger = LoggerFactory.getLogger(TicketingController.class);

	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public String list(Model model) {
		return"ticketing/list";

		
	}//home
	
	@RequestMapping(value ="/ticket", method = RequestMethod.GET)
	public String ticket(Model model) {
		return"ticketing/ticket";

		
	}//home

}//class