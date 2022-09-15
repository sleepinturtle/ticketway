package kr.co.ticketway.board.ck;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.util.dto.BoardDTO;
import kr.co.ticketway.util.dto.MemberDTO;
import kr.co.ticketway.util.dto.SearchDTO;

@Service
public class CKBoardService {

	@Autowired
	private CKBoardDAO dao;

	public int update( BoardDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update

	public int delete( BoardDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public BoardDTO detail( String board_no ) {
		dao.incrementViewCnt( board_no );

		BoardDTO dto = null;
		dto = dao.detail( board_no );
		return dto;
	}//detail

	public int write( BoardDTO dto ) {
		int successCount = 0;
		successCount = dao.write( dto );
		return successCount;
	}//write

	public List<BoardDTO> searchList( SearchDTO dto ) {
		List<BoardDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

}//class
