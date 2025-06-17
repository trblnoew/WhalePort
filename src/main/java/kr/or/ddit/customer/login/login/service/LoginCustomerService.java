package kr.or.ddit.customer.login.login.service;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.common.mypage.web.ServiceResult;
import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;

public interface LoginCustomerService {
	
	// 고객 로그인
	public LoginCustomerVO loginCheck(LoginCustomerVO customer);
	
	// 고객 아이디 찾기
	public String idForget(LoginCustomerVO loginCustomVO);
	
	// 고객 비밀번호 찾기
	public void updtTempPw(LoginCustomerVO loginCustomVO);
	
	// 고객 아이디 중복 체크
	public ServiceResult idCheck(String cusId);
	
	// 고객 회원가입
	public ServiceResult signup(HttpServletRequest req, LoginCustomerVO loginCustomVO);

}
