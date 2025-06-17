package kr.or.ddit.partner.common.account.service;

import java.util.List;

import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IPartnerAccountService {
	
	public int register(PartnerVO partnerVO);
	public int accountCount(PaginationVO<PartnerVO> pagingVO);
	public List<PartnerVO> list(PaginationVO<PartnerVO> pagingVO);
	public PartnerVO detail(PartnerVO partnerVO);
	public int update(PartnerVO partnerVO);
	public void approve(PartnerVO partnerVO);
	public PartnerVO count();
	public void idIssue(PartnerVO partnerVO);
	public FileVO ptDownload(int fileNo);
	public PartnerVO partnerLogin(PartnerVO partner);
	public PartnerVO pieChart();
	public List<Integer> thisBarChart();
	public List<Integer> preBarChart();
	public List<PartnerVO> list2();
}
