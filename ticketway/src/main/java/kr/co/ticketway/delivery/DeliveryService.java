package kr.co.ticketway.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeliveryService {

	@Autowired
	private DeliveryDAO dao;

	public int delete( DeliveryDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public int insert( DeliveryDTO dto ) {
		int successCount = 0;
		successCount = dao.insert( dto );
		return successCount;
	}//write

	public List<DeliveryDTO> list( String mno ) {
		List<DeliveryDTO> list = null;
		list = dao.list( mno );
		return list;
	}//list

}//class
