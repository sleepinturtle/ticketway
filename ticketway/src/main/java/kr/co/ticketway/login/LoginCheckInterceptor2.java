package kr.co.ticketway.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.ticketway.util.dto.MemberDTO;
//AOP지향으로 멤버 게시판을 만들기 위해 세션을 붙여주는 것이 메인
public class LoginCheckInterceptor2 extends HandlerInterceptorAdapter{
//핸들러 를 extends해서 밑에 두개를 override함
	
	private final static Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor2.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		logger.info("호출된 메소드가 실행되기 전에 실행되는 부분이다");
		HttpSession session = request.getSession();
		
		// login이 ok되면 login_info라는 이름으로 dto를 loginController에서 담음
		MemberDTO dto = (MemberDTO) session.getAttribute("login_info");
		
		if(dto == null || dto.getMno() == null || dto.getMno().equals("")) {
			response.sendRedirect(request.getContextPath() + "/login/login_form");// home 주소가 / 임 // 최초주소
			return false; //false를 리턴해야 원래 호출했던 메소드가 실행이 안됨.
		}else if(dto.getMgr_yn() !=1 && dto.getMgr_yn() ==0){
			response.sendRedirect(request.getContextPath() + "/mypage/mypage");
			return false; //false를 리턴해야 원래 호출했던 메소드가 실행이 안됨.
		}
		return super.preHandle(request, response, handler);//계속 진행할 메소드 호출
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		logger.info("호출된 메소드가 실행된 이후에 실행되는 부분이다.");
		super.postHandle(request, response, handler, modelAndView);
	}
	
	// 이후에 servlet.xml에 interceptor를 추가함. 그 역할이 특정시점에 특정한 메소드를 실행하라는 것을 xml에 명시해준 것임.
	// 게시판을 어디를 가든 위 메소드들이 실행이 됐음. /board/free/*를 줬기에
	// exclude-mapping 에 /board/free/final_list를 주면 final_list에 접속할땐 동작 안함.
}//class
