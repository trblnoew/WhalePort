package kr.or.ddit.management.airService.popup.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PopupVO {
	
	private int popNo;
	private String popTitle;
	private String popContent;
	private String popGoal;
	private String popStartdate;
	private String popEnddate;
	private String popImg;	//이미지 경로
	private String popApproval;
	private int ptNo;
	private String ptName;
	private String popReject;
	
	
	private MultipartFile popupImgFile; // 이밴트 이미지 받을 때 사용


}
