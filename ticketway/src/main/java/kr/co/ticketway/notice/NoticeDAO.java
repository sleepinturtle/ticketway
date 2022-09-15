package kr.co.ticketway.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ticketway.util.dto.SearchDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	public int update( NoticeDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("NoticeMapper.update", dto);
		return successCount;
	}//update

	public int delete( NoticeDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("NoticeMapper.delete", dto);
		return successCount;
	}//delete

	public void incrementViewCnt( String board_no ) {
		sqlSession.update("NoticeMapper.incrementViewCnt", board_no);
	}//incrementViewCnt

	public NoticeDTO detail( String board_no ) {
		NoticeDTO dto = null;
		dto = sqlSession.selectOne("NoticeMapper.detail", board_no);
		return dto;
	}//detail

	public int write( NoticeDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("NoticeMapper.write", dto);
		return successCount;
	}//write

	public List<NoticeDTO> searchList( SearchDTO dto ) {
		List<NoticeDTO> list = null;
		list = sqlSession.selectList("NoticeMapper.selectList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("NoticeMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount

}//class








