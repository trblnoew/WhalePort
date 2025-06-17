package kr.or.ddit.customer.airport.airportReserve.mapper;

import java.util.List;

import kr.or.ddit.customer.airport.airportReserve.vo.IATACodeVO;
import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.customer.airport.airportReserve.vo.TicketingVO;

public interface AirportReserveServiceMapper {

	public List<IATACodeVO> codeList();

	public List<PlaneScheduleVO> searchList(PlaneScheduleVO scheduleVO);

	public List<TicketingVO> tkInfoOne(int scNo);

	public List<PlaneScheduleVO> payment(PlaneScheduleVO planeScheduleVO);

	public void insertTicket(TicketingVO tVO);

	

}
