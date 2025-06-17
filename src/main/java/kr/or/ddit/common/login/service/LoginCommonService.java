package kr.or.ddit.common.login.service;


import java.util.Map;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.partner.common.account.vo.PartnerVO;


public interface LoginCommonService {
	
	// 아이디 찾기
	public String idForget(LoginCommonVO loginCommonVO);
	
	// 임시비밀번호 DB 저장
	public void updtTempPw(LoginCommonVO loginCommonVO);
	
	// 계정 잠금 여부
	public void lockAccount(Map<String, String> param);
	
	// 협력업체 아이디 찾기
	public String partnerForgetId(PartnerVO partnerVO);
}
