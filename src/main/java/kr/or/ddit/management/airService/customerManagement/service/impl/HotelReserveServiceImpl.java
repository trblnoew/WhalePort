package kr.or.ddit.management.airService.customerManagement.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.reserve.hotel.vo.HotelVO;
import kr.or.ddit.management.airService.customerManagement.mapper.HotelReserveMapper;
import kr.or.ddit.management.airService.customerManagement.service.IHotelReserveService;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HotelReserveServiceImpl implements IHotelReserveService {
	
	@Inject
	private HotelReserveMapper mapper;
	
	@Override
	public int count(PaginationVO<HotelVO> pagingVO) {
		log.info("# CustomerReserveServiceImpl count");
		return mapper.count(pagingVO);
	}

	@Override
	public List<HotelVO> list(PaginationVO<HotelVO> pagingVO) {
		log.info("# CustomerReserveServiceImpl list");
		return mapper.list(pagingVO);
	}

	@Override
	public HotelVO detail(int hrNo) {
		log.info("# CustomerReserveServiceImpl detail");
		return mapper.detail(hrNo);
	}

	@Override
	public void update(HotelVO hotelVO) {
		log.info("# CustomerReserveServiceImpl update");
		mapper.update(hotelVO);
	}

	@Override
	public void status(HotelVO hotelVO) {
		log.info("# CustomerReserveServiceImpl status");
		mapper.status(hotelVO);
	}

	@Override
	public HotelVO count1() {
		log.info("# CustomerReserveServiceImpl count1");
		return mapper.count1();
	}

	@Override
	public List<HotelVO> selectHotelReserveList() {
		return mapper.selectHotelReserveList();
	}

	@Override
	public int selectAllHotel() {
		return mapper.selectAllHotel();
	}

	@Override
	public int selectTodayHotel() {
		return mapper.selectTodayHotel();
	}

	@Override
	public int selectNewHotelList() {
		return mapper.selectNewHotelList();
	}

	@Override
	public int selectCancelHotelList() {
		return mapper.selectCancelHotelList();
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
