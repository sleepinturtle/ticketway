package kr.co.ticketway.delivery;

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
@RequestMapping( value = "/delivery" )
public class DeliveryController {

	private final static Logger logger = LoggerFactory.getLogger(DeliveryController.class);

	@Autowired
	private DeliveryService service;

	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( DeliveryDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete

	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( DeliveryDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.insert( dto );
		out.print(successCount);
		out.close();
	}//insert

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form( Model model, HttpSession session ) {
		List<DeliveryDTO> list = null;
		list = service.list( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		model.addAttribute("list", list);
		return "delivery/form";//jsp file name
	}//form

}//class

/*
drop table delivery_address;

create table delivery_address (
  addr_no int not null auto_increment,
  addr_name varchar(60) not null,
  mno int not null,
  recipient_name varchar(60) not null,
  tel varchar(15) not null,
  post_code varchar(10) not null,
  addr1 varchar(150) not null,
  addr2 varchar(150) not null,
  used_date datetime not null,
  del_yn int default '0',
  primary key (addr_no)
);
*/
