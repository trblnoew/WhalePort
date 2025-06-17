package kr.or.ddit.partner.common.qna.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.vo.FileVO;
import lombok.Data;

@Data
public class PartnerQnaVO {
	private int qnaNo;
	private int ptNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaAns;
	private String ansFilecode;
	private String queFilecode;
	private Date qnaDate;
	private String qnaState;
	private int qnaCount;		//조회수
	private String qnaDelyn;	//삭제여부
	
	private Integer[] delQnaNo;	//삭제번호 배열
	private MultipartFile[] qnaFile; //첨부파일 배열
	private List<FileVO> qnaFileList; // 첨부파일 리스트
	private String fileOwner;	//파일 소유 - 예) 공지 : 02, noNo=46 -> 0246
	
	private String comdName;
	private String comdCode;
	private String ptName;
	private String ptCode;
	
	public void setQnaFile(MultipartFile[] qnaFile) {
		this.qnaFile = qnaFile;
		if(qnaFile != null) {
			List<FileVO> qnaFileList = new ArrayList<FileVO>();
			for(MultipartFile item : qnaFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				FileVO fileVO = new FileVO(item);
				qnaFileList.add(fileVO);
			}
			this.qnaFileList = qnaFileList;
		}
	}
}
