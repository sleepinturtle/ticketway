package kr.co.ticketway.theater;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//import kr.co.ticketway.theater.AdminListMovie;
//import kr.co.ticketway.theater.Common;
////import com.goldspoon.koreabox.user.beans.AdminUserDTO;
//import kr.co.ticketway.theater.AdminUserDelete;
//import kr.co.ticketway.theater.AdminUserList;
//import kr.co.ticketway.theater.AdminUserRead;
//import kr.co.ticketway.theater.AdminUserUpdate;

import kr.co.ticketway.util.dto.MemberDTO;

@Controller
@RequestMapping("/theaterAdmin")
public class MemberAdminController {
	
	// MyBatis
	private SqlSession sqlSession;
	
	
}
