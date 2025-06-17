package kr.or.ddit.customer.map.mapper;

import java.util.List;

import kr.or.ddit.customer.map.vo.PartnerVO;
import kr.or.ddit.customer.map.vo.PointVO;

public interface IMapMapper {

	public List<PartnerVO> partnerList();

	public List<PointVO> pointList();

	public void countUp(String ptNo);

}
