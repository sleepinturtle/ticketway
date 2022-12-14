package kr.co.ticketway.notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ticketway.product.ProductReplyDTO;
import kr.co.ticketway.util.dto.MemberDTO;
import kr.co.ticketway.util.dto.SearchDTO;

@Controller
@RequestMapping( value = "/notice" )
public class NoticeController {

	private final static Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService service;

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return "/notice/faq";
	}
	
	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public String noticelist( Model model, String userWantPage, SearchDTO dto ) {
			if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
			int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
			totalCount = service.noticesearchListCount( dto );

			if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
				lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
			}//if

			if(userWantPage.length() >= 2) { //userWantPage가 12인 경우 startPageNum는 11, endPageNum는 20.
				String frontNum = userWantPage.substring(0, userWantPage.length() - 1);//12 -> 1
				startPageNum = Integer.parseInt(frontNum) * 10 + 1;// 1 * 10 + 1 -> 11
				endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;// (1 + 1) * 10 -> 20
				//userWantPage가 10인 경우, startPageNum는 11, endPageNum는 20.
				String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
				if(backNum.equals("0")) {
					startPageNum = startPageNum - 10;// 11 - 10 -> 1
					endPageNum = endPageNum - 10;// 20 - 10 -> 10
				}//if
			}//if

			//endPageNum이 20이고, lastPageNum이 17이라면, endPageNum을 17로 수정해라
			if(endPageNum > lastPageNum) endPageNum = lastPageNum;

			model.addAttribute("startPageNum", startPageNum);
			model.addAttribute("endPageNum", endPageNum);
			model.addAttribute("lastPageNum", lastPageNum);
			model.addAttribute("userWantPage", userWantPage);

			dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
			// 1 -> (1-1)*10 -> 0
			// 2 -> (2-1)*10 -> 10
			// 3 -> (3-1)*10 -> 20

			List<NoticeDTO> list = null;
			list = service.noticesearchList( dto );
			model.addAttribute("list", list);
			model.addAttribute("search_dto", dto);
			return "notice/notice_list";
	}
	
	@RequestMapping(value = "/event_list", method = RequestMethod.GET)
	public String eventlist( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.eventsearchListCount( dto );

		if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if

		if(userWantPage.length() >= 2) { //userWantPage가 12인 경우 startPageNum는 11, endPageNum는 20.
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);//12 -> 1
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;// 1 * 10 + 1 -> 11
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;// (1 + 1) * 10 -> 20
			//userWantPage가 10인 경우, startPageNum는 11, endPageNum는 20.
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;// 11 - 10 -> 1
				endPageNum = endPageNum - 10;// 20 - 10 -> 10
			}//if
		}//if

		//endPageNum이 20이고, lastPageNum이 17이라면, endPageNum을 17로 수정해라
		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
		// 1 -> (1-1)*10 -> 0
		// 2 -> (2-1)*10 -> 10
		// 3 -> (3-1)*10 -> 20

		List<NoticeDTO> list = null;
		list = service.eventsearchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "notice/event_list";
	}
	
	
	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update( NoticeDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );
		
		
		//ck file start =====
				String mid = ( (MemberDTO) session.getAttribute("login_info") ).getMid();

//				File folderForDel = new File("C:/upload/board/" + mid + "/");
//				File [] fileArr = folderForDel.listFiles();
//				if(fileArr != null) {
//					for(int i=0; i<fileArr.length; i++) {
//						fileArr[i].delete();
//					}//for
//				}//if

				if( dto.getCnts().indexOf("src=\"") > 0) {

					String [] filePathArr = dto.getCnts().split("src=\"");

					for(int i=0; i<filePathArr.length; i++) {

						if(filePathArr[i].indexOf("/upload") >= 0) {

							String oldPath = filePathArr[i].substring(	filePathArr[i].indexOf("/upload")
																		, filePathArr[i].indexOf("\"") );
							String newPath = oldPath.replace("/upload/tmp/board/", "/upload/board/");

							FileInputStream fis = new FileInputStream("C:" + oldPath);
							FileOutputStream fos = new FileOutputStream("C:" + newPath);
							FileCopyUtils.copy(fis, fos);
							fis.close();
							fos.close();

							File tmpFile = new File("C:/" + oldPath);
							tmpFile.delete();

						}//if

					}//for

					File folderForDel = new File("C:/upload/tmp/board/" + mid + "/");
					File [] fileArr = folderForDel.listFiles();
					if(fileArr != null) {
						for(int i=0; i<fileArr.length; i++) {
							fileArr[i].delete();
						}//for
					}//if

					dto.setCnts(
							dto.getCnts().replaceAll("/upload/tmp/board/", "/upload/board/")
					);

				}//if
				//ck file end =====
		
		
		
		
		int successCount = 0;
		successCount = service.update( dto );
		out.print(successCount);
		out.close();
	}//update
	
	@RequestMapping( value = "/qnaupdate", method = RequestMethod.POST )
	public void qnaupdate( NoticeDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );
		dto.setMid( mDto.getMid() );
		
		
		//ck file start =====
				String mid = ( (MemberDTO) session.getAttribute("login_info") ).getMid();

