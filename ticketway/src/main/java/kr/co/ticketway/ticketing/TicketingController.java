package kr.co.ticketway.ticketing;

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

import com.google.gson.Gson;

import kr.co.ticketway.card_info.Card_infoDTO;
import kr.co.ticketway.card_info.Card_infoService;
import kr.co.ticketway.perform.PerformDTO;
import kr.co.ticketway.util.dto.MemberDTO;


@Controller
@RequestMapping( value = "/ticketing" )
public class TicketingController {

	private static final Logger logger = LoggerFactory.getLogger(TicketingController.class);

	@Autowired
	private Card_infoService creditCardService;
	
	@Autowired
	private TicketingService service;
	
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public String list(Model model, HttpSession session, MemberDTO dto) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );
		List<PerformDTO> list = null;
		List<Card_infoDTO> cardlist = null;
		list = service.PerformSelect();
		cardlist = creditCardService.cardlist(dto.getMno());
		model.addAttribute("list", list);
		model.addAttribute("cardlist",cardlist);
		return"ticketing/list";
		
	}//home
	
	@RequestMapping(value ="/ticket", method = RequestMethod.GET)
	public void ticket(Model model, PrintWriter out, TicketingDTO dto, HttpSession session) {
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		int successCount = 0;
		successCount = service.ticket( dto );
		out.print(successCount);
		out.close();
	}//home
	
	
	
	
	@RequestMapping( value = "/hall", method = RequestMethod.GET )
	public void hallSelect( String play_no, PrintWriter out ) {
		List<PerformDTO> tht = null;
		tht = service.hallSelect( play_no );
		
		out.print( new Gson().toJson( tht ) );
		out.close();
		
	}//daySelect
	
	
	
	@RequestMapping( value = "/date", method = RequestMethod.GET )
	public void timeSelect( String tht_no, PrintWriter out ) {
		List<TicketingDTO> date = null;
//		System.out.println(tht_no);
		date = service.timeSelect( tht_no);
		out.print( new Gson().toJson( date ) );
		out.close();
		
	}//timeSelect
	
	@RequestMapping( value = "/time", method = RequestMethod.GET )
	public void timeSelect1( TicketingDTO dto, PrintWriter out ) {
		List<TicketingDTO> time = null;
		System.out.println(dto.getPlay_no());
		time = service.timeSelect1( dto); 
		out.print( new Gson().toJson( time ) );
		out.close();
		
	}//timeSelect

	
	
	

}//class