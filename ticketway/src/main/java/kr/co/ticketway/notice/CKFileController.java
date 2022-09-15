package kr.co.ticketway.notice;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.ticketway.util.dto.MemberDTO;

@Controller
public class CKFileController {

	private final static Logger logger = LoggerFactory.getLogger(CKFileController.class);

	@RequestMapping(value="/ckfileup", method=RequestMethod.POST)
	public void ckFileUp(MultipartRequest multiReq, String pkgnm
						, HttpSession session, PrintWriter print) throws IOException {

		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMDD");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

		String mid = ( (MemberDTO) session.getAttribute("login_info") ).getMid();
		File newFolder = new File("C:/upload/tmp/" + pkgnm + "/" + mid + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();
		File newFolder2 = new File("C:/upload/" + pkgnm + "/" + mid + "/");
		if( newFolder2.exists() == false ) newFolder2.mkdirs();

		MultipartFile file = multiReq.getFile("upload");

		String upFileName = todayNalja + "_" + todaySigan + "_" + file.getOriginalFilename();
		String upFilePath = "/upload/tmp/" + pkgnm + "/"  + mid + "/" + upFileName;

		InputStream is = file.getInputStream();
		FileOutputStream fos = new FileOutputStream( "C:" + upFilePath );
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();

		JSONObject json = new JSONObject();
		json.put("uploaded", 1);
		json.put("fileName", upFileName);
		json.put("url", upFilePath);

		print.print(json);
		print.flush();
		print.close();

	}//ckFileUp

}//class
