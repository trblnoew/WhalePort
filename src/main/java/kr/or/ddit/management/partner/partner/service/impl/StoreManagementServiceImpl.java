package kr.or.ddit.management.partner.partner.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.management.partner.partner.mapper.IStoreManagementMapper;
import kr.or.ddit.management.partner.partner.service.IStoreManagementService;
import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.util.vo.PaginationVO;

@Service
public class StoreManagementServiceImpl implements IStoreManagementService {

	@Inject
	private IStoreManagementMapper storeMapper;
	
	@Override
	public int selectStoreCount(PaginationVO<PartnerVO> pagingVO) {
		return storeMapper.selectStoreCount(pagingVO);
	}

	@Override
	public List<PartnerVO> selectStoreList(PaginationVO<PartnerVO> pagingVO) {
		return storeMapper.selectStoreList(pagingVO);
	}

	@Override
	public PartnerVO selectStore(int ptNo) {
		return storeMapper.selectStore(ptNo);
	}

	@Override
	public int insertStore(PartnerVO storeVO) {
		return storeMapper.insertStore(storeVO);
	}

}
