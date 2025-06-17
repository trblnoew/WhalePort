package kr.or.ddit.util.security;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	private static final Logger log = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	
	// 모든 사용자 ID를 저장할 List
	private static List<String> activeUserIds = new CopyOnWriteArrayList<>();
	
	// 로그인 성공 후 처리할 처리자
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("CustomLoginSuccessHandler() 실행!!!");
		
		User user = (User) authentication.getPrincipal();
		log.info("username : " + user.getUsername());	// 인증된 회원 정보의 아이디
		log.info("password : " + user.getPassword());	// 인증된 회원 정보의 비밀번호
		
		// 인증 시 발생하는 에러 정보들이 session에 저장되어 있는데 해당 에러들을 지운다.(Optional)
		clearAuthenticationAttribute(request);
		
		// id 저장
		activeUserIds.add(user.getUsername());
		
		// 타겟정보가 존재한다면 타겟으로 이동하고 
		// 타겟 정보가 존재하지 않을때에는 '/' 로 이동
		// 타겟이 없을 때 : 보호할 자원으로 요청을 하지 않았을 때, 즉 단순히 로그인 페이지에서 접속 정보 입력 후 로그인 요청했을 때
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		String targetUrl = "/common/home";
		if(savedRequest != null) {
			targetUrl = savedRequest.getRedirectUrl();	// 보호할 자원으로 이동할 타겟 정보
		}
		
		log.info("targetUrl : " + targetUrl);
		
		response.sendRedirect(targetUrl);
	}

	private void clearAuthenticationAttribute(HttpServletRequest request) {
		
		// session 정보가 존재한다면 현재 session을 반환하고 존재하지 않으면 null을 반환합니다.
		HttpSession session = request.getSession(false);
		if(session == null) {
			return;
		}
		
		// SPRING_SECURITY_LAST_EXCEPTION 값
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	public static List<String> getActiveUserIds() {
        return activeUserIds;
    }
	 public static void removeUserId(String userId) {
	        activeUserIds.remove(userId);
	 }
}
