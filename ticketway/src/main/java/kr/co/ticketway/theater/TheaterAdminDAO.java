package kr.co.ticketway.theater;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ticketway.board.member.MemberBoardDTO;
import kr.co.ticketway.util.dto.MemberDTO;


@Repository
public class TheaterAdminDAO {

	@Autowired
	private SqlSession session;	
	
	public List<TheaterAdminDTO> plist() {
		List<TheaterAdminDTO> list = null;
		list = session.selectList("TheaterMapper.plist");
		return list;
	}
	
	public List<MemberDTO> memberList() {
		List<MemberDTO> list = null;
		list = session.selectList("TheaterMapper.memberList");
		return list;
	}
	
	public int update( TheaterAdminDTO dto ) {
		int successCount = 0;
		successCount = session.update("TheaterMapper.update", dto);
		return successCount;
	}//update

	public List<TheaterAdminDTO> ticketing() {
		List<TheaterAdminDTO> list = null;
		list = session.selectList("TheaterMapper.ticketing");
		return list;
	}
	
}
