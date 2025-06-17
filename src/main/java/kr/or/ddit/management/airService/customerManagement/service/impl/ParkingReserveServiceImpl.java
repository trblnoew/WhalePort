package kr.or.ddit.management.airService.customerManagement.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.customer.reserve.parking.vo.ParkingVO;
import kr.or.ddit.customer.reserve.rounge.vo.RoungeVO;
import kr.or.ddit.management.airService.customerManagement.mapper.ParkingReserveMapper;
import kr.or.ddit.management.airService.customerManagement.service.IParkingReserveService;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ParkingReserveServiceImpl implements IParkingReserveService{

	@Inject
	private ParkingReserveMapper mapper;
	
	@Override
	public int count(PaginationVO<ParkingVO> pagingVO) {
		log.info("# ParkingReserveMapper count");
		return mapper.count(pagingVO);
	}

	@Override
	public List<ParkingVO> list(PaginationVO<ParkingVO> pagingVO) {
		log.info("# ParkingReserveMapper list");
		return mapper.list(pagingVO);
	}

	@Override
	public void status(ParkingVO parkingVO) {
		log.info("# ParkingReserveMapper status");
		mapper.status(parkingVO);
	}

	@Override
	public ParkingVO count1() {
		log.info("# ParkingReserveMapper count1");
		return mapper.count1();
	}

	@Override
	public List<ParkingVO> selectParkingReserveList() {
		return mapper.selectParkingReserveList();
	}

	@Override
	public int selectAllRounge() {
		return mapper.selectAllRounge();
	}

	@Override
	public int selectTodayRounge() {
		return mapper.selectTodayRounge();
	}

	@Override
	public int selectNewRoungeList() {
		return mapper.selectNewRoungeList();
	}

	@Override
	public int selectCancelRoungeList() {
		return mapper.selectCancelRoungeList();
	}

	@Override
	public List<Integer> preReserNum() {
		return mapper.preReserNum();
	}

	@Override
	public List<Integer> thisReserNum() {
		return mapper.thisReserNum();
	}
}
