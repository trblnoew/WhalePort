package kr.or.ddit.management.airService.customerManagement.vo;

import lombok.Data;

@Data
public class RoungeReservationVO {
	private int rrNo;			// 라운지 예약 번호
	private int rgNo;			// 라운지 번호
	private String rrName;		// 에약자 이름
	private String rrTel;		// 예약자 전화번호
	private int rrCount;		// 예약 인원
	private String rrStatus;	// 예약자 상태 여부
	private int rrCost;			// 결제 금액
	private String rrDate;		// 결제 일시
	private String rrWay;		// 결제 수단
	private int cusNo;			// 고객 번호
}
