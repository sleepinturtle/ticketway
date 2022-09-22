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
	
	public List<PurchaseDTO> page(MemberDTO dto) {
		List<PurchaseDTO> list = null;
		System.out.println("d1");
		list = sqlsession.selectList("PurchaseMapper.page", dto);
		System.out.println("d2");
		return list;
	}

}
