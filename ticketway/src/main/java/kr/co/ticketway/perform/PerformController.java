package kr.co.ticketway.perform;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ticketway.util.dto.MemberDTO;



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
	public String detail(Model model, String play_no, HttpSession session) {
		PerformDTO dto = null;
		PerformDTO dto2 = null;
		List<ReviewDTO> dto1 = null;
		dto = service.detail(play_no);
		dto1 = service.review(play_no);
		dto2 = service.thtmap(play_no);
		model.addAttribute("play_info", dto);
		model.addAttribute("review_info", dto1);
		model.addAttribute("tht", dto2);
		return "/perform/detail";
	}
	
	@RequestMapping(value = "/cmt_insert", method= RequestMethod.POST)
	public void comment(ReviewDTO dto, HttpSession session, PrintWriter out) {
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		int successCount = 0;
		successCount = service.replyInsert( dto );

		out.print(successCount);
		out.close();
		
	}
	
	@RequestMapping(value = "/prototype", method = RequestMethod.GET)
	public String test() {
		return "/prototype";
	}
	
	
	
	
}
