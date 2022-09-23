package kr.co.ticketway.ticketing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.perform.PerformDTO;

@Service
public class TicketingService {

	@Autowired
	private TicketingDAO dao;

	public List<PerformDTO> hallSelect( String play_no ) {
		List<PerformDTO> tht = null;
		tht = dao.hallSelect( play_no );
		return tht;
	}//gugunSelect

	public List<TicketingDTO> timeSelect( String tht_no) {
		List<TicketingDTO> list = null;
		list = dao.timeSelect( tht_no);
		return list;
	}//timeSelect
	
	public List<TicketingDTO> timeSelect1( TicketingDTO dto) {
		List<TicketingDTO> list = null;
		list = dao.timeSelect1( dto);
		return list;
	}//timeSelect

	public List<PerformDTO> PerformSelect() {
		List<PerformDTO> list = null;
		list = dao.PerformSelect();
		return list;
	}//sidoSelect

	
}//class
