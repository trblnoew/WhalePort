package kr.or.ddit.customer.notice.vo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;


import kr.or.ddit.util.vo.FileVO;
import lombok.Data;

@Data
public class UserNoticeVO {
	private int noNo;			//공지 번호
	private String noTitle;		//공지 제목
	private String noCategory;	//공지 유형
	private String noContent;	//공지 내용
	private String noCode;		//공지대상 분류 상세 코드 - NTC01:직원, NTC02:협력업체, NTC03:고객
	private String noFilecode;	//첨부파일코드 - 02 : 공지
	private int empNo;			//직원번호
	private int noCount;		//조회수
	private String noDelyn;		//삭제여부
	private LocalDate noDate;	//작성일자
	private String empName;		//직원이름
	private String empDept;
	private String fileOwner;	//파일 소유 - 예) 공지 : 02, noNo=46 -> 0246
	private int totalCnt;
	
	private Integer[] delNoticeNo;	//삭제번호 바열
	private MultipartFile[] noFile;	// 첨부파일 배열
	private List<FileVO> noticeFileList; // 첨부파일 리스트

	// noFile setter
	public void setNoFile(MultipartFile[] noFile) {
		this.noFile = noFile;
		if(noFile != null) { // 파일이 존재한다면
			List<FileVO> noticeFileList = new ArrayList<FileVO>();
			for (MultipartFile item : noFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				FileVO noticeFileVO = new FileVO(item); //커스텀 생성자
				noticeFileList.add(noticeFileVO);
			}
			this.noticeFileList = noticeFileList;
		}
		
		
		
	}
	
	
	
	
	
	
	
	
}
