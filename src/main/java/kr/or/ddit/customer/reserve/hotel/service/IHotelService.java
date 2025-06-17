package kr.or.ddit.customer.reserve.hotel.service;

import java.util.List;

import kr.or.ddit.customer.reserve.hotel.vo.HotelVO;


public interface IHotelService {

	public List<HotelVO> list();

	public void register(HotelVO hotelVO);

	public HotelVO select(int htNo);

	public int check(HotelVO hotelVO);

}
