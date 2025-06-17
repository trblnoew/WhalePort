package kr.or.ddit.customer.airport.airportReserve.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PlaneScheduleVO {	
	private int scNo;
	private int scNo2; 			// jsp에서 왕복2번째를 받기위한 int
	private String scAirfln;	// 항공기 이름 ex) NH1160
	private String scAirline;	// 항공사
	private String scBoarding;	// 출발지
	private String scArrived;	// 도착지
	private String scCity;		// 운항구간코드
	private String scLine;		// 국내국제구분
	
    private Date scStdate;	
    private Date scStd;// 도착시간
	private String scGate;		// 게이트
	private String scCheckin;	// 체크인카운터
	private int scSeatqty;	// 좌석수
	private int scPrice;
	private String scImage;
	
	
	//데이터 삽입을위한 paging
	private String pageNo;
	
	// 고객 몇명인지?
	private int cusCnt;
	
	// 좌석 예매
	private List<String> seat;
	
	private List<PlaneScheduleVO> seatVO;
	
	//management에서 쓰는놈
	private int flightCount;
	
	private String firstStdate;
	private String lastStdate;
	
	private int icDistance;
	private String icCountry;
	private String icKr;
	
	
	
}	
