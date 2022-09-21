package kr.co.ticketway.perform;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PerformDAO {

	@Autowired
	private SqlSession session;	
	
	public List<PerformDTO> plist() {
		List<PerformDTO> list = null;
		list = session.selectList("PerformMapper.plist");
		return list;
	}
	
	public List<PerformDTO> mlist() {
		List<PerformDTO> list = null;
		list = session.selectList("PerformMapper.mlist");
		return list;
	}

	public PerformDTO detail(String play_no) {
		PerformDTO dto = session.selectOne("PerformMapper.detail", play_no);
		return dto;
	}

	public List<ReviewDTO> review(String play_no) {
		List<ReviewDTO> dto1 = session.selectList("PerformMapper.review", play_no);
		return dto1;
	}

	public int replyInsert(ReviewDTO dto) {
		int successCount = 0;
		successCount = session.insert("PerformMapper.reviewInsert", dto);
		System.out.println(successCount);
		return successCount;
	}

	public PerformDTO thtmap(String play_no) {
		PerformDTO dto = session.selectOne("KakaoMapMapper.selectTht", play_no);
		return dto;
	}

}
