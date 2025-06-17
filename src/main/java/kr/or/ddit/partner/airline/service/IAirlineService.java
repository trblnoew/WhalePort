package kr.or.ddit.partner.airline.service;

import java.util.List;

import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.management.partner.airportSchedule.vo.PaginationInfoVO;

public interface IAirlineService {

	public List<PlaneScheduleVO> getMySchedule(PaginationInfoVO<PlaneScheduleVO> pagingVO);

	public int dataCnt(PaginationInfoVO<PlaneScheduleVO> pagingVO);

}
