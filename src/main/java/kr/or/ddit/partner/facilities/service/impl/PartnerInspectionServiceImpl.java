package kr.or.ddit.partner.facilities.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.partner.facilities.mapper.PartnerInspectionMapper;
import kr.or.ddit.partner.facilities.service.IPartnerInspectionService;
import kr.or.ddit.partner.facilities.vo.PartnerInspectionVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;

@Service
public class PartnerInspectionServiceImpl implements IPartnerInspectionService{

	@Inject
	private PartnerInspectionMapper mapper;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;
		
	@Override
	public int reportRegister(PartnerInspectionVO inspectionVO) {
		
		int result = mapper.reportRegister(inspectionVO);
		
		if(result > 0) { // 등록 성공
			result = 1;
	    } else { // 등록 실패
	        result = 0;
	    }
	    return result;
	}
	
	
	@Override
	public List<PartnerInspectionVO> reportList(PaginationVO<PartnerInspectionVO> pagingVO) {
		return mapper.reportList(pagingVO);
	}
	
	@Override
	public List<PartnerInspectionVO> reportList2(PaginationVO<PartnerInspectionVO> pagingVO) {
		return mapper.reportList2(pagingVO);
	}
	
	@Override
	public int reportCount(PaginationVO<PartnerInspectionVO> pagingVO) {
		return mapper.reportCount(pagingVO);
	}
	
	@Override
	public int reportCount2(PaginationVO<PartnerInspectionVO> pagingVO) {
		return mapper.reportCount2(pagingVO);
	}

	@Override
	public PartnerInspectionVO reportDetail(PartnerInspectionVO inspectionVO) {
		String fileOwner = "08"+ inspectionVO.getInNo();
		inspectionVO.setFileOwner(fileOwner);
		return mapper.reportDetail(inspectionVO);
	}

	@Override
	public int scheduleRegister(PartnerInspectionVO inspectionVO) {
		
		int result = mapper.scheduleRegister(inspectionVO);
		
		if(result > 0) { // 등록 성공
			result = 1;
	    } else { // 등록 실패
	        result = 0;
	    }
	    return result;
	}


	@Override
	public List<PartnerInspectionVO> scheduleList(PaginationVO<PartnerInspectionVO> pagingVO) {
		return mapper.scheduleList(pagingVO);
	}


	@Override
	public List<PartnerInspectionVO> scheduleList2(PaginationVO<PartnerInspectionVO> pagingVO) {
		return mapper.scheduleList2(pagingVO);
	}


	@Override
	public int scheduleCheck(int inNo) {
		return mapper.scheduleCheck(inNo);
	}


	@Override
	public List<PartnerInspectionVO> scheduleList3() {
		return mapper.scheduleList3();
	}


	@Override
	public PartnerInspectionVO count() {
		return mapper.count();
	}


	@Override
	public PartnerInspectionVO count2(int ptNo) {
		return mapper.count2(ptNo);
	}


	@Override
	public int scheduleCount(PaginationVO<PartnerInspectionVO> pagingVO) {
		return mapper.scheduleCount(pagingVO);
	}


	@Override
	public int scheduleCount2(PaginationVO<PartnerInspectionVO> pagingVO) {
		return mapper.scheduleCount2(pagingVO);
	}


}