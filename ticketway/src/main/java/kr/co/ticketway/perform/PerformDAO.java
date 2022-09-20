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

	

}
