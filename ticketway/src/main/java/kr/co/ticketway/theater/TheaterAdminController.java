package kr.co.ticketway.theater;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ticketway.theater.TheaterAdminDTO;
//import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;
//import com.goldspoon.koreabox.movie.beans.MovieAdminDTO;
import kr.co.ticketway.theater.Common;
//import com.goldspoon.koreabox.movie.service.AdminDeleteMovie;
//import com.goldspoon.koreabox.movie.service.AdminListMovie;
//import com.goldspoon.koreabox.movie.service.AdminReadMovie;
import kr.co.ticketway.theater.TheaterService;
//import com.goldspoon.koreabox.movie.service.AdminUpdateMovie;
//import com.goldspoon.koreabox.movie.service.AdminWriteMovie;
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.oreilly.servlet.multipart.FileRenamePolicy;

@Controller
@RequestMapping("theaterAdmin")
public class TheaterAdminController {

   private TheaterService service;

   @Autowired
   private HttpSession session;

   // MyBatis
   private SqlSession sqlSession;

   @Autowired
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
      Common.sqlSession = sqlSession;
   }

   @Autowired
   ServletContext servletContext;

   @RequestMapping(value = "/managementTheater", method = RequestMethod.GET)
   public String managementTheater(Model model) {
	   return"admin/managementTheater";
   }
   
   @RequestMapping(value = "/plist", method = RequestMethod.GET)
	public String plist(Model model ) {
		List<TheaterAdminDTO> list = null;
		list = service.plist();
		model.addAttribute("list", list);
		return "admin/managementTheater";//jsp file name
		
	}//list
	
   
}