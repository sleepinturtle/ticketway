package kr.co.ticketway.batch;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ticketway.order.OrderMainDTO;

@Repository
public class BatchDAO1 {

	@Autowired
	private SqlSession sqlSession;

	public int updateAutoConfirm( List<OrderMainDTO> list ) {
		int successCount = 0;
		successCount = sqlSession.update("Batch1Mapper.updateAutoConfirm", list);
		return successCount;
	}//updateAutoConfirm

	public List<OrderMainDTO> autoConfirmList() {

		List<OrderMainDTO> list = null;
		list = sqlSession.selectList("Batch1Mapper.autoConfirmList");
		return list;

	}//autoConfirmList

}//class












