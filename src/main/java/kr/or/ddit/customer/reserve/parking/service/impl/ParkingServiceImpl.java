package kr.or.ddit.customer.reserve.parking.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.reserve.parking.mapper.ParkingMapper;
import kr.or.ddit.customer.reserve.parking.service.IParkingService;
import kr.or.ddit.customer.reserve.parking.vo.ParkingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ParkingServiceImpl implements IParkingService{

	@Inject
	private ParkingMapper mapper;
	
	@Override
	public List<ParkingVO> list() {
		log.info("# ParkingServiceImpl list");
		return mapper.list();
	}

	@Override
	public ParkingVO select(int plNo) {
		log.info("# ParkingServiceImpl select");
		return mapper.select(plNo);
	}

	@Override
	public void register(ParkingVO parkingVO) {
		log.info("# ParkingServiceImpl register");
		mapper.register(parkingVO);
	}

	@Override
	public int check(ParkingVO parkingVO) {
		log.info("# ParkingServiceImpl check");
		return mapper.check(parkingVO);
	}

}
