package kr.or.ddit.management.airService.customerManagement.service;

import java.util.List;

import kr.or.ddit.customer.airport.airportReserve.vo.TicketingVO;
import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface ITicketingService {

	public int selectAllTicketing();

	public int selectTodayTicketing();

	public int selectNewTicketingList();

	public int selectCancelTicketingList();

	public int selectTicketingCount(PaginationVO<TicketingVO> pagingVO);

	public List<TicketingVO> selectTicketingList(PaginationVO<TicketingVO> pagingVO);

	public List<Integer> preReserNum();

	public List<Integer> thisReserNum();

	public List<TicketingVO> countryList();

	public TicketingVO selectAirlineReserve(int tkNo);

	public LoginCustomerVO selectCustomer(int cusNo);

	public int airlineReserveCancel(int tkNo);


}
