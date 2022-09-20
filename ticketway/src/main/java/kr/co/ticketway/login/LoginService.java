package kr.co.ticketway.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.util.dto.MemberDTO;

@Service
public class LoginService {

	@Autowired
	private LoginDAO dao;

	public MemberDTO login( MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = dao.login( dto );
		System.out.println(dtoFromDB.getMno());
		return dtoFromDB;
	}//login

}//class
