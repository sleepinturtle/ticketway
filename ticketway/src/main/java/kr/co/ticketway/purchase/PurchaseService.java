package kr.co.ticketway.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.util.dto.MemberDTO;

@Service
public class PurchaseService {

	@Autowired
	private PurchaseDAO dao;
	
	public List<PurchaseDTO> page(MemberDTO dto) {
		List<PurchaseDTO> list = null;
		System.out.println("서1");
		list = dao.page(dto);
		System.out.println("서2");
		return list;
	}

}
