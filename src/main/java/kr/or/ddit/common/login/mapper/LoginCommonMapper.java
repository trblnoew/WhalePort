package kr.or.ddit.common.login.mapper;

import java.util.Map;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.partner.common.account.vo.PartnerVO;


/**
 * @author 최동재
 * 직원, 협력업체의 로그인, 회원가입 Mapper Interface
 *
 */
public interface LoginCommonMapper {
	
	// 시큐리티 - 직원 로그인
	public LoginCommonVO readByUserId(String username);
	
	// 아이디 찾기
	public String idForget(LoginCommonVO loginCommonVO);

	// 암호화 된 임시비밀번호 DB 저장
	public void updtTempPw(LoginCommonVO loginCommonVO);
	
	// 계정 잠금 여부
	public void lockAccount(Map<String, String> param);
	
	// 협력업체 아이디 찾기
	public String partnerForgetId(PartnerVO partnerVO);
}
