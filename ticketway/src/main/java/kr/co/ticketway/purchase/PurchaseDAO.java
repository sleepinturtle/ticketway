package kr.co.ticketway.purchase;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ticketway.util.dto.MemberDTO;

@Repository
public class PurchaseDAO {

	@Autowired
	private SqlSession sqlsession;
	
	public List<PurchaseDTO> page(PurchaseDTO dto) {
		List<PurchaseDTO> list = null;
		list = sqlsession.selectList("PurchaseMapper.page", dto);
		return list;
	}

	public int payment(PurchaseDTO dto) {
		int successCount = 0;
		successCount = sqlsession.insert("PurchaseMapper.payment", dto);
		return successCount;
	}

	public int cancel(PurchaseDTO dto) {
		int successCount = 0;
		successCount = sqlsession.delete("PurchaseMapper.cancel", dto);
		return successCount;
	}

	public int paycancel(PurchaseDTO dto) {
		int successCount = 0;
		successCount = sqlsession.delete("PurchaseMapper.paycancel", dto);
		return successCount;
	}


}
