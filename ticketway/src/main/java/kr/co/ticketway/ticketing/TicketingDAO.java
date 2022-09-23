package kr.co.ticketway.ticketing;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ticketway.perform.PerformDTO;

@Repository
public class TicketingDAO {

	@Autowired
	private SqlSession sqlSession;


	public List<PerformDTO> hallSelect( String  play_no) {
		List<PerformDTO> tht = null;
		tht = sqlSession.selectList("TicketingMapper.hallSelect", play_no);
		return tht;
	}//gugunSelect

	public List<TicketingDTO> timeSelect( String  tht_no) {
		List<TicketingDTO> list = null;
		list = sqlSession.selectList("TicketingMapper.timeSelect", tht_no);
		return list;
	}//dongSelect
	
	public List<TicketingDTO> timeSelect1( TicketingDTO dto) {
		List<TicketingDTO> list = null;
		list = sqlSession.selectList("TicketingMapper.timeSelect1", dto);
		return list;
	}//dongSelect


	public List<PerformDTO> PerformSelect() {
		List<PerformDTO> list = null;
		list = sqlSession.selectList("TicketingMapper.PerformSelect");
		return list;
	}//sidoSelect

}//class
