package kr.or.ddit.management.airService.customerManagement.vo;

import lombok.Data;

@Data
public class MeetingReservationVO {
	private int mrrNo;			// 회의실 예약 번호
	private int mrNo;			// 회의실 번호
	private String mrrName;		// 예약자 이름
	private String mrrTel;		// 예약자 휴대번호
	private String mrrTime;		// 회의실 사용시작시간
	private String mrrDate;		// 회의실 사용날짜
	private String mrrUse;		// 회의실 신청일시
	private String mrrStatus;	// 예약상태
	private int cusNo;			// 고객 번호
	private int mrrCost;		// 회의실 가격
}
