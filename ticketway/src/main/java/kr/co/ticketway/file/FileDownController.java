package kr.co.ticketway.file;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( value = "/file" )
public class FileDownController {

	private final static Logger logger = LoggerFactory.getLogger(FileDownController.class);

	@RequestMapping( value = "/download", method = RequestMethod.GET )
	public void fileDownload( String path, HttpServletResponse response ) throws IOException {

		String name = path.substring( path.lastIndexOf("/") + 1 );
		name = new String( name.getBytes(), "ISO8859_1" );

		response.setHeader("Content-Disposition", "attachment;filename=" + name );
		//response : client로 전송되는 data 집합.
		//header : http를 통해 전송하는 data packet에 추가되는 정보.
		//setHeader : header에 정보를 추가하는 메소드.
		//ISO8859_1 : character set( data 조합 방법 )의 일종

		FileInputStream fis = new FileInputStream( "C:" + path );
		ServletOutputStream sos = response.getOutputStream();

		byte [] buffer = new byte[1024];//1024 byte 단위로 파일을 읽기 위한 선언.
		int readData = fis.read( buffer );
		while( readData != -1 ) {//-1 : EOF : end of file : 더 이상 읽을 데이터가 없다는 의미.
			sos.write( buffer );
			readData = fis.read( buffer );
		}//while

		sos.flush();//강제 data 밀어내기.
		fis.close();
		sos.close();

	}//fileDownload

}//class
