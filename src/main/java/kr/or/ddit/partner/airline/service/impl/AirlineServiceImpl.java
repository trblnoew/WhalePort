package kr.or.ddit.partner.airline.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.management.partner.airportSchedule.vo.PaginationInfoVO;
import kr.or.ddit.partner.airline.mapper.IAirlineMapper;
import kr.or.ddit.partner.airline.service.IAirlineService;

@Service
public class AirlineServiceImpl implements IAirlineService {

	@Inject
	private IAirlineMapper mapper;
	

	@Override
	public List<PlaneScheduleVO> getMySchedule(PaginationInfoVO<PlaneScheduleVO> pagingVO) {
		return mapper.getMySchedule(pagingVO);
	}

	@Override
	public int dataCnt(PaginationInfoVO<PlaneScheduleVO> pagingVO) {
		return mapper.dataCnt(pagingVO);
	}

}
