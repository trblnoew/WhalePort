package kr.or.ddit.customer.reserve.hotel.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.reserve.hotel.mapper.HotelMapper;
import kr.or.ddit.customer.reserve.hotel.service.IHotelService;
import kr.or.ddit.customer.reserve.hotel.vo.HotelVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HotelServiceImpl implements IHotelService{

	@Inject
	private HotelMapper mapper;
	
	@Override
	public List<HotelVO> list() {
		log.info("# HotelServiceImpl list");
		return mapper.list();
	}

	@Override
	public void register(HotelVO hotelVO) {
		log.info("# HotelServiceImpl register");
		mapper.register(hotelVO);
	}

	@Override
	public HotelVO select(int htNo) {
		log.info("# HotelServiceImpl select");
		return mapper.select(htNo);
	}

	@Override
	public int check(HotelVO hotelVO) {
		log.info("# HotelServiceImpl check");
		return mapper.check(hotelVO);
	}


}

