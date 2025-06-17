package kr.or.ddit.partner.facilities.vo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.vo.FileVO;
import lombok.Data;

@Data
public class PartnerInspectionVO {
	private int inNo;
	private int ptNo;
	private String ptName;
	private int empNo;
	private String inStartdate;
	private String inEnddate;
	private String inGoal;
	private int inStaff;
	private String inPlace;
	private String seInQr;
	private String inState;
	private String inCode;
	private String inFilecode;
	private String inTitle;
	private String inContent;
	private String reportDate;
	private String inReception;
	private int countY;
	private int countN;
	private int countH;
	
	private Integer[] delReportNo;	//삭제번호 배열
	private MultipartFile[] reportFile; //첨부파일 배열
	private List<FileVO> reportFileList; // 첨부파일 리스트
	private String fileOwner;	//파일 소유 - 예) 공지 : 02, noNo=46 -> 0246
	
	public void setReportFile(MultipartFile[] reportFile) {
		this.reportFile = reportFile;
		if(reportFile != null) {
			List<FileVO> reportFileList = new ArrayList<FileVO>();
			for(MultipartFile item : reportFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				FileVO fileVO = new FileVO(item);
				reportFileList.add(fileVO);
			}
			this.reportFileList = reportFileList;
		}
	}
	
	public String getFormattedReportDate() {
		if(reportDate != null) {
			return formatDate(reportDate);
		} else {
			return "";
		}
	}
	
    private String formatDate(String dateStr) {
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd"); // 입력 형식
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd"); // 출력 형식
            Date date = inputFormat.parse(dateStr);
            return outputFormat.format(date);
        } catch (Exception e) {
            e.printStackTrace();
            return ""; // 오류 발생 시 빈 문자열 반환
        }
    }
    
	
}