//				File folderForDel = new File("C:/upload/board/" + mid + "/");
//				File [] fileArr = folderForDel.listFiles();
//				if(fileArr != null) {
//					for(int i=0; i<fileArr.length; i++) {
//						fileArr[i].delete();
//					}//for
//				}//if

				if( dto.getQna_cnts().indexOf("src=\"") > 0) {

					String [] filePathArr = dto.getQna_cnts().split("src=\"");

					for(int i=0; i<filePathArr.length; i++) {

						if(filePathArr[i].indexOf("/upload") >= 0) {

							String oldPath = filePathArr[i].substring(	filePathArr[i].indexOf("/upload")
																		, filePathArr[i].indexOf("\"") );
							String newPath = oldPath.replace("/upload/tmp/board/", "/upload/board/");

							FileInputStream fis = new FileInputStream("C:" + oldPath);
							FileOutputStream fos = new FileOutputStream("C:" + newPath);
							FileCopyUtils.copy(fis, fos);
							fis.close();
							fos.close();

							File tmpFile = new File("C:/" + oldPath);
							tmpFile.delete();

						}//if

					}//for

					File folderForDel = new File("C:/upload/tmp/board/" + mid + "/");
					File [] fileArr = folderForDel.listFiles();
					if(fileArr != null) {
						for(int i=0; i<fileArr.length; i++) {
							fileArr[i].delete();
						}//for
					}//if

					dto.setQna_cnts(
							dto.getQna_cnts().replaceAll("/upload/tmp/board/", "/upload/board/")
					);

				}//if
				//ck file end =====
		
		
		
		
		int successCount = 0;
		successCount = service.qnaupdate( dto );
		out.print(successCount);
		out.close();
	}//update

	@RequestMapping( value = "/update_form", method = RequestMethod.GET )
	public String updateForm( String news_no, Model model ) throws IOException {
		NoticeDTO dto = null;
		dto = service.detail(news_no);
		model.addAttribute("detail_dto", dto);
		
		
		//ck file start =====
				if( dto.getCnts().indexOf("src=\"") > 0) {

					String [] filePathArr = dto.getCnts().split("src=\"");

					for(int i=0; i<filePathArr.length; i++) {

						if(filePathArr[i].indexOf("/upload") >= 0) {

							String oldPath = filePathArr[i].substring(	filePathArr[i].indexOf("/upload")
																		, filePathArr[i].indexOf("\"") );
							String newPath = oldPath.replace("/upload/board/", "/upload/tmp/board/");

							FileInputStream fis = new FileInputStream("C:" + oldPath);
							FileOutputStream fos = new FileOutputStream("C:" + newPath);
							FileCopyUtils.copy(fis, fos);
							fis.close();
							fos.close();

						}//if

					}//for

					dto.setCnts(
							dto.getCnts().replaceAll("/upload/board/", "/upload/tmp/board/")
					);

				}//if
				//ck file end =====
		
		
		return "/notice/update_form";//jsp file name
	}//updateForm
	
	@RequestMapping( value = "/qnaupdate_form", method = RequestMethod.GET )
	public String qnaupdateForm( String qna_no, Model model ) throws IOException {
		NoticeDTO dto = null;
		dto = service.qnadetail(qna_no);
		model.addAttribute("detail_dto", dto);
		
		
		//ck file start =====
				if( dto.getQna_cnts().indexOf("src=\"") > 0) {

					String [] filePathArr = dto.getQna_cnts().split("src=\"");

					for(int i=0; i<filePathArr.length; i++) {

						if(filePathArr[i].indexOf("/upload") >= 0) {

							String oldPath = filePathArr[i].substring(	filePathArr[i].indexOf("/upload")
																		, filePathArr[i].indexOf("\"") );
							String newPath = oldPath.replace("/upload/board/", "/upload/tmp/board/");

							FileInputStream fis = new FileInputStream("C:" + oldPath);
							FileOutputStream fos = new FileOutputStream("C:" + newPath);
							FileCopyUtils.copy(fis, fos);
							fis.close();
							fos.close();

						}//if

					}//for

					dto.setQna_cnts(
							dto.getQna_cnts().replaceAll("/upload/board/", "/upload/tmp/board/")
					);

				}//if
				//ck file end =====
		
		
		return "/notice/qnaupdate_form";//jsp file name
	}//updateForm

	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( NoticeDTO dto, HttpSession session, PrintWriter out ) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );

		
		//ck file start =====
				NoticeDTO ckDTO = service.detail( dto.getNews_no() );

				if( ckDTO.getCnts().indexOf("src=\"") > 0) {

					String [] filePathArr = ckDTO.getCnts().split("src=\"");

					for(int i=0; i<filePathArr.length; i++) {

						if(filePathArr[i].indexOf("/upload") >= 0) {

							String delPath = filePathArr[i].substring(	filePathArr[i].indexOf("/upload")
									, filePathArr[i].indexOf("\"") );

							File delFile = new File("C:/"+delPath);
							delFile.delete();

						}//if

					}//for

				}//if
				//ck file end =====
		
		
		
		
		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
		
		
		
	}//delete
	
	@RequestMapping( value = "/qnadelete", method = RequestMethod.GET )
	public void qnadelete( NoticeDTO dto, HttpSession session, PrintWriter out ) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );

		
		//ck file start =====
				NoticeDTO ckDTO = service.qnadetail( dto.getQna_no() );

				if( ckDTO.getQna_cnts().indexOf("src=\"") > 0) {

					String [] filePathArr = ckDTO.getQna_cnts().split("src=\"");

					for(int i=0; i<filePathArr.length; i++) {

						if(filePathArr[i].indexOf("/upload") >= 0) {

							String delPath = filePathArr[i].substring(	filePathArr[i].indexOf("/upload")
									, filePathArr[i].indexOf("\"") );

							File delFile = new File("C:/"+delPath);
							delFile.delete();

						}//if

					}//for

				}//if
				//ck file end =====
		
		
		
		
		int successCount = 0;
		successCount = service.qnadelete( dto );
		out.print(successCount);
		out.close();
		
		
		
	}//delete

	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( String news_no, Model model ) {
		NoticeDTO dto = null;
		dto = service.detail( news_no );
		model.addAttribute("detail_dto", dto);
		return "/notice/notice_detail";//jsp file name
	}//detail
	
	@RequestMapping( value = "/qnadetail", method = RequestMethod.GET )
	public String qnadetail( String qna_no, Model model ) {
		NoticeDTO dto = null;
		List<NoticeDTO> list = null;
		dto = service.qnadetail( qna_no );
		list = service.qnaReplyList(qna_no);
		model.addAttribute("detail_dto", dto);
		model.addAttribute("replylist", list);
		return "/notice/qna_detail";//jsp file name
	}//detail

	@RequestMapping( value = "/write", method = RequestMethod.POST )
	public void write( NoticeDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );
		
		
		//ck file start =====
				if( dto.getCnts().indexOf("src=\"") > 0) {

					String [] filePathArr = dto.getCnts().split("src=\"");

					for(int i=0; i<filePathArr.length; i++) {

						if(filePathArr[i].indexOf("/upload") >= 0) {

							String oldPath = filePathArr[i].substring(	filePathArr[i].indexOf("/upload")
																		, filePathArr[i].indexOf("\"") );
							String newPath = oldPath.replace("/upload/tmp/board/", "/upload/board/");

							FileInputStream fis = new FileInputStream("C:" + oldPath);
							FileOutputStream fos = new FileOutputStream("C:" + newPath);
							FileCopyUtils.copy(fis, fos);
							fis.close();
							fos.close();

							File tmpFile = new File("C:/" + oldPath);
							tmpFile.delete();

						}//if

					}//for

					dto.setCnts(
							dto.getCnts().replaceAll("/upload/tmp/board/", "/upload/board/")
					);

				}//if
				//ck file end =====
		
		
		int successCount = 0;
		successCount = service.write( dto );
		out.print(successCount);
		out.close();
	}//write
	
	
	@RequestMapping( value = "/qna_write", method = RequestMethod.POST )
	public void qnawrite( NoticeDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );
		
		
		//ck file start =====
				if( dto.getCnts().indexOf("src=\"") > 0) {

					String [] filePathArr = dto.getCnts().split("src=\"");

					for(int i=0; i<filePathArr.length; i++) {

						if(filePathArr[i].indexOf("/upload") >= 0) {

							String oldPath = filePathArr[i].substring(	filePathArr[i].indexOf("/upload")
																		, filePathArr[i].indexOf("\"") );
							String newPath = oldPath.replace("/upload/tmp/board/", "/upload/board/");

							FileInputStream fis = new FileInputStream("C:" + oldPath);
							FileOutputStream fos = new FileOutputStream("C:" + newPath);
							FileCopyUtils.copy(fis, fos);
							fis.close();
							fos.close();

							File tmpFile = new File("C:/" + oldPath);
							tmpFile.delete();

						}//if

					}//for

					dto.setCnts(
							dto.getCnts().replaceAll("/upload/tmp/board/", "/upload/board/")
					);

				}//if
				//ck file end =====
		
		
		int successCount = 0;
		successCount = service.qnawrite( dto );
		out.print(successCount);
		out.close();
	}//write

	@RequestMapping( value = "/write_form", method = RequestMethod.GET )
	public String writeForm() {
		return "/notice/write_form";//jsp file name
	}//writeForm
	
	@RequestMapping( value = "/qnawrite_form", method = RequestMethod.GET )
	public String qnawriteForm() {
		return "/notice/qnawrite_form";//jsp file name
	}//writeForm

	@RequestMapping( value = "/notice_main", method = RequestMethod.GET )
	public String list( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );

		if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if

		if(userWantPage.length() >= 2) { //userWantPage가 12인 경우 startPageNum는 11, endPageNum는 20.
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);//12 -> 1
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;// 1 * 10 + 1 -> 11
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;// (1 + 1) * 10 -> 20
			//userWantPage가 10인 경우, startPageNum는 11, endPageNum는 20.
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;// 11 - 10 -> 1
				endPageNum = endPageNum - 10;// 20 - 10 -> 10
			}//if
		}//if

		//endPageNum이 20이고, lastPageNum이 17이라면, endPageNum을 17로 수정해라
		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
		// 1 -> (1-1)*10 -> 0
		// 2 -> (2-1)*10 -> 10
		// 3 -> (3-1)*10 -> 20

		List<NoticeDTO> list = null;
		list = service.searchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/notice/notice_main";//jsp file name
		
	}//list
	
	@RequestMapping( value = "/qna_main", method = RequestMethod.GET )
	public String qnalist( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.qnasearchListCount( dto );

		if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if

		if(userWantPage.length() >= 2) { //userWantPage가 12인 경우 startPageNum는 11, endPageNum는 20.
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);//12 -> 1
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;// 1 * 10 + 1 -> 11
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;// (1 + 1) * 10 -> 20
			//userWantPage가 10인 경우, startPageNum는 11, endPageNum는 20.
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;// 11 - 10 -> 1
				endPageNum = endPageNum - 10;// 20 - 10 -> 10
			}//if
		}//if

		//endPageNum이 20이고, lastPageNum이 17이라면, endPageNum을 17로 수정해라
		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
		// 1 -> (1-1)*10 -> 0
		// 2 -> (2-1)*10 -> 10
		// 3 -> (3-1)*10 -> 20

		List<NoticeDTO> list = null;
		list = service.qnasearchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/notice/qna_main";//jsp file name
		
	}//list

	@RequestMapping( value = "/reply_insert", method = RequestMethod.GET )
	public void replyInsert( NoticeDTO dto, HttpSession session, PrintWriter out ) {

		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		dto.setMid( ( (MemberDTO) session.getAttribute("login_info") ).getMid() );
		int successCount = 0;
		successCount = service.replyInsert( dto );

		out.print(successCount);
		out.close();

	}//replyInsert
}//class

/*

drop table memberboard;

create table memberboard (
  board_no int not null auto_increment,
  title varchar(150) not null,
  mno int not null,
  contents varchar(1500) not null,
  view_cnt int default '0',
  write_date datetime not null,
  primary key (board_no)
);

*/
