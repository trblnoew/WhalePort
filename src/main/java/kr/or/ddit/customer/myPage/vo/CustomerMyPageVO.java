package kr.or.ddit.customer.myPage.vo;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.vo.FileVO;
import lombok.Data;

@Data
public class CustomerMyPageVO {
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
	
	private String tempPassword;	// 임시비밀번호 암호화
	
	public String getFormattedCusBirth() {
		return formatDate(cusBirth);
	}

	
	private String formatDate(String dateStr) {
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 입력 형식
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd"); // 출력 형식
            Date date = inputFormat.parse(dateStr);
            return outputFormat.format(date);
        } catch (Exception e) {
            e.printStackTrace();
            return ""; // 오류 발생 시 빈 문자열 반환
        }
    }
	
	
	
	// 게시글 조회를 위한 vo
	private int qnaNo;  
	private int empNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaAns;
	private String qnaFilecode;
	private int qnaCount;
	private String qnaDelyn;
	private LocalDate qnaDate;
	private String fileOwner;	//파일 소유 - 예) 공지 : 02, noNo=46 -> 0246
	
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
	
	// 각 예약의 count조회를 위한 vo
	private int rrrCount;	//라운지 예약갯
	private int mrCount;	//회의실 예약갯수
	private int hrCount;	//호텔 예약갯수 
	private int prCount;	//주차장 예약갯수
	private int trCount;	//항공권 예약갯수
	
	// 주차장 예약 조회를 위한 vo
	private int plNo;
	private String plName;
	private int plCost;
	
	private int prNo;
	private String prCarno;
	private String prEntry;
	private String prExit;
	private int prCost;
	private String prDate;
	private String prWay;
	private String prStatus;
	private String prName;
	private String prTel;
	
	// 호텔 예약 조회를 위한 vo
	private int htNo;
	private String htName;
	
	private int hrNo;
	private String hrName;
	private String hrTel;
	private String hrStatus;
	private String hrCheckin;
	private int hrCost;
	private String hrDate;
	private String hrWay;
	
	// 라운지 예약 조회를 위한 vo
	private int rgNo;
	private String rgName;
	private String rgLoc;
	private Date rgTime;
	private String rgUsetime;
	private int rgSeat;
	private int rgCost;
	private String rgPhoto;
	private String rgReview;
	private String rgContent;
	
	
	private int rrNo;
	private String rrName;
	private String rrTel;
	private int rrCount;
	private String rrStatus;
	private int rrCost;
	private String rrDate;
	private String rrWay;
	
	// 항공권 예약 조회를 위한 vo
	private int tkNo;
	private int tkAge;
	private int tkFlight;
	private String tkSeat;
	private String tkDepart;
	private Date tkDepartdate;
	private String tkArrival;
	private String tkArridate;
	private String tkPassport;
	private int tkPrice;
	private String tkEngfirst;
	private String tkLastname;
	private int tkWeight;
	private String tkGender; 
	private String tkEmail;
	private String tkTel;
	private String tkBirth;
	private String tkGroup;
	
	private String scGate;
	private String scCheckin;
	
	private String icCode;
	private String icKr;
	private String icCountry;
	private String tkDepartcity;
	private String tkArrivalcity;
}
