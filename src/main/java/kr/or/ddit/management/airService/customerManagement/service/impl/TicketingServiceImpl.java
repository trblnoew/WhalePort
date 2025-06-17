package kr.or.ddit.management.airService.customerManagement.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.airport.airportReserve.vo.TicketingVO;
import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.management.airService.customerManagement.mapper.ITicketingMapper;
import kr.or.ddit.management.airService.customerManagement.service.ITicketingService;
import kr.or.ddit.util.vo.PaginationVO;

@Service
public class TicketingServiceImpl implements ITicketingService {
	
	@Inject
	private ITicketingMapper tickMapper;

	@Override
	public int selectAllTicketing() {
		return tickMapper.selectAllTicketing();
	}

	@Override
	public int selectTodayTicketing() {
		return tickMapper.selectTodayTicketing();
	}

	@Override
	public int selectNewTicketingList() {
		return tickMapper.selectNewTicketingList();
	}

	@Override
	public int selectCancelTicketingList() {
		return tickMapper.selectCancelTicketingList();
	}

	@Override
	public int selectTicketingCount(PaginationVO<TicketingVO> pagingVO) {
		return tickMapper.selectTicketingCount(pagingVO);
	}

	@Override
	public List<TicketingVO> selectTicketingList(PaginationVO<TicketingVO> pagingVO) {
		return tickMapper.selectTicketingList(pagingVO);
	}

	@Override
	public List<Integer> preReserNum() {
		return tickMapper.preReserNum();
	}

	@Override
	public List<Integer> thisReserNum() {
		return tickMapper.thisReserNum();
	}

	@Override
	public List<TicketingVO> countryList() {
		return tickMapper.countryList();
	}

	@Override
	public TicketingVO selectAirlineReserve(int tkNo) {
		return tickMapper.selectAirlineReserve(tkNo);
	}

	@Override
	public LoginCustomerVO selectCustomer(int cusNo) {
		return tickMapper.selectCustomer(cusNo);
	}

	@Override
	public int airlineReserveCancel(int tkNo) {
		return tickMapper.airlineReserveCancel(tkNo);
	}

}
