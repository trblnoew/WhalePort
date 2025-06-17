package kr.or.ddit.management.human.management.vo;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmployeeVO {

	private int empNo;
	private String empId;
	private String empPw;
	private String empName;
	private String empBirth;
	private String empEmail;
	private String empTel;
	private String empAddr;
	private String empAddr2;
	private String empPostcode;
	private String empDept;
	private String empQr;
	private String empCarmodel;
	private String empCarnum;
	private String empStartdate;
	private String empPosition;
	private String empImage;
	private String empApproval;
	private String empReject;
	private String empDepw;
	private String empDel;
	
	private int countY;
	private int countN;
	private int countR;
	private int countX;
	private int totalCount;
	
	private MultipartFile imgFile;
	//private String memProfileimg;
}
