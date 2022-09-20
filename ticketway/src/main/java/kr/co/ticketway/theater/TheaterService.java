package kr.co.ticketway.theater;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ticketway.theater.TheaterAdminDAO;
import kr.co.ticketway.theater.TheaterAdminDTO;

@Service
public class TheaterService {

	@Autowired
	private TheaterAdminDAO dao;
	
	public List<TheaterAdminDTO> plist() {
		List<TheaterAdminDTO> list = null;
		System.out.println("서비스1");
		list = dao.plist();
		System.out.println("서비스2");
		return list;
	}
	
}