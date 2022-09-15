package kr.co.ticketway.card_info;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@RequestMapping( value = "/card_info" )
public class Card_infoController {

	private final static Logger logger = LoggerFactory.getLogger(Card_infoController.class);

	@Autowired
	private Card_infoService service;

	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( Card_infoDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete

	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( Card_infoDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.insert( dto );
		out.print(successCount);
		out.close();
	}//insert

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form( Model model, HttpSession session ) {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("YYYY");
		String yearString = dateFormat.format(date);
		model.addAttribute("yearString", yearString);

		List<Card_infoDTO> list = null;
		list = service.list( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		model.addAttribute("list", list);
		return "card_info/form";//jsp file name
	}//form

}//class


