package kr.or.ddit.management.partner.partner.service;

import java.util.List;

import kr.or.ddit.partner.common.qna.vo.PartnerQnaVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IPartnerManagementService {
	public List<PartnerQnaVO> qnaList(PaginationVO<PartnerQnaVO> pagingVO);
	public int qnaCount(PaginationVO<PartnerQnaVO> pagingVO);

}
