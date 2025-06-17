package kr.or.ddit.customer.login.login.mapper;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;

public interface LoginCustomerMapper {
	
	// 고객 로그인
	public LoginCustomerVO loginCheck(LoginCustomerVO customer);
	
	// 고객 아이디 찾기
	public String idForget(LoginCustomerVO loginCustomVO);
	
	// 고객 비밀번호 찾기
	public void updtTempPw(LoginCustomerVO loginCustomVO);
	
	// 고객 아이디 중복체크
	public LoginCustomerVO idCheck(String cusId);
	
	// 고객 회원가입
	public int signup(LoginCustomerVO loginCustomVO);
}
