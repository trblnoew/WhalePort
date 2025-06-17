package kr.or.ddit.customer.facility.service;

import java.util.List;

import kr.or.ddit.partner.common.account.vo.PartnerVO;

public interface IFacilityInfoService {

	public List<PartnerVO> selectGuideList();

	public List<PartnerVO> selectRestaurantList();

	public List<PartnerVO> selectShoppingList();


}
