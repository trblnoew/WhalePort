package kr.or.ddit.common.mypage.service;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.common.mypage.web.ServiceResult;

public interface CommMyPageService {
	
	// 직원 정보 수정
	public ServiceResult updateProfile(HttpServletRequest req, LoginCommonVO loginCommonVO);
	
	// 직원 정보 조회
	public LoginCommonVO selectProfile(LoginCommonVO loginCommonVO);
}
