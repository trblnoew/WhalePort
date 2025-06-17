package kr.or.ddit.customer.reserve.rounge.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.reserve.rounge.mapper.RoungeMapper;
import kr.or.ddit.customer.reserve.rounge.service.IRoungeService;
import kr.or.ddit.customer.reserve.rounge.vo.RoungeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RoungeServiceImpl implements IRoungeService{

	@Inject
	private RoungeMapper mapper;
	
	@Override
	public List<RoungeVO> list() {
		log.info("# RoungeServiceImpl list");
		return mapper.list();
	}

	@Override
	public RoungeVO detail(int rgNo) {
		log.info("# RoungeServiceImpl detail");
		return mapper.detail(rgNo);
	}

	@Override
	public void register(RoungeVO roungeVO) {
		log.info("# RoungeServiceImpl register");
		mapper.register(roungeVO);
	}

	

	


}
