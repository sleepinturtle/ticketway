package kr.co.ticketway.perform;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PerformService {

	@Autowired
	private PerformDAO dao;
	
	public List<PerformDTO> plist() {
		List<PerformDTO> list = null;
		list = dao.plist();
		return list;
	}
	
	public List<PerformDTO> mlist() {
		List<PerformDTO> list = null;
		list = dao.mlist();
		return list;
	}

}
