package kr.or.ddit.customer.reserve.rounge.mapper;

import java.util.List;

import kr.or.ddit.customer.reserve.rounge.vo.RoungeVO;


public interface RoungeMapper {

	public List<RoungeVO> list();

	public RoungeVO detail(int rgNo);

	public void register(RoungeVO roungeVO);


}
