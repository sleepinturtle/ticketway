package kr.co.ticketway.board.ck;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ticketway.util.dto.BoardDTO;
import kr.co.ticketway.util.dto.SearchDTO;

@Repository
public class CKBoardDAO {

	@Autowired
	private SqlSession sqlSession;

	public int update( BoardDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("CKBoardMapper.update", dto);
		return successCount;
	}//update

	public int delete( BoardDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("CKBoardMapper.delete", dto);
		return successCount;
	}//delete

	public void incrementViewCnt( String board_no ) {
		sqlSession.update("CKBoardMapper.incrementViewCnt", board_no);
	}//incrementViewCnt

	public BoardDTO detail( String board_no ) {
		BoardDTO dto = null;
		dto = sqlSession.selectOne("CKBoardMapper.detail", board_no);
		return dto;
	}//detail

	public int write( BoardDTO dto) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.insert("CKBoardMapper.write", dto);
		System.out.println(successCount);
		return successCount;
	}//write

	public List<BoardDTO> searchList( SearchDTO dto ) {
		List<BoardDTO> list = null;
		list = sqlSession.selectList("CKBoardMapper.selectList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("CKBoardMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount

}//class
