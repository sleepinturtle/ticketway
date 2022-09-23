package kr.co.ticketway.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.util.dto.MemberDTO;

@Service
public class PurchaseService {

	@Autowired
	private PurchaseDAO dao;
	
	public List<PurchaseDTO> page(PurchaseDTO dto) {
		List<PurchaseDTO> list = null;
		list = dao.page(dto);
		return list;
	}

	public int payment(PurchaseDTO dto) {
		int successCount = 0;
		successCount = dao.payment(dto);
		return successCount;
	}

	public int cancel(PurchaseDTO dto) {
		int successCount = 0;
		successCount = dao.cancel(dto);
		return successCount;
	}

	public int paycancel(PurchaseDTO dto) {
		int successCount = 0;
		successCount = dao.paycancel(dto);
		if(successCount < 1) {
			return successCount;
		}
		
		successCount = dao.cancel(dto);
		if(successCount < 1) {
			return successCount;
		}
		return successCount;
	}


}
