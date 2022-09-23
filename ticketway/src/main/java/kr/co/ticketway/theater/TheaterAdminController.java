package kr.co.ticketway.theater;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ticketway.board.member.MemberBoardDTO;
import kr.co.ticketway.util.dto.MemberDTO;

//import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;
//import com.goldspoon.koreabox.movie.beans.MovieAdminDTO;
//import com.goldspoon.koreabox.movie.service.AdminDeleteMovie;
//import com.goldspoon.koreabox.movie.service.AdminListMovie;
//import com.goldspoon.koreabox.movie.service.AdminReadMovie;
//import com.goldspoon.koreabox.movie.service.AdminUpdateMovie;
//import com.goldspoon.koreabox.movie.service.AdminWriteMovie;
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.oreilly.servlet.multipart.FileRenamePolicy;

@Controller
@RequestMapping("theaterAdmin")
public class TheaterAdminController {

	@Autowired
   private TheaterService service;

   
   @RequestMapping(value = "/managementTheater", method = RequestMethod.GET)
	public String plist(Model model ) {
		List<TheaterAdminDTO> list = null;
		list = service.plist();
		model.addAttribute("list", list);
		return "admin/managementTheater";//jsp file name
		
	}//list
   
   @RequestMapping(value = "/managerMemberList", method = RequestMethod.GET)
   public String managerMemberList(Model model ) {
		List<MemberDTO> list = null;
		list = service.memberList();
		model.addAttribute("list", list);
		return "admin/managerMemberList";//jsp file name
	}//list
   
   @RequestMapping(value = "/managementSchedule", method = RequestMethod.GET)
   public String managerSchedule(Model model ) {
//		List<MemberDTO> list = null;
//		list = service.memberList();
//		model.addAttribute("list", list);
		return "admin/managementSchedule";//jsp file name
	}//list
   
   @RequestMapping( value = "/tupdate", method = RequestMethod.POST )
	public void tupdate( TheaterAdminDTO dto, PrintWriter out ) {

		int successCount = 0;
		successCount = service.updateTheater( dto );
		out.print(successCount);
		out.close();
	}//tupdate

   @RequestMapping( value = "/update_theater", method = RequestMethod.GET )
   public String updateTheater( String play_no, Model model ) {
	   TheaterAdminDTO dto = null;
//		dto = service.detail(board_no);
	   model.addAttribute("update", dto);
	   return "admin/updateTheater";//jsp file name
   }//updateTheater

   @RequestMapping( value = "/twrite", method = RequestMethod.POST )
   public void twrite( TheaterAdminDTO dto, HttpSession session, PrintWriter out ) {
	   TheaterAdminDTO mDto = (TheaterAdminDTO) session.getAttribute("login_info");
	   dto.setPlay_no( mDto.getPlay_no() );
	   
	   int successCount = 0;
	   successCount = service.writeTheater( dto );
	   out.print(successCount);
	   out.close();
   }//twrite
   
   @RequestMapping( value = "/write_theater", method = RequestMethod.GET )
   public String writeTheater() {
	   return "admin/writeTheater";//jsp file name
   }//writeTheater

	@RequestMapping( value = "/tdelete", method = RequestMethod.GET )
	public void tdelete( TheaterAdminDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = service.deleteTheater( dto );
		out.print(successCount);
		out.close();
	}//tdelete
	
	@RequestMapping( value = "/update_user", method = RequestMethod.GET )
	   public String updateUser(  ) {
		   
		   return "admin/updateUserData";//jsp file name
	   }//updateTheater
}