package kr.co.ticketway.purchase;

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
@RequestMapping(value = "/purchase")
public class PurchaseController {

	@Autowired
	private PurchaseService service;
	
	private final static Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String page(Model model, PurchaseDTO dto, HttpSession session) {
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		List<PurchaseDTO> list = null;
		list = service.page(dto);
		model.addAttribute("list", list);
		return "/purchase/page";
	}
	
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public void payment(Model model,PurchaseDTO dto, HttpSession session, PrintWriter out) {
		dto.setMno(( (MemberDTO) session.getAttribute("login_info") ).getMno());
		int successCount = 0;
		successCount = service.payment( dto );
		out.print(successCount);
		out.close();

	}
	
	
	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public void cancel(PurchaseDTO dto) {
		int successCount = 0;
		successCount = service.cancel(dto);
	}
	
	@RequestMapping(value = "/pay_cancel", method = RequestMethod.GET)
	public void paycancel(PurchaseDTO dto) {
		int successCount = 0;
		successCount = service.paycancel(dto);
	}
}
