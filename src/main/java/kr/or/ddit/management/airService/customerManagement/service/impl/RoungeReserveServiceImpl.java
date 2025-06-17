package kr.or.ddit.management.airService.customerManagement.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.reserve.hotel.vo.HotelVO;
import kr.or.ddit.customer.reserve.rounge.vo.RoungeVO;
import kr.or.ddit.management.airService.customerManagement.mapper.RoungeReserveMapper;
import kr.or.ddit.management.airService.customerManagement.service.IRoungeReserveService;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RoungeReserveServiceImpl implements IRoungeReserveService {
	
	@Inject
	private RoungeReserveMapper mapper;
	

	@Override
	public int count(PaginationVO<RoungeVO> pagingVO) {
		log.info("# RoungeReserveServiceImpl count");
		return mapper.count(pagingVO);
	}

	@Override
	public List<RoungeVO> list(PaginationVO<RoungeVO> pagingVO) {
		log.info("# RoungeReserveServiceImpl list");
		return mapper.list(pagingVO);
	}

	@Override
	public void status(RoungeVO roungeVO) {
		log.info("# RoungeReserveServiceImpl status");
		mapper.status(roungeVO);
	}

	@Override
	public RoungeVO count1() {
		log.info("# RoungeReserveServiceImpl count1");
		return mapper.count1();
	}

	@Override
	public List<RoungeVO> selectRoungeReserveList() {
		return mapper.selectRoungeReserveList();
	}

	@Override
	public int selectAllParking() {
		return mapper.selectAllParking();
	}

	@Override
	public int selectTodayParking() {
		return mapper.selectTodayParking();
	}

	@Override
	public int selectNewParkingList() {
		return mapper.selectNewParkingList();
	}

	@Override
	public int selectCancelParkingList() {
		return mapper.selectCancelParkingList();
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
