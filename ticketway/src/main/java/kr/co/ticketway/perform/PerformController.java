package kr.co.ticketway.perform;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value="/perform")
public class PerformController {
	
	@Autowired
	private PerformService service;

	private final static Logger logger = LoggerFactory.getLogger(PerformController.class);
	
	@RequestMapping(value = "/plist", method = RequestMethod.GET)
	public String plist(Model model ) {
		List<PerformDTO> list = null;
		list = service.plist();
		model.addAttribute("list", list);
		return "/perform/play_list";//jsp file name
		
	}//list
	
	
	@RequestMapping(value = "/mlist", method = RequestMethod.GET)
	public String mlist(Model model ) {
		List<PerformDTO> list = null;
		list = service.mlist();
		model.addAttribute("list", list);
		return "/perform/musical_list";//jsp file name
		
	}//list
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, String play_no) {
		PerformDTO dto = null;
		dto = service.detail(play_no);
		model.addAttribute("play_info", dto);
		return "/perform/detail";
	}
	
	@RequestMapping(value = "/prototype", method = RequestMethod.GET)
	public String test() {
		return "/prototype";
	}
	
	
	
}
