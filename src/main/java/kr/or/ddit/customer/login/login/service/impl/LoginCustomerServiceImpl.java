package kr.or.ddit.customer.login.login.service.impl;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.mypage.web.ServiceResult;
import kr.or.ddit.customer.login.login.mapper.LoginCustomerMapper;
import kr.or.ddit.customer.login.login.service.LoginCustomerService;
import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;

@Service
public class LoginCustomerServiceImpl implements LoginCustomerService{
	
	@Inject
	private LoginCustomerMapper loginCustomerMapper;
	
	@Inject
	private PasswordEncoder pe;
	
	// 고객 로그인
	@Override
	public LoginCustomerVO loginCheck(LoginCustomerVO customer) {
		return loginCustomerMapper.loginCheck(customer);
	}
	
	// 고객 아이디 찾기
	@Override
	public String idForget(LoginCustomerVO loginCustomVO) {
		return loginCustomerMapper.idForget(loginCustomVO);
	}
	
	// 고객 비밀번호 찾기
	@Override
	public void updtTempPw(LoginCustomerVO loginCustomVO) {
		loginCustomerMapper.updtTempPw(loginCustomVO);
	}
	
	// 고객 아이디 중복체크
	public ServiceResult idCheck(String cusId) {
		ServiceResult result = null;
		LoginCustomerVO customer = loginCustomerMapper.idCheck(cusId);
		
		if(customer != null) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		
		return result;
	}
	
	// 고객 회원가입
	@Override
	public ServiceResult signup(HttpServletRequest req, LoginCustomerVO loginCustomVO) {
		ServiceResult result = null;
		
		loginCustomVO.setCusPw(pe.encode(loginCustomVO.getCusDepw()));
		
		int status = loginCustomerMapper.signup(loginCustomVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
}
