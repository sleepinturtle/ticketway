package kr.co.ticketway.card_info;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Card_infoDAO {

	@Autowired
	private SqlSession sqlSession;

	public int delete( Card_infoDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("Card_infoMapper.delete", dto);
		return successCount;
	}//delete

	public int insert( Card_infoDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("Card_infoMapper.insert", dto);
		return successCount;
	}//insert

	public List<Card_infoDTO> list(String mno) {
		List<Card_infoDTO> list = null;
		list = sqlSession.selectList("Card_infoMapper.list", mno);
		return list;
	}//list
	
	public List<Card_infoDTO> cardlist(String mno) {
		List<Card_infoDTO> cardlist = null;
		cardlist = sqlSession.selectList("Card_infoMapper.cardlist", mno);
		return cardlist;
	}//list

}//class
