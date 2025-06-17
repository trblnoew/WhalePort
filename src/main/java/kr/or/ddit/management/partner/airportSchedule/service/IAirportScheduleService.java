package kr.or.ddit.management.partner.airportSchedule.service;

import java.util.List;

import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.management.partner.airportSchedule.vo.PaginationInfoVO;

public interface IAirportScheduleService {

	public void insert(List<PlaneScheduleVO> planeVO);

	public List<PlaneScheduleVO> getData(PaginationInfoVO<PlaneScheduleVO> pagingVO);

	public void commitData(List<PlaneScheduleVO> planeVO);

	public int dataCnt(PaginationInfoVO<PlaneScheduleVO> pagingVO);

}
