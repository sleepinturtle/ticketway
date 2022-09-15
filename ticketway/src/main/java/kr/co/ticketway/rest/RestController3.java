package kr.co.ticketway.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.ticketway.board.member.MemberBoardDTO;
import kr.co.ticketway.board.member.MemberBoardService;
import kr.co.ticketway.util.dto.MemberDTO;
import kr.co.ticketway.util.dto.SearchDTO;

@RestController
@RequestMapping( value = "/restmbrbrd" )
public class RestController3 {

	private final static Logger logger = LoggerFactory.getLogger(RestController3.class);

	@Autowired
	private MemberBoardService service;

	@RequestMapping( value = "/{inData}", method = RequestMethod.DELETE )
	public int delete( @PathVariable("inData") String board_no, HttpSession session ) {
		MemberBoardDTO dto = new MemberBoardDTO();
		dto.setBoard_no(board_no);
		dto.setMno(   ( (MemberDTO) session.getAttribute("login_info") ).getMno()   );
		int successCount = service.delete(dto);
		return successCount;
	}//delete

	@RequestMapping( value = "/{inData}", method = RequestMethod.GET )
	public MemberBoardDTO detail( @PathVariable("inData") String board_no ) {
		MemberBoardDTO dto = service.detail(board_no);
		return dto;
	}//detail

	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public List<MemberBoardDTO> list( SearchDTO dto ) {
		List<MemberBoardDTO> list = service.searchList(dto);
		return list;
	}//list

}//class













