package kr.or.ddit.customer.facility.mapper;

import java.util.List;

import kr.or.ddit.partner.common.account.vo.PartnerVO;

public interface IFacilityInfoMapper {

	public List<PartnerVO> selectGuideList();

	public List<PartnerVO> selectRestaurantList();

	public List<PartnerVO> selectShoppingList();

}
