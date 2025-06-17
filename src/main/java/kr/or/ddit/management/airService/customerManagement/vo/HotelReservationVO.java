package kr.or.ddit.management.airService.customerManagement.vo;

import java.util.Date;

import lombok.Data;

@Data
public class HotelReservationVO {
	private int hrNo;			// 호텔 예약 번호
	private int htNo;			// 호텔 객실 번호
	private String hrName;		// 호텔 예약자 이름
	private String hrTel;		// 호텔 예약자 휴대번호
	private String hrStatus;	// 호텔 예약자 상태
	private Date hrCheckin;		// 호텔 체크인 시간
	private Date hrCheckout;	// 호텔 체크아웃 시간
	private int hrCost;			// 호텔 결제 금액
	private Date hrDate;		// 호텔 결제 일시
	private String hrWay;		// 호텔 결제 수단
	private int cusNo;			// 호텔 고객 번호
}
