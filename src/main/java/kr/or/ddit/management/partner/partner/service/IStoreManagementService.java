package kr.or.ddit.management.partner.partner.service;

import java.util.List;

import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IStoreManagementService {

	public int selectStoreCount(PaginationVO<PartnerVO> pagingVO);

	public List<PartnerVO> selectStoreList(PaginationVO<PartnerVO> pagingVO);

	public PartnerVO selectStore(int ptNo);

	public int insertStore(PartnerVO storeVO);

}
