package kr.co.ticketway.memo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<MemoDTO> myRoomListByMno(String loginMno) {
		List<MemoDTO> list = null;
		list = sqlSession.selectList("MemoMapper.myRoomListByMno", loginMno);
		return list;
	}//myRoomListByMno

	public int insert(MemoDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("MemoMapper.insert", dto);
		return successCount;
	}//insert

	public List<MemoDTO> chatListByNo(String room_no) {
		List<MemoDTO> list = null;
		list = sqlSession.selectList("MemoMapper.chatListByNo", room_no);
		return list;
	}//chatListByNo

	public MemoDTO roomInfoByNo(String room_no) {
		MemoDTO dto = null;
		dto = sqlSession.selectOne("MemoMapper.roomInfoByNo", room_no);
		return dto;
	}//roomInfoByNo

	public String getRoomNo(MemoDTO dto) {
		String roomNo = null;
		roomNo = sqlSession.selectOne("MemoMapper.getRoomNo", dto);
		return roomNo;
	}//getRoomNo

	public int createRoomNo(MemoDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("MemoMapper.createRoomNo", dto);
		return successCount;
	}//createRoomNo

}//class
