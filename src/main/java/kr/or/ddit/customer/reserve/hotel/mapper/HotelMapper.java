package kr.or.ddit.customer.reserve.hotel.mapper;

import java.util.List;

import kr.or.ddit.customer.reserve.hotel.vo.HotelVO;


public interface HotelMapper {

	public List<HotelVO> list();

	public void register(HotelVO hotelVO);

	public HotelVO select(int htNo);

	public int check(HotelVO hotelVO);

}
