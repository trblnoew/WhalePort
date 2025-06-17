package kr.or.ddit.partner.common.qna.mapper;

import java.util.List;

import kr.or.ddit.partner.common.qna.vo.PartnerFaqVO;
import kr.or.ddit.partner.common.qna.vo.PartnerQnaVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface PartnerQnaMapper {
	public int register(PartnerQnaVO partnerQnaVO);
	public List<PartnerQnaVO> list();
	public PartnerQnaVO detail(PartnerQnaVO partnerQnaVO);
	public int update(PartnerQnaVO partnerQnaVO);
	public int delete(int qnaNo);
	public int qnaCount(PaginationVO<PartnerQnaVO> pagingVO);
	public List<PartnerQnaVO> qnaList(PaginationVO<PartnerQnaVO> pagingVO);
	public List<PartnerQnaVO> qnaList2(PaginationVO<PartnerQnaVO> pagingVO);
	public void registerFile(FileVO qnaFileVO);
	public void insertQnaFile(FileVO fileVO);
	public FileVO selectQnaFile(Integer integer);
	public void deleteQnaFile(Integer integer);
	public FileVO qnaDownload(int fileNo);
	public void incrementQnaFileDown(int fileNo);
	public int answer(PartnerQnaVO partnerQnaVO);
	public List<PartnerFaqVO> faqList();
	public int faqRegister(PartnerFaqVO partnerFaqVO);
	public int faqDelete(int faqNo);
	public int faqUpdate(PartnerFaqVO partnerFaqVO);
	public PartnerQnaVO detail2(PartnerQnaVO partnerQnaVO);
}
