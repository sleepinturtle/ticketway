package kr.co.ticketway.theater;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		System.out.println("컨트롤러1");
		list = service.plist();
		System.out.println("컨트롤러2");
		model.addAttribute("list", list);
		return "admin/managementTheater";//jsp file name
		
	}//list
	
   
}