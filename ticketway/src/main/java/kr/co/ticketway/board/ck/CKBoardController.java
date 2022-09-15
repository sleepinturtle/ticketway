package kr.co.ticketway.board.ck;

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

import kr.co.ticketway.util.dto.BoardDTO;
import kr.co.ticketway.util.dto.MemberDTO;
import kr.co.ticketway.util.dto.SearchDTO;

@Controller
@RequestMapping( value = "/board/ck" )
public class CKBoardController {

	private final static Logger logger = LoggerFactory.getLogger(CKBoardController.class);

	@Autowired
	private CKBoardService service;

	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update( BoardDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );

		//ck file start =====
		String mid = ( (MemberDTO) session.getAttribute("login_info") ).getMid();

//		File folderForDel = new File("C:/upload/board/" + mid + "/");
//		File [] fileArr = folderForDel.listFiles();
//		if(fileArr != null) {
//			for(int i=0; i<fileArr.length; i++) {
//				fileArr[i].delete();
//			}//for
//		}//if

		if( dto.getContents().indexOf("src=\"") > 0) {

			String [] filePathArr = dto.getContents().split("src=\"");

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

			dto.setContents(
					dto.getContents().replaceAll("/upload/tmp/board/", "/upload/board/")
			);

		}//if
		//ck file end =====

		int successCount = 0;
		successCount = service.update( dto );
		out.print(successCount);
		out.close();
	}//update

	@RequestMapping( value = "/update_form", method = RequestMethod.GET )
	public String updateForm( String board_no, Model model ) throws IOException {
		BoardDTO dto = null;
		dto = service.detail(board_no);
		model.addAttribute("detail_dto", dto);

		//ck file start =====
		if( dto.getContents().indexOf("src=\"") > 0) {

			String [] filePathArr = dto.getContents().split("src=\"");

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

			dto.setContents(
					dto.getContents().replaceAll("/upload/board/", "/upload/tmp/board/")
			);

		}//if
		//ck file end =====

		return "board/ck/update_form";//jsp file name
	}//updateForm

	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( BoardDTO dto, HttpSession session, PrintWriter out ) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );

		//ck file start =====
		BoardDTO ckDTO = service.detail( dto.getBoard_no() );

		if( ckDTO.getContents().indexOf("src=\"") > 0) {

			String [] filePathArr = ckDTO.getContents().split("src=\"");

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

	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( String board_no, Model model ) {
		BoardDTO dto = null;
		dto = service.detail( board_no );
		model.addAttribute("detail_dto", dto);
		return "board/ck/detail";//jsp file name
	}//detail

	@RequestMapping( value = "/write", method = RequestMethod.POST )
	public void write( BoardDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );

		//ck file start =====
		if( dto.getContents().indexOf("src=\"") > 0) {

			String [] filePathArr = dto.getContents().split("src=\"");

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

			dto.setContents(
					dto.getContents().replaceAll("/upload/tmp/board/", "/upload/board/")
			);

		}//if
		//ck file end =====

		int successCount = 0;
		successCount = service.write( dto );
		out.print(successCount);
		out.close();
	}//write

	@RequestMapping( value = "/write_form", method = RequestMethod.GET )
	public String writeForm() {
		return "board/ck/write_form";//jsp file name
	}//writeForm

	@RequestMapping( value = "/list", method = RequestMethod.GET )
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

		List<BoardDTO> list = null;
		list = service.searchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "board/ck/list";//jsp file name
		
	}//list

}//class

/*

drop table ckboard;

create table ckboard (
  board_no int not null auto_increment,
  title varchar(150) not null,
  mno int not null,
  contents varchar(1500) not null,
  view_cnt int default '0',
  write_date datetime not null,
  primary key (board_no)
);

*/
