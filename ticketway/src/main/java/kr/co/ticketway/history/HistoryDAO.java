package kr.co.ticketway.history;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ticketway.util.dto.SearchDTO;

@Repository
public class HistoryDAO {

	@Autowired
	private SqlSession sqlSession;

	public int updateOrderStatus(HistoryDTO dto) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.insert("HistoryMapper.updateOrderStatus", dto);
		System.out.println(successCount);
		return successCount;
	}//updateOrderStatus

	public List<HistoryDTO> sellDetail(HistoryDTO dto) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("HistoryMapper.sellDetail", dto);
		return list;
	}//sellDetail

	public List<HistoryDTO> searchSellList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("HistoryMapper.searchSellList", dto);
		return list;
	}//searchSellList

	public int searchSellListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("HistoryMapper.searchSellListCount", dto);
		return totalCount;
	}//searchSellListCount

	public List<HistoryDTO> payDetail(HistoryDTO dto) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("HistoryMapper.payDetail", dto);
		return list;
	}//payDetail

	public List<HistoryDTO> searchOrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("HistoryMapper.searchOrderList", dto);
		return list;
	}//searchOrderList

	public int searchOrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("HistoryMapper.searchOrderListCount", dto);
		return totalCount;
	}//searchOrderListCount

}//class








