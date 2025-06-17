package kr.or.ddit.util.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;


public class CustomLogoutSuccessHandler implements LogoutSuccessHandler{

	private static final Logger log = LoggerFactory.getLogger(CustomLogoutSuccessHandler.class);
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		if (authentication != null) {
            User user = (User) authentication.getPrincipal();
            CustomLoginSuccessHandler.removeUserId(user.getUsername()); // 사용자 ID 제거
        }
		
		log.info("CustomLogoutSuccessHandler:onLogoutSuccess() 실행!!!");
		response.sendRedirect("/common/login");
	}

}
