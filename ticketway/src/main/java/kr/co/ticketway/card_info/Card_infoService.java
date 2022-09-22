package kr.co.ticketway.card_info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Card_infoService {

	@Autowired
	private Card_infoDAO dao;

	public int delete( Card_infoDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public int insert( Card_infoDTO dto ) {
		int successCount = 0;
		successCount = dao.insert( dto );
		return successCount;
	}//write

	public List<Card_infoDTO> list(String mno) {
		List<Card_infoDTO> list = null;
		list = dao.list(mno);
		return list;
	}//list
	
	public List<Card_infoDTO> cardlist(String mno) {
		List<Card_infoDTO> cardlist = null;
		cardlist = dao.cardlist(mno);
		return cardlist;
	}//list

}//class
