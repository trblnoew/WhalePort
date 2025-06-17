package kr.or.ddit.customer.map.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.map.mapper.IMapMapper;
import kr.or.ddit.customer.map.service.IMapService;
import kr.or.ddit.customer.map.vo.PartnerVO;
import kr.or.ddit.customer.map.vo.PointVO;

@Service
public class MapServiceImpl implements IMapService {
	
	@Inject
	private IMapMapper mapper;

	@Override
	public List<PartnerVO> partnerList() {
		return mapper.partnerList();
	}

	@Override
	public List<PointVO> pointList() {
		return mapper.pointList();
	}

	@Override
	public void countUp(String ptNo) {
		mapper.countUp(ptNo);
	}
	

}
