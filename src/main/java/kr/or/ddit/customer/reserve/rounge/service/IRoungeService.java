package kr.or.ddit.customer.reserve.rounge.service;

import java.util.List;

import kr.or.ddit.customer.reserve.rounge.vo.RoungeVO;


public interface IRoungeService {

	public List<RoungeVO> list();

	public RoungeVO detail(int rgNo);

	public void register(RoungeVO roungeVO);

}
