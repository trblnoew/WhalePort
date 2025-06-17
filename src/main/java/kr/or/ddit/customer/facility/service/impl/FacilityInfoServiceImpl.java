package kr.or.ddit.customer.facility.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.facility.mapper.IFacilityInfoMapper;
import kr.or.ddit.customer.facility.service.IFacilityInfoService;
import kr.or.ddit.partner.common.account.vo.PartnerVO;

@Service
public class FacilityInfoServiceImpl implements IFacilityInfoService {

	@Inject
	private IFacilityInfoMapper facilityMapper;
	
	@Override
	public List<PartnerVO> selectGuideList() {
		return facilityMapper.selectGuideList();
	}

	@Override
	public List<PartnerVO> selectRestaurantList() {
		return facilityMapper.selectRestaurantList();
	}

	@Override
	public List<PartnerVO> selectShoppingList() {
		return facilityMapper.selectShoppingList();
	}

}
