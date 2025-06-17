package kr.or.ddit.common.login.service.impl;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.login.mapper.LoginCommonMapper;
import kr.or.ddit.common.login.service.LoginCommonService;
import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.partner.common.account.vo.PartnerVO;

@Service
public class LoginCommonServiceImpl implements LoginCommonService {
	
	@Inject
	private LoginCommonMapper loginCommonMapper;
	
	// 아이디 찾기
	@Override
	public String idForget(LoginCommonVO loginCommonVO) {
		return loginCommonMapper.idForget(loginCommonVO);
	}

	// 암호화 된 임시비밀번호 DB 저장
	@Override
	public void updtTempPw(LoginCommonVO loginCommonVO) {
		loginCommonMapper.updtTempPw(loginCommonVO);
	}
	
	// 계정 잠금 여부
	@Override
	public void lockAccount(Map<String, String> param) {
		loginCommonMapper.lockAccount(param);
	}
	
	// 협력업체 아이디 찾기
	@Override
	public String partnerForgetId(PartnerVO partnerVO) {
		return loginCommonMapper.partnerForgetId(partnerVO);
	}
}
