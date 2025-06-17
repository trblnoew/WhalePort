package kr.or.ddit.common.login.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class LoginCommonVO {
	private int empNo;				// 직원 번호
	private String empId;			// 직원 사번
	private String empPw;			// 직원 비밀번호
	private String empDepw;			// 직원 원본 비밀번호
	private String empName;			// 직원 이름
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empBirth;			// 직원 생년월일
	private String empEmail;		// 직원 이메일
	private String empTel;			// 직원 휴대폰번호
	private String empAddr;			// 직원 주소
	private String empAddr2;		// 직원 상세주소
	private String empPostcode;		// 우편번호
	private String empDept;			// 직원 부서
	private String empQr;			// 직원 QR승인여부
	private String empCarmodel;		// 직원 차량종류
	private String empCarnum;		// 직원 차량번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empStartdate;		// 입사일
	private String empPosition;		// 직위
	private String empImage;		// 이미지 경로
	private String empApproval;		// 직원 승인여부
	private String empReject;		// 반려사유
	private String empLock;			// 계정잠금여부
	
	private MultipartFile imgFile;
	
	private String tempPassword;	// 임시비밀번호 암호화
	
	private List<LoginCommonAuthVO> authList;
	
	private int roomNo; // 채팅을위해 잠시 세팅
	
	public int getEmpNo() {
		return empNo;
	}
	
}
