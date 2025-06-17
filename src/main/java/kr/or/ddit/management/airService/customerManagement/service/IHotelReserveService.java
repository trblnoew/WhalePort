package kr.or.ddit.management.airService.customerManagement.service;

import java.util.List;

import kr.or.ddit.customer.reserve.hotel.vo.HotelVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IHotelReserveService {

	public int count(PaginationVO<HotelVO> pagingVO);

	public List<HotelVO> list(PaginationVO<HotelVO> pagingVO);

	public HotelVO detail(int hrNo);

	public void update(HotelVO hotelVO);

	public void status(HotelVO hotelVO);

	public HotelVO count1();

	public List<HotelVO> selectHotelReserveList();

	public int selectAllHotel();

	public int selectTodayHotel();

	public int selectNewHotelList();

	public int selectCancelHotelList();

	public List<Integer> preReserNum();

	public List<Integer> thisReserNum();


}
