package kr.co.ticketway.batch;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import kr.co.ticketway.order.OrderMainDTO;

//@Controller
public class BatchController1 {

	private final static Logger logger = LoggerFactory.getLogger(BatchController1.class);

	@Autowired
	private BatchService1 service;

//	@Scheduled( cron = "10 52 14 * * *" )
//	public void autoConfirm() {
//		//자동 구매 업데이트 대상을  select
//		List<OrderMainDTO> list = null;
//		list = service.autoConfirmList();
//		//업데이트 수행
//		int successCount = 0;
//		successCount = service.updateAutoConfirm( list );
//	}//autoConfirm

	//초 분 시 일 월 요일
	//@Scheduled( cron = "5 * * * * *" )
	public void testScheduler() {
		logger.info("======= testScheduler =======");
	}//testScheduler

}//class
