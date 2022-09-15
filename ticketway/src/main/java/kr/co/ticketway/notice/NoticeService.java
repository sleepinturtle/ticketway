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

	public NoticeDTO detail( String board_no ) {
		dao.incrementViewCnt( board_no );

		NoticeDTO dto = null;
		dto = dao.detail( board_no );
		return dto;
	}//detail

	public int write( NoticeDTO dto ) {
		int successCount = 0;
		successCount = dao.write( dto );
		return successCount;
	}//write

	public List<NoticeDTO> searchList( SearchDTO dto ) {
		List<NoticeDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

}//class






