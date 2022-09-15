package kr.co.ticketway.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.util.dto.SearchDTO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO dao;

	public int favoriteCount(ProductFavoriteDTO dto) {
		int favoriteCount = 0;
		favoriteCount = dao.favoriteCount(dto);
		return favoriteCount;
	}//favoriteCount

	public int favoriteChange(ProductFavoriteDTO dto) {
		int successCount = 0;
		if(dto.getFavoriteCount().equals("0")) {
			successCount = dao.favoriteInsert(dto);
		} else {
			successCount = dao.favoriteDelete(dto);
		}
		return successCount;
	}//favoriteChange

	public List<ProductReplyDTO> productReplyList( String prdt_no ) {
		List<ProductReplyDTO> list = null;
		list = dao.productReplyList( prdt_no );
		return list;
	}//productReplyList

	public int replyInsert( ProductReplyDTO dto ) {
		int successCount = 0;
		successCount = dao.replyInsert( dto );
		return successCount;
	}//replyInsert

	public int fileDelete( ProductDTO dto ) {
		int successCount = 0;
		successCount = dao.fileDelete( dto );
		return successCount;
	}//fileDelete

	public int update( ProductDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update

	public int delete( ProductDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public ProductDTO detail( String prdt_no ) {
		dao.incrementViewCnt( prdt_no );

		ProductDTO dto = null;
		dto = dao.detail( prdt_no );
		return dto;
	}//detail

	public List<ProductDTO> searchList( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

	public int insert( ProductDTO dto ) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

}//class
