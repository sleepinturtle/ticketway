package kr.co.ticketway.theater;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ticketway.board.member.MemberBoardDTO;
import kr.co.ticketway.theater.TheaterAdminDAO;
import kr.co.ticketway.theater.TheaterAdminDTO;
import kr.co.ticketway.util.dto.MemberDTO;

@Service
public class TheaterService {

	@Autowired
	private TheaterAdminDAO dao;
	
	public List<TheaterAdminDTO> plist() {
		List<TheaterAdminDTO> list = null;
		list = dao.plist();
		return list;
	}
	
	public List<MemberDTO> memberList() {
		List<MemberDTO> list = null;
		list = dao.memberList();
		return list;
	}
	
	public List<TheaterAdminDTO> ticketing() {
		List<TheaterAdminDTO> list = null;
		list = dao.ticketing();
		return list;
	}

	public int updateTheater( TheaterAdminDTO dto ) {
		int successCount = 0;
		successCount = dao.updateTheater( dto );
		return successCount;
	}//update
	
	public int writeTheater( TheaterAdminDTO dto ) {
		int successCount = 0;
		successCount = dao.writeTheater( dto );
		return successCount;
	}//write

	public int deleteTheater( TheaterAdminDTO dto ) {
		int successCount = 0;
		successCount = dao.deleteTheater( dto );
		return successCount;
	}//delete
	
}