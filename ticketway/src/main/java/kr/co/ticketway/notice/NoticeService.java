package kr.co.ticketway.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.util.dto.SearchDTO;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO dao;

	public int update( NoticeDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update

	public int delete( NoticeDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public NoticeDTO detail( String news_no ) {
		dao.incrementViewCnt( news_no );

		NoticeDTO dto = null;
		dto = dao.detail( news_no );
		return dto;
	}//detail
	
	public NoticeDTO qnadetail( String qna_no ) {
		dao.incrementViewCnt( qna_no );

		NoticeDTO dto = null;
		dto = dao.qnadetail( qna_no );
		return dto;
	}//detail

	public int write( NoticeDTO dto ) {
		int successCount = 0;
		successCount = dao.write( dto );
		return successCount;
	}//write
	
	public int qnawrite( NoticeDTO dto ) {
		int successCount = 0;
		successCount = dao.qnawrite( dto );
		return successCount;
	}//write

	public List<NoticeDTO> searchList( SearchDTO dto ) {
		List<NoticeDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList
	
	public List<NoticeDTO> qnasearchList( SearchDTO dto ) {
		List<NoticeDTO> list = null;
		list = dao.qnasearchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

}//class






