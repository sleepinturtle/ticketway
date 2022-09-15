package kr.co.ticketway.batch;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

/*
 * @Configuration : 스프링의 설정 파일을 만들 때 사용.
 *  - 스프링 프로젝트를 톰캣에서 읽어들일  때(부팅할 때, 메모리 로딩할 때) 함께 메모리 로딩된다.
 * 
 * @EnableScheduling : batch 작업 시간표 만들기
 * 
 * @Configuration + @EnableScheduling : batch 작업 시간표 설정 파일
 *  - 이 파일에 등록한 클래스가 batch 작업으로 실행된다.
 * 
 * @Configuration + @Bean : 자동으로 실행하며, 스프링 프레임워크에 객체를 등록한다.
 */

@Configuration
@EnableScheduling
public class BatchConfig1 {

	@Bean
	public BatchController1 createBatchController1() {
		return new BatchController1();
	}//createBatchController1

}//class













