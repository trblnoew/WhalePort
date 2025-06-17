package kr.or.ddit.partner.common.account.vo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.vo.FileVO;
import lombok.Data;

@Data
public class PartnerVO {
	private int ptNo;
	private int ptMoney;
	private String ptName;		// 협력업체 이름
	private String ptStartdate;
	private String ptEnddate;
	private String ptBusnum;	// 사업자 번호
	private String ptId;
	private String ptPw;
	private String ptFilecode;
	private String ptImage;		// 업체 로고
	private int ptXpos;			// x좌표
	private int ptYpos;			// y좌표
	private String ptMaintel;
	private String ptOpendate;
	private String ptCode;
	private String ptAdd;
	private String ptAdd2;
	private String ptPostcode;
	private String ptApproval;
	private String ptReject;
	private String ptMgrname;	//  업체 담당자 이름
	private String ptMgremail;	// 업체 담당자 이메일
	private String ptMgrtel;	// 대표 연락처(담당자 연락처가 대표 연락처임)
	private String ptCeo;		// 협력업체 대표자 성명
	private String ptTime1;		// 영업시작 시각
	private String ptTime2;		// 영업종료 시각
	private String ptDetail;	// 업체소개(주력 상품)
	private String ptCategory1;	//입점업체 카테고리1
	private String ptCategory2;	//입점업체 카테고리2
	
	private String comdName;
	private MultipartFile imgFile; //로고 이미지 파일자체
	
	private int countY;
	private int countN;
	private int countH;
	private int totalCount;

	private int countPrm01;
	private int countPrm02;
	private int countPrm03;
	private int countPrm04;

	private Integer[] delPtNo;	//삭제번호 배열
	private MultipartFile[] ptFile; //첨부파일 배열
	private List<FileVO> ptFileList; // 첨부파일 리스트
	private String fileOwner;	//파일 소유 - 예) 공지 : 02, noNo=46 -> 0246
	
	
	public String getFormattedPtStartdate() {
		if(ptStartdate != null) {
			return formatDate(ptStartdate);
		} else {
			return "";
		}
			
	}

	public String getFormattedPtEnddate() {
		if(ptEnddate != null) {
			return formatDate(ptEnddate);
		} else {
			return "";
		}
	}
	
	public String getFormattedPtOpendate() {
		if(ptOpendate != null) {
			return formatDate(ptOpendate);
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
    
	public void setPtFile(MultipartFile[] ptFile) {
		this.ptFile = ptFile;
		if(ptFile != null) {
			List<FileVO> ptFileList = new ArrayList<FileVO>();
			for(MultipartFile item : ptFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				FileVO fileVO = new FileVO(item);
				ptFileList.add(fileVO);
			}
			this.ptFileList = ptFileList;
		}
	}
	
	
	
	public String getFormattedPtTime1() {
		if(ptTime1 != null) {
			return formatTime(ptTime1);
		} else {
			return "";
		}
			
	}

	public String getFormattedPtTime2() {
		if(ptTime2 != null) {
			return formatTime(ptTime2);
		} else {
			return "";
		}
	}
	
	private String formatTime(String timeStr) {
		
		try {
			SimpleDateFormat inputFormat = new SimpleDateFormat("HH:mm");	// 입력 형식
			SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");	// 출력 형식
			Date date = inputFormat.parse(timeStr);
			return outputFormat.format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return ""; // 오류 발생 시 빈 문자열 반환
	    }
	}
}