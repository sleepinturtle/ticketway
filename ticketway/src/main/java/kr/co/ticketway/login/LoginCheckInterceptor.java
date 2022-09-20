package kr.co.ticketway.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.ticketway.util.dto.MemberDTO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	private final static Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//logger.info("호출된 메소드가 실행되기 전에 실행되는 부분이다.");
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("login_info");
		if( dto == null || dto.getMno() == null || dto.getMno().equals("") ) {
			response.sendRedirect( request.getContextPath() + "/login_form" );
			return false;//계속 진행할 메소드 호출 중지.
		}else if(dto.getMgr_yn() =="1"){
			response.sendRedirect(request.getContextPath() + "/perform/plist");
			return false; //false를 리턴해야 원래 호출했던 메소드가 실행이 안됨.
		}
		return super.preHandle(request, response, handler);//계속 진행할 메소드 호출.
	}//preHandle

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//logger.info("호출된 메소드가 실행된 이후에 실행되는 부분이다.");
		super.postHandle(request, response, handler, modelAndView);
	}//postHandle

}//class
