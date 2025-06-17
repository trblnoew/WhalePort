package kr.or.ddit.common.mypage.mapper;

import kr.or.ddit.common.login.vo.LoginCommonVO;

public interface CommMyPageMapper {
	
	// 직원 정보 조회
	public LoginCommonVO selectProfile(LoginCommonVO loginCommonVO);
	
	// 직원 정보 수정
	public int updateProfile(LoginCommonVO loginCommonVO);

}
