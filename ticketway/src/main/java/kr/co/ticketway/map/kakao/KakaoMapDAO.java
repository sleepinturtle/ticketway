package kr.co.ticketway.map.kakao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ticketway.perform.PerformDTO;
import kr.co.ticketway.util.dto.MemberDTO;

@Repository
public class KakaoMapDAO {

	@Autowired
	private SqlSession sqlSession;

	public PerformDTO selectTht() {
		PerformDTO dto = null;
		dto = sqlSession.selectOne("KakaoMapMapper.selectTht");
		return dto;
	}//selectAllMember

}//class
