package kr.co.ticketway.theater;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class TheaterAdminDAO {

	@Autowired
	private SqlSession session;	
	public List<TheaterAdminDTO> plist() {
		List<TheaterAdminDTO> list = null;
		list = session.selectList("TheaterMapper.plist");
		return list;
	}

}
