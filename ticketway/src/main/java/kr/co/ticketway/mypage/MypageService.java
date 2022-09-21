package kr.co.ticketway.mypage;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.util.dto.MemberDTO;
 
@Service
public class MypageService {

	@Autowired
	private MypageDAO dao;

	public int update( MemberDTO dto ) {
		int successCount = 0;

		if( dto.getTel1() != null && !dto.getTel1().equals("")
			&& dto.getTel2() != null && !dto.getTel2().equals("")
			&& dto.getTel3() != null && !dto.getTel3().equals("") ) {
			dto.setMtel( dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3() );
		}

		if( dto.getEmail1() != null && !dto.getEmail1().equals("")
			&& dto.getEmail2() != null && !dto.getEmail2().equals("") ) {
			dto.setEmail( dto.getEmail1() + "@" + dto.getEmail2() );
		}

		successCount = dao.update( dto );
		return successCount;
	}//update
	
	
	
	
	public MemberDTO detail( String mno ) {
		MemberDTO dto = dao.detail( mno );
		String[] result = dto.getEmail().split("@");
		String[] telresult = dto.getMtel().split("-");
		dto.setEmail1(result[0]);
		dto.setEmail2(result[1]);
		dto.setTel1(telresult[0]);
		dto.setTel2(telresult[1]);
		dto.setTel3(telresult[2]);
		return dto;
	}//detail
	
	public MemberDTO list( String mno ) {
		MemberDTO dto = dao.list( mno );
		return dto;
	}//detail

}//class






