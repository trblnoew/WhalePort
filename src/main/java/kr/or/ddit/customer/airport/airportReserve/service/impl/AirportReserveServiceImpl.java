package kr.or.ddit.customer.airport.airportReserve.service.impl;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.airport.airportReserve.mapper.AirportReserveServiceMapper;
import kr.or.ddit.customer.airport.airportReserve.service.IAirportReserveService;
import kr.or.ddit.customer.airport.airportReserve.vo.IATACodeVO;
import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.customer.airport.airportReserve.vo.TicketingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AirportReserveServiceImpl implements IAirportReserveService {

	@Inject
	private AirportReserveServiceMapper mapper;

	@Override
	public List<IATACodeVO> codeList() {
		return mapper.codeList();
	}

	@Override
	public List<PlaneScheduleVO> searchList(PlaneScheduleVO scheduleVO) {
		return mapper.searchList(scheduleVO);
	}

	@Override
	public List<TicketingVO> tkInfoOne(int scNo) {
		return mapper.tkInfoOne(scNo);
	}

	@Override
	public List<PlaneScheduleVO> payment(PlaneScheduleVO planeScheduleVO) {
		return mapper.payment(planeScheduleVO);
	}

	@Override
	public void insertTicket(TicketingVO ticketVO) {
		
		String uuid = UUID.randomUUID().toString().split("-")[0];
		for(int i = 0 ; i < ticketVO.getTkVO().size() ; i++) { // 3개
			TicketingVO tt = new TicketingVO();
			String[] seat = ticketVO.getTkVO().get(i).getTkSeat().split(",");
			String[] depart = ticketVO.getTkVO().get(i).getTkDepart().split(",");
			String[] departDate = ticketVO.getTkVO().get(i).getTkDepartdate().split(",");
			String[] arrival = ticketVO.getTkVO().get(i).getTkArrival().split(",");
			String[] arriDate = ticketVO.getTkVO().get(i).getTkArridate().split(",");
			String[] setPrice = ticketVO.getTkVO().get(i).getTkSetprice().split(",");
			for(int j = 0 ; j < seat.length ; j++) { //2개 
				int realPrice = Integer.parseInt(setPrice[j]);
				tt = ticketVO.getTkVO().get(i);
				tt.setTkSeat(seat[j]);
				tt.setTkDepart(depart[j]);
				tt.setTkDepartdate(departDate[j]);
				tt.setTkArrival(arrival[j]);
				tt.setTkArridate(arriDate[j]);
				tt.setTkPrice(realPrice);
				tt.setTkGroup(uuid);
				log.info("tt :: " + tt.toString());
				mapper.insertTicket(tt);
				
			}
		}
	}

	
}
