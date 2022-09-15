package kr.co.ticketway.history;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.util.dto.SearchDTO;

@Service
public class HistoryService {

	@Autowired
	private HistoryDAO dao;

	public int updateOrderStatus(HistoryDTO dto) {
		int successCount = 0;
		successCount = dao.updateOrderStatus( dto );
		return successCount;
	}//updateOrderStatus

	public List<HistoryDTO> sellDetail(HistoryDTO dto) {
		List<HistoryDTO> list = null;
		list = dao.sellDetail( dto );
		return list;
	}//sellDetail

	public List<HistoryDTO> searchSellList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = dao.searchSellList( dto );
		return list;
	}//searchSellList

	public int searchSellListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchSellListCount( dto );
		return totalCount;
	}//searchSellListCount

	public List<HistoryDTO> payDetail(HistoryDTO dto) {
		List<HistoryDTO> list = null;
		list = dao.payDetail( dto );
		return list;
	}//payDetail

	public List<HistoryDTO> searchOrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = dao.searchOrderList( dto );
		return list;
	}//searchOrderList

	public int searchOrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchOrderListCount( dto );
		return totalCount;
	}//searchOrderListCount

}//class






