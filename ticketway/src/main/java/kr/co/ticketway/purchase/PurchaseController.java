package kr.co.ticketway.purchase;

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
@RequestMapping(value = "/purchase")
public class PurchaseController {

	@Autowired
	private PurchaseService service;
	
	private final static Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	
	@RequestMapping(value = "/page", method = RequestMethod.POST)
	public String page(Model model, MemberDTO dto, HttpSession session) {
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		List<PurchaseDTO> list = null;
		System.out.println("컨1");
		list = service.page(dto);
		model.addAttribute("list", list);
		System.out.println("컨2");
		return "/purchase/page";
	}
}
