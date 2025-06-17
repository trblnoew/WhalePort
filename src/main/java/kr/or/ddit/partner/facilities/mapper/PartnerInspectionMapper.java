package kr.or.ddit.partner.facilities.mapper;

import java.util.List;

import kr.or.ddit.partner.facilities.vo.PartnerInspectionVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface PartnerInspectionMapper {
	public int reportRegister(PartnerInspectionVO inspectionVO);
	public void insertReportFile(FileVO fileVO);
	public List<PartnerInspectionVO> reportList(PaginationVO<PartnerInspectionVO> pagingVO);
	public List<PartnerInspectionVO> reportList2(PaginationVO<PartnerInspectionVO> pagingVO);
	public int reportCount(PaginationVO<PartnerInspectionVO> pagingVO);
	public int reportCount2(PaginationVO<PartnerInspectionVO> pagingVO);
	public PartnerInspectionVO reportDetail(PartnerInspectionVO inspectionVO);
	public int scheduleRegister(PartnerInspectionVO inspectionVO);
	public List<PartnerInspectionVO> scheduleList(PaginationVO<PartnerInspectionVO> pagingVO);
	public List<PartnerInspectionVO> scheduleList2(PaginationVO<PartnerInspectionVO> pagingVO);
	public int scheduleCheck(int inNo);
	public List<PartnerInspectionVO> scheduleList3();
	public PartnerInspectionVO count();
	public PartnerInspectionVO count2();
	public PartnerInspectionVO count2(int ptNo);
	public int scheduleCount(PaginationVO<PartnerInspectionVO> pagingVO);
	public int scheduleCount2(PaginationVO<PartnerInspectionVO> pagingVO);
}
