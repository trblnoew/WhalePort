package kr.or.ddit.management.partner.airportSchedule.mapper;

import java.util.List;

import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.management.partner.airportSchedule.vo.PaginationInfoVO;

public interface AirportMapper {

	public void insert(PlaneScheduleVO pVO);

	public List<PlaneScheduleVO> getData(PaginationInfoVO<PlaneScheduleVO> pagingVO);

	public void commitData(PlaneScheduleVO pVO);

	public int dataCnt(PaginationInfoVO<PlaneScheduleVO> pagingVO);

}
