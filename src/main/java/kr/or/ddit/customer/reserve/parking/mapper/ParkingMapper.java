package kr.or.ddit.customer.reserve.parking.mapper;

import java.util.List;

import kr.or.ddit.customer.reserve.parking.vo.ParkingVO;


public interface ParkingMapper {

	public List<ParkingVO> list();

	public ParkingVO select(int plNo);

	public void register(ParkingVO parkingVO);

	public int check(ParkingVO parkingVO);

}
