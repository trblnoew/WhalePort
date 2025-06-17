package kr.or.ddit.customer.myPage.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.customer.myPage.vo.CustomerMyPageVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface CustomerMyPageMapper {

	public CustomerMyPageVO myInfomation(String cusId);

	public void myInfoUpdate(CustomerMyPageVO customerVO);

	public int myBoardCount(PaginationVO<CustomerMyPageVO> pagingVO);

	public List<CustomerMyPageVO> myBoardList(PaginationVO<CustomerMyPageVO> pagingVO);

	public CustomerMyPageVO myParkingReserve(String cusId);

	public Map<String, Integer> myReserveCount(String cusId);

	public CustomerMyPageVO myHotelReserve(String cusId);

	public CustomerMyPageVO myRoungeReserve(String cusId);

	public List<CustomerMyPageVO> myTicketing(String cusId);

	public void myPassportUpdate(CustomerMyPageVO customerVO);

//	public String departIcKr(CustomerMyPageVO customerMyPageVO);
//
//	public String arrivalIcKr(CustomerMyPageVO customerMyPageVO);

	public void myParkingReserveDelete(CustomerMyPageVO customerVO);

	public void myHtReserveDelete(CustomerMyPageVO customerVO);

	public void myRrReserveDelete(CustomerMyPageVO customerVO);

	public void myTicketingDelete(CustomerMyPageVO customerVO);

	public List<CustomerMyPageVO> departIcKr(String cusId);

	public List<CustomerMyPageVO> arrivalIcKr(String cusId);



}
