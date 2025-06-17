package kr.or.ddit.management.airService.customerManagement.mapper;

import kr.or.ddit.management.airService.customerManagement.vo.HotelReservationVO;
import kr.or.ddit.management.airService.customerManagement.vo.MeetingReservationVO;
import kr.or.ddit.management.airService.customerManagement.vo.ParkingReservationVO;
import kr.or.ddit.management.airService.customerManagement.vo.RoungeReservationVO;

public interface CustomerReserveMapper {
	
	// 레디얼 차트 - 호텔 총 매출
	public HotelReservationVO radialCapsuleHotel();
	
	// 레디얼 차트 - 라운지 총 매출
	public RoungeReservationVO radialRounge();
	
	// 레디얼 차트 - 주차장 총 매출
	public ParkingReservationVO radialParking();
	
	// 레디얼 차트 - 회의실 총 매출
	public MeetingReservationVO radialMeeting();
}
