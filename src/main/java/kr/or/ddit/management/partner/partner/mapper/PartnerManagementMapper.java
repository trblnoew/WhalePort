package kr.or.ddit.management.partner.partner.mapper;

import java.util.List;

import kr.or.ddit.partner.common.qna.vo.PartnerQnaVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface PartnerManagementMapper {
	List<PartnerQnaVO> qnaList(PaginationVO<PartnerQnaVO> pagingVO);
	int qnaCount(PaginationVO<PartnerQnaVO> pagingVO);

}
