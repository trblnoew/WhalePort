package kr.or.ddit.management.airService.customerManagement.vo;

import lombok.Data;

@Data
public class ParkingReservationVO {
	private int prNo;			// 기록 번호
	private int plNo;			// 주차장 번호
	private String prCarno;		// 차량 번호
	private String prEntry;		// 차량 입차일
	private String prExit;		// 차량 출차일
	private int prCost;			// 결제 금액
	private String prDate;		// 결제 일시
	private String prWay;		// 결제 수단
	private String prStatus;	// 예약 상태
	private int cusNo;			// 고객 번호
	private String prName;		// 주차장 사용자 이름
	private String prTel;		// 주차장 사용자 전화번호
}
