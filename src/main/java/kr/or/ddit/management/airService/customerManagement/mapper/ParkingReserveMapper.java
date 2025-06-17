package kr.or.ddit.management.airService.customerManagement.mapper;

import java.util.List;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.customer.reserve.parking.vo.ParkingVO;
import kr.or.ddit.customer.reserve.rounge.vo.RoungeVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface ParkingReserveMapper {

	public int count(PaginationVO<ParkingVO> pagingVO);

	public List<ParkingVO> list(PaginationVO<ParkingVO> pagingVO);

	public void status(ParkingVO parkingVO);

	public ParkingVO count1();

	public List<ParkingVO> selectParkingReserveList();

	public int selectAllRounge();

	public int selectTodayRounge();

	public int selectNewRoungeList();

	public int selectCancelRoungeList();

	public List<Integer> preReserNum();

	public List<Integer> thisReserNum();

}
