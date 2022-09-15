package kr.co.ticketway.board.free;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ticketway.util.dto.SearchDTO;

@Controller
@RequestMapping( value = "/board/free" )
public class FreeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);

	@Autowired
	private FreeBoardService service;

	/*
	 * 핵심 메소드 목록 : finalList, update, updateForm, delete, detail, write, writeForm
	 */
	/*
	 * 연습 메소드 목록 : search1, search1Test, pagingList, list3, list2, list
	 */

	@RequestMapping( value = "/final_list", method = RequestMethod.GET )
	public String finalList( SearchDTO dto, String userWantPage, Model model ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";//if
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );
		if( totalCount > 10 ) {
			lastPageNum = ( totalCount / 10 ) + ( totalCount % 10 > 0 ? 1 : 0);
		}//if
		if( userWantPage.length() >= 2 ) {
			String frontNum = userWantPage.substring(0, userWantPage.length()-1);//125 -> 12
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;//121
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;//130
			String backNum = userWantPage.substring( userWantPage.length()-1, userWantPage.length() );//120
			if( backNum.equals("0") ) {
				startPageNum = startPageNum - 10;//111
				endPageNum = endPageNum - 10;//120
			}//if
		}//if
		if( endPageNum > lastPageNum ) endPageNum = lastPageNum;//if
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("userWantPage", userWantPage);
		model.addAttribute("lastPageNum", lastPageNum);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10 );
		List<FreeBoardDTO> list = null;
		list = service.searchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);

		return "/board/free/list5";//jsp file name
	}//finalList

	@RequestMapping( value = "/search1_test", method = RequestMethod.GET )
	public String search1Test( SearchDTO dto, Model model ) {
		List<FreeBoardDTO> list = null;
		list = service.search1Test( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/board/free/search1";//jsp file name
	}//search1Test

	@RequestMapping( value = "/search1", method = RequestMethod.GET )
	public String search1() {
		return "/board/free/search1";//jsp file name
	}//search1

	@RequestMapping( value = "/list4", method = RequestMethod.GET )
	public String pagingList( Model model, String userWantPage ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.totalListCount();
		if( totalCount > 10 ) {
			lastPageNum = ( totalCount / 10 ) + ( totalCount % 10 > 0 ? 1 : 0 );//lastPageNum는 최후의 페이지 번호
		}
		//페이징 일반 요소 끝

		if(userWantPage.length() >= 2) {//userWantPage가 10보다 큰 경우
			String frontNum = userWantPage.substring(0, userWantPage.length()-1);//25 -> 2
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;//21
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;//30

			String backNum = userWantPage.substring(userWantPage.length()-1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;
				endPageNum = endPageNum - 10;
			}
		}

		if(endPageNum > lastPageNum) {
			endPageNum = lastPageNum;
		}
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("userWantPage", userWantPage);
		model.addAttribute("lastPageNum", lastPageNum);
		//userWantPage가 10보다 작거나 같으면, 화면에 보이는 페이지는 1 2 3 4 5 6 7 8 9 10
		//userWantPage가 12인 경우, 화면에 보이는 페이지는 11 12 13 14 15 16 17 18 19 20
		//userWantPage가 27인 경우, 화면에 보이는 페이지는 21 22 23 24 25 26 27 28 29 30

		int limitNum = ( Integer.parseInt(userWantPage) - 1 ) * 10;
		List<FreeBoardDTO> list = null;
		list = service.pagingList(limitNum);
		model.addAttribute("list", list);

		return "/board/free/list4";//jsp file name
	}//pagingList

	@RequestMapping( value = "/list3", method = RequestMethod.GET )
	public String list3( Model model, String userWantPage ) {
		if ( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0;
		totalCount = service.totalListCount();
		int startPageNum = 1;
		int endPageNum = 1;
		if( totalCount > 10 ) {
			endPageNum = ( totalCount / 10 ) + ( totalCount % 10 > 0 ? 1 : 0 );
		}
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("userWantPage", userWantPage);

		return "/board/free/list3";//jsp file name
	}//list3

	@RequestMapping( value = "/list2", method = RequestMethod.GET )
	public String list2( Model model ) {//목록 아래쪽의 페이징 정보만 리스팅해보자.
		//한페이지에 10건을 보여줄 때 : 10 : 한 페이지에 보여지는 게시물의 총 건수
		//페이지 총건수 - 예) 128건
		//보여주는 페이지 번호 리스팅 건수 - (128 / 10) + (128 % 10 > 0 ? 1 : 0) == 13 페이지
		int totalCount = 0;
		totalCount = service.totalListCount();
		int startPageNum = 1;
		int endPageNum = 1;
		if(totalCount > 10) {
			endPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		return "/board/free/list2";//jsp file name
	}//list2

	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public String list( Model model ) {
		//dbms에서 게시판 전체를 select : FreeBoardService.list() -> FreeBoardDAO.list()
		//								-> freeboard-mapper.xml(namespace : FreeBoardMapper.list)
		List<FreeBoardDTO> list = null;
		list = service.list();
		model.addAttribute("list", list);
		return "/board/free/list";//list.jsp (view name) 호출
	}//list

	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update( FreeBoardDTO dto, PrintWriter out ) {
		//dbms에 게시글을 update : FreeBoardService.update(dto) -> FreeBoardDAO.update(dto)
		//						-> freeboard-mapper.xml(namespace : FreeBoardMapper.update)
		int successCount = 0;
		successCount = service.update(dto);
		out.print(successCount);
		out.close();
	}//update

	@RequestMapping( value = "/update_form", method = RequestMethod.GET )
	public String updateForm( String board_no, Model model ) {
		FreeBoardDTO dto = null;
		dto = service.detail(board_no);
		model.addAttribute("detail_dto", dto);
		return "/board/free/update_form";//jsp file name
	}//updateForm

	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( FreeBoardDTO dto, PrintWriter out) {
		//dbms에서 게시글 하나를 delete : FreeBoardService.delete(board_no) -> FreeBoardDAO.delete(board_no)
		//						-> freeboard-mapper.xml(namespace : FreeBoardMapper.delete)
		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete

	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( String board_no, Model model ) {
		//dbms에서 게시글 하나를 select : FreeBoardService.detail(board_no) -> FreeBoardDAO.detail(board_no)
		//						-> freeboard-mapper.xml(namespace : FreeBoardMapper.detail)
		FreeBoardDTO dto = service.detail(board_no);
		model.addAttribute("detail_dto", dto);
		return "/board/free/detail";//jsp file name
	}//detail

	@RequestMapping( value = "/write", method = RequestMethod.POST )
	public void write( FreeBoardDTO dto, PrintWriter out ) {
		//dbms에 게시글을 insert : FreeBoardService.write(dto) -> FreeBoardDAO.write(dto)
		//						-> freeboard-mapper.xml(namespace : FreeBoardMapper.write)
		int successCount = 0;
		successCount = service.write(dto);
		out.print(successCount);
		out.close();
	}//write

	@RequestMapping( value = "/write_form", method = RequestMethod.GET )
	public String writeForm() {
		return "/board/free/write_form";//jsp 파일 이름
	}//writeForm

}//class

/*
drop table memberboard;

create table freeboard (
  board_no int not null auto_increment,
  title varchar(150) not null,
  writer varchar(60) not null,
  pwd varchar(20) not null,
  contents varchar(1500) not null,
  write_date datetime not null,
  view_cnt int default '0',
  primary key (board_no)
);
*/
