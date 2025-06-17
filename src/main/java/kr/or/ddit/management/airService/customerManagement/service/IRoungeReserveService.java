package kr.or.ddit.management.airService.customerManagement.service;

import java.util.List;

import kr.or.ddit.customer.reserve.rounge.vo.RoungeVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IRoungeReserveService {

	public int count(PaginationVO<RoungeVO> pagingVO);

	public List<RoungeVO> list(PaginationVO<RoungeVO> pagingVO);

	public void status(RoungeVO roungeVO);

	public RoungeVO count1();

	public List<RoungeVO> selectRoungeReserveList();

	public int selectAllParking();

	public int selectTodayParking();

	public int selectNewParkingList();

	public int selectCancelParkingList();

	public List<Integer> preReserNum();

	public List<Integer> thisReserNum();



}
