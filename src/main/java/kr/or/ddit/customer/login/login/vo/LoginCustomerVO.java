package kr.or.ddit.customer.login.login.vo;

import lombok.Data;

@Data
public class LoginCustomerVO {
	private int cusNo; 				// 고객 번호
	private String cusId; 			// 고객 아이디
	private String cusPw; 			// 고객 비밀번호
	private String cusDepw; 		// 고객 원본 비밀번호
	private String cusEmail; 		// 고객 이메일
	private String cusTel; 			// 고객 핸드폰 번호
	private String cusGender; 		// 고객 성별
	private String cusBirth; 		// 고객 생년월일
	private String cusSend; 		// 마케팅 수신여부
	private String cusName; 		// 고객 이름
	private String cusAdd; 			// 고객 주소
	private String cusAdd2; 		// 고객 상세주소
	private String cusPostcode; 	// 고객 우편번호
	private String cusDelyn; 		// 고객 탈퇴여부
	private String cusRegdt;
	
	private String tempPassword;	// 임시비밀번호 암호화

	// DB에 없음
	private int currentCount; 	// 현재 고객 수 
	private int totalCount; 		// 회원가입한 고객 수 (탈퇴 포함)
	private int quitCount; 		// 탈퇴한 고객 수 
	private int maleCount; 		// 남성 고객 수 
	private int femaleCount; 	// 여성 고객 수 
}
