package kr.or.ddit.partner.common.qna.service;

import java.util.List;

import kr.or.ddit.partner.common.qna.vo.PartnerFaqVO;
import kr.or.ddit.partner.common.qna.vo.PartnerQnaVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;


public interface IPartnerQnaService {
	public int register(PartnerQnaVO partnerQnaVO);
	public PartnerQnaVO detail(PartnerQnaVO partnerQnaVO);
	public PartnerQnaVO detail2(PartnerQnaVO partnerQnaVO);
	public int update(PartnerQnaVO partnerQnaVO);
	public int delete(int qnaNo);
	public int qnaCount(PaginationVO<PartnerQnaVO> pagingVO);
	public List<PartnerQnaVO> qnaList(PaginationVO<PartnerQnaVO> pagingVO);
	public List<PartnerQnaVO> qnaList2(PaginationVO<PartnerQnaVO> pagingVO);
	public FileVO qnaDownload(int fileNo);
	public int answer(PartnerQnaVO partnerQnaVO);
	public List<PartnerFaqVO> faqList();
	public int register(PartnerFaqVO partnerFaqVO);
	public int faqDelete(int faqNo);
	public int faqUpdate(PartnerFaqVO partnerFaqVO);
}
