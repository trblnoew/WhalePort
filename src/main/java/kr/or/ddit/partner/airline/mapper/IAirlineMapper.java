package kr.or.ddit.partner.airline.mapper;

import java.util.List;

import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.management.partner.airportSchedule.vo.PaginationInfoVO;

public interface IAirlineMapper {

	public List<PlaneScheduleVO> getMySchedule(PaginationInfoVO<PlaneScheduleVO> pagingVO);

	public int dataCnt(PaginationInfoVO<PlaneScheduleVO> pagingVO);

}
