package kr.co.ticketway.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ticketway.util.dto.SearchDTO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;

	public int favoriteCount(ProductFavoriteDTO dto) {
		int favoriteCount = 0;
		favoriteCount = sqlSession.selectOne("ProductMapper.favoriteCount", dto);
		return favoriteCount;
	}//favoriteCount

	public int favoriteDelete(ProductFavoriteDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("ProductMapper.favoriteDelete", dto);
		return successCount;
	}//favoriteDelete

	public int favoriteInsert(ProductFavoriteDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("ProductMapper.favoriteInsert", dto);
		return successCount;
	}//favoriteInsert

	public List<ProductReplyDTO> productReplyList( String prdt_no ) {
		List<ProductReplyDTO> list = null;
		list = sqlSession.selectList("ProductMapper.productReplyList", prdt_no);
		return list;
	}//productReplyList

	public int replyInsert( ProductReplyDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("ProductMapper.replyInsert", dto);
		return successCount;
	}//replyInsert

	public int fileDelete( ProductDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.fileDelete", dto);
		return successCount;
	}//fileDelete

	public int update( ProductDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.update", dto);
		return successCount;
	}//update

	public int delete( ProductDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.delete", dto);
		return successCount;
	}//delete

	public ProductDTO detail( String prdt_no ) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("ProductMapper.detail", prdt_no);
		return dto;
	}//detail

	public void incrementViewCnt( String prdt_no ) {
		sqlSession.update("ProductMapper.incrementViewCnt", prdt_no);
	}//incrementViewCnt

	public List<ProductDTO> searchList( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.selectList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("ProductMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount

	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("ProductMapper.insert", dto);
		return successCount;
	}//insert

}//class
