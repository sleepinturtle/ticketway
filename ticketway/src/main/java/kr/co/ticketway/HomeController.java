package kr.co.ticketway;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ticketway.perform.PerformDTO;
import kr.co.ticketway.perform.PerformService;
import kr.co.ticketway.perform.PerformService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private PerformService service; 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<PerformDTO> list1 = null;
		List<PerformDTO> list2 = null;
		list1 = service.mlist();
		list2 = service.plist();
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		return "home";//jsp file name

	}//home
	
	
	
	
	
	

}//class
