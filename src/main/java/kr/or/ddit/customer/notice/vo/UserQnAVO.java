package kr.or.ddit.customer.notice.vo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.vo.FileVO;
import lombok.Data;

@Data
public class UserQnAVO {
	private int qnaNo;
	private int cusNo;
	private int empNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaAns;
	private String qnaFilecode;
	private int qnaCount;
	private String qnaDelyn;
	private LocalDate qnaDate;
	private String fileOwner;	//파일 소유 - 예) 공지 : 02, noNo=46 -> 0246
	
	private String cusId;
	
	private String cusName;
	
	private Integer[] delQnANo;	//삭제번호 바열
	private MultipartFile[] qnaFile;	// 첨부파일 배열
	private List<FileVO> qnaFileList; // 첨부파일 리스트

	// noFile setter
	public void setNoFile(MultipartFile[] qnaFile) {
		this.qnaFile = qnaFile;
		if(qnaFile != null) { // 파일이 존재한다면
			List<FileVO> qnaFileList = new ArrayList<FileVO>();
			for (MultipartFile item : qnaFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				FileVO qnaFileVO = new FileVO(item); //커스텀 생성자
				qnaFileList.add(qnaFileVO);
			}
			this.qnaFileList = qnaFileList;
		}
		
		
		
	}
}
