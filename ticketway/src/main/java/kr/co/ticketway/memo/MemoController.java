package kr.co.ticketway.memo;


import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ticketway.util.dto.MemberDTO;

@Controller
@RequestMapping(value = "/memo")
public class MemoController {

	private static final Logger logger = LoggerFactory.getLogger(MemoController.class);

	@Autowired
	private MemoService service;

	@RequestMapping( value = "/chat_list", method = RequestMethod.GET )
	public String chatList( String room_no, HttpSession session, Model model ) {

		List<MemoDTO> list = null;
		list = service.chatListByNo(room_no);
		model.addAttribute("chat_list", list);

		return "memo/chat_list";//jsp file name
	}//myRoomList

	@RequestMapping( value = "/my_room_list", method = RequestMethod.GET )
	public String myRoomList( HttpSession session, Model model ) {

		String loginMno = ( (MemberDTO) session.getAttribute("login_info") ).getMno();

		List<MemoDTO> list = null;
		list = service.myRoomListByMno(loginMno);
		model.addAttribute("room_list", list);

		return "memo/room_list";//jsp file name
	}//myRoomList

	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( MemoDTO dto, HttpSession session, PrintWriter out ) {

		String loginMno = ( (MemberDTO) session.getAttribute("login_info") ).getMno();
		if(loginMno.equals( dto.getMno_read() )) {
			dto.setMno_read( dto.getMno_ins() );
		}
		dto.setMno_ins( loginMno );

		int successCount = 0;
		successCount = service.insert( dto );

		out.print(successCount);
		out.close();

	}//insert

	@RequestMapping( value = "/open_room", method = RequestMethod.GET )
	public String openRoom( String room_no, Model model ) {
		MemoDTO dto = null;
		dto = service.roomInfoByNo(room_no);
		model.addAttribute("room_dto", dto);
		return "memo/room_form";//jsp file name
	}//openRoom

	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public void start(MemoDTO dto, HttpSession session, PrintWriter out) {

		dto.setMno_from( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		String roomNo = null;
		roomNo = service.getRoomNo(dto);

		out.print(roomNo);
		out.close();

	}//start

}//class

/*
drop TABLE memo_room;
CREATE TABLE memo_room (
  room_no int NOT NULL AUTO_INCREMENT,
  mno_from int NOT NULL,
  mno_to int NOT NULL,
  del_yn int DEFAULT '0',
  del_date datetime DEFAULT NULL,
  PRIMARY KEY (room_no)
);

drop TABLE memo_chat;
CREATE TABLE memo_chat (
  chat_no int NOT NULL AUTO_INCREMENT,
  room_no int NOT NULL,
  mno_ins int NOT NULL,
  mno_read int NOT NULL,
  chat varchar(1500) NOT NULL,
  chat_date datetime NOT NULL,
  read_yn int DEFAULT '1',
  PRIMARY KEY (chat_no)
);
*/