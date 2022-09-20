package kr.co.ticketway.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("theaterAdmin")
public class MemberAdminController {

	@Autowired
	private TheaterService service;

   @RequestMapping(value = "/managerMemberList", method = RequestMethod.GET)
   public String plist(Model model ) {
		List<TheaterAdminDTO> list = null;
		list = service.plist();
		model.addAttribute("list", list);
		return "admin/managerMemberList";//jsp file name
	}//list
}