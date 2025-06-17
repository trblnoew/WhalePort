package kr.or.ddit.management.airService.customerManagement.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.management.airService.customerManagement.mapper.CustomerReserveMapper;
import kr.or.ddit.management.airService.customerManagement.service.CustomerReserveService;
import kr.or.ddit.management.airService.customerManagement.vo.HotelReservationVO;
import kr.or.ddit.management.airService.customerManagement.vo.MeetingReservationVO;
import kr.or.ddit.management.airService.customerManagement.vo.ParkingReservationVO;
import kr.or.ddit.management.airService.customerManagement.vo.RoungeReservationVO;

@Service
public class CustomerReserveServiceImpl implements CustomerReserveService {
	
	@Inject
	private CustomerReserveMapper customerReserveMapper;
	
	// 레디얼 차트 - 호텔 총 매출
	@Override
	public HotelReservationVO radialCapsuleHotel() {
		return customerReserveMapper.radialCapsuleHotel();
	}
	
	// 레디얼 차트 - 라운지 총 매출
	@Override
	public RoungeReservationVO radialRounge() {
		return customerReserveMapper.radialRounge();
	}
	
	// 레디얼 차트 - 주차장 총 매출
	@Override
	public ParkingReservationVO radialParking() {
		return customerReserveMapper.radialParking();
	}
	
	// 레디얼 차트 - 회의실 총 매출
	@Override
	public MeetingReservationVO radialMeeting() {
		return customerReserveMapper.radialMeeting();
	}
}
