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
	
   @RequestMapping( value = "/write", method = RequestMethod.POST )
	public void write( MemberBoardDTO dto, HttpSession session, PrintWriter out ) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );

		int successCount = 0;
//		successCount = service.write( dto );
		out.print(successCount);
		out.close();
	}//write

	@RequestMapping( value = "/write_form", method = RequestMethod.GET )
	public String writeForm() {
		return "admin/writeTheater";//jsp file name
	}//writeForm
   
   @RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update( MemberBoardDTO dto, HttpSession session, PrintWriter out ) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );

		int successCount = 0;
//		successCount = service.update( dto );
		out.print(successCount);
		out.close();
	}//update

	@RequestMapping( value = "/update_form", method = RequestMethod.GET )
	public String updateForm( String board_no, Model model ) {
		MemberBoardDTO dto = null;
//		dto = service.detail(board_no);
		model.addAttribute("detail_dto", dto);
		return "admin/updateTheater";//jsp file name
	}//updateForm
}