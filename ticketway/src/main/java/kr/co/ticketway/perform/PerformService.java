package kr.co.ticketway.perform;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PerformService {

	@Autowired
	private PerformDAO dao;
	
	public List<PerformDTO> plist() {
		List<PerformDTO> list = null;
		list = dao.plist();
		return list;
	}
	
	public List<PerformDTO> mlist() {
		List<PerformDTO> list = null;
		list = dao.mlist();
		return list;
	}

	public PerformDTO detail(String play_no) {
		PerformDTO dto = null;
		dto = dao.detail(play_no);
		return dto;
	}

	public List<ReviewDTO> review(String play_no) {
		List<ReviewDTO> dto1 = null;
		dto1 = dao.review(play_no);
		return dto1;
	}

	public int replyInsert(ReviewDTO dto) {
		int successCount = 0;
		successCount = dao.replyInsert( dto );
		return successCount;
	}
	
	public PerformDTO thtmap(String play_no) {
		PerformDTO dto = null;
		dto = dao.thtmap(play_no);
		return dto;
	}

	

}
