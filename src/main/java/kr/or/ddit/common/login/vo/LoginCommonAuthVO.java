package kr.or.ddit.common.login.vo;

import lombok.Data;

@Data
public class LoginCommonAuthVO {
	private int empNo;			// 직원번호
	private int ptNo;			// 업체번호
	private String authName;	// 권한이름

}
