package kr.or.ddit.customer.myPage.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.myPage.mapper.CustomerMyPageMapper;
import kr.or.ddit.customer.myPage.service.CustomerMyPageService;
import kr.or.ddit.customer.myPage.vo.CustomerMyPageVO;
import kr.or.ddit.util.vo.PaginationVO;

@Service
public class CustomerMyPageServiceImpl implements CustomerMyPageService{

	@Inject
	private CustomerMyPageMapper mapper;
	
	@Override
	public CustomerMyPageVO myInfomation(String cusId) {
		return mapper.myInfomation(cusId);
	}

	@Override
	public void myInfoUpdate(CustomerMyPageVO customerVO) {
		mapper.myInfoUpdate(customerVO);
	}

	@Override
	public int myBoardCount(PaginationVO<CustomerMyPageVO> pagingVO) {
		return mapper.myBoardCount(pagingVO);
	}

	@Override
	public List<CustomerMyPageVO> myBoardList(PaginationVO<CustomerMyPageVO> pagingVO) {
		return mapper.myBoardList(pagingVO);
	}


	@Override
	public CustomerMyPageVO myParkingReserve(String cusId) {
		return mapper.myParkingReserve(cusId);
	}

	@Override
	public Map<String, Integer> myReserveCount(String cusId) {
		return mapper.myReserveCount(cusId);
	}

	@Override
	public CustomerMyPageVO myHotelReserve(String cusId) {
		return mapper.myHotelReserve(cusId);
	}

	@Override
	public CustomerMyPageVO myRoungeReserve(String cusId) {
		return mapper.myRoungeReserve(cusId);
	}

	@Override
	public List<CustomerMyPageVO> myTicketing(String cusId) {
		return mapper.myTicketing(cusId);
	}

	@Override
	public void myPassportUpdate(CustomerMyPageVO customerVO) {
		mapper.myPassportUpdate(customerVO);
	}

//	@Override
//	public String departIcKr(CustomerMyPageVO customerMyPageVO) {
//		return mapper.departIcKr(customerMyPageVO);
//	}
//
//	@Override
//	public String arrivalIcKr(CustomerMyPageVO customerMyPageVO) {
//		return mapper.arrivalIcKr(customerMyPageVO);
//	}

	@Override
	public void myParkingReserveDelete(CustomerMyPageVO customerVO) {
		mapper.myParkingReserveDelete(customerVO);
	}

	@Override
	public void myHtReserveDelete(CustomerMyPageVO customerVO) {
		mapper.myHtReserveDelete(customerVO);
	}

	@Override
	public void myRrReserveDelete(CustomerMyPageVO customerVO) {
		mapper.myRrReserveDelete(customerVO);
	}

	@Override
	public void myTicketingDelete(CustomerMyPageVO customerVO) {
		mapper.myTicketingDelete(customerVO);
	}

	@Override
	public List<CustomerMyPageVO> departIcKr(String cusId) {
		return mapper.departIcKr(cusId);
	}

	@Override
	public List<CustomerMyPageVO> arrivalIcKr(String cusId) {
		return mapper.arrivalIcKr(cusId);
	}







}
