package kr.or.ddit.management.partner.airportSchedule.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.management.partner.airportSchedule.mapper.AirportMapper;
import kr.or.ddit.management.partner.airportSchedule.service.IAirportScheduleService;
import kr.or.ddit.management.partner.airportSchedule.vo.PaginationInfoVO;

@Service
public class AirportScheduleImpl implements IAirportScheduleService{
	
	@Inject
	private AirportMapper mapper;
	
	@Override
	public void insert(List<PlaneScheduleVO> planeVO) {
		
		for(PlaneScheduleVO pVO : planeVO) {
			mapper.insert(pVO);
		}
		
		
	}

	@Override
	public void commitData(List<PlaneScheduleVO> planeVO) {
		for(PlaneScheduleVO pVO : planeVO) {
			mapper.commitData(pVO);
		}
		
	}

	@Override
	public List<PlaneScheduleVO> getData(PaginationInfoVO<PlaneScheduleVO> pagingVO) {
		return mapper.getData(pagingVO);
	}

	@Override
	public int dataCnt(PaginationInfoVO<PlaneScheduleVO> pagingVO) {
		return mapper.dataCnt(pagingVO);
	}

	

}
