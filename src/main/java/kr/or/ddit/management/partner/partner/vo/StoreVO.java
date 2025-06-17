package kr.or.ddit.management.partner.partner.vo;

import lombok.Data;

@Data
public class StoreVO {
	
	private String stoNo;	// 입점업체 게시판 시퀀스
	private int ptNo;	// 입접(협력)업체 게시판 시퀀스
	private String stoCategory1;	//카테고리1
	private String stoCategory2;	//카테고리1
	private String stoTime;		// 영업시간
	private String stoDetail;	// 업체소개(주력 상품)
	
	private String ptName;	// 입점업체 이름
	private int ptXpos;	// x좌표
	private int ptYpos;	// y좌표
	private String ptCeo;	// 입점업체 대표자 서명
	private String ptBusnum;	// 사업자 번호
	private String ptMgrname;	//  업체 담당자 이름
	private String ptMgremail;	// 업체 담당자 이메일
	private String ptMgrtel; // 대표 연락처(담당자 연락처가 대표 연락처임)
	private String ptImage;	// 업체 로고
	
	
	
	

}
