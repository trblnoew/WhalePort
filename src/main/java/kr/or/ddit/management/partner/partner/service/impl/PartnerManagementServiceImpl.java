package kr.or.ddit.management.partner.partner.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.management.partner.partner.mapper.PartnerManagementMapper;
import kr.or.ddit.management.partner.partner.service.IPartnerManagementService;
import kr.or.ddit.partner.common.qna.vo.PartnerQnaVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PartnerManagementServiceImpl implements IPartnerManagementService {

	@Inject
	private PartnerManagementMapper mapper;

	@Override
	public List<PartnerQnaVO> qnaList(PaginationVO<PartnerQnaVO> pagingVO) {
		log.info("# PartnerManagementServiceImpl qnaList");
		return mapper.qnaList(pagingVO);
	}

	@Override
	public int qnaCount(PaginationVO<PartnerQnaVO> pagingVO) {
		log.info("# PartnerManagementServiceImpl qnaCount");
		return mapper.qnaCount(pagingVO);
	}

}
