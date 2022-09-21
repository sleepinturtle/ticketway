package kr.co.ticketway.map.kakao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ticketway.perform.PerformDTO;

@Service
public class KakaoMapService {

	@Autowired
	private KakaoMapDAO dao;

	public PerformDTO selectTht() {
		PerformDTO dto= null;
		dto = dao.selectTht();
		return dto;
	}//selectAllMember

}//class
