package kr.co.ticketway.ticketing;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ticketway.theater.TheaterAdminDTO;
import kr.co.ticketway.theater.TheaterService;

@Controller
@RequestMapping( value = "ticketing" )
public class TicketingController {

	private static final Logger logger = LoggerFactory.getLogger(TicketingController.class);
	
	@Autowired
	   private TheaterService service;

	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<TheaterAdminDTO> list = null;
		list = service.ticketing();
		model.addAttribute("list", list);
		return"ticketing/list";
	}//home
	
	@RequestMapping(value ="/ticket", method = RequestMethod.GET)
	public String ticket(Model model) {
		return"ticketing/ticket";

		
	}//home

}//class