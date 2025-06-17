package kr.or.ddit.management.partner.facilities.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.partner.common.account.service.IPartnerAccountService;
import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.partner.facilities.service.IPartnerInspectionService;
import kr.or.ddit.partner.facilities.vo.PartnerInspectionVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/facility")
public class FacilityController {
	
	@Inject
	private IPartnerInspectionService service;
	
	@Inject
	private IPartnerAccountService service2;
	
	@GetMapping("/reportList")
	public String facilityReportList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			) {
		
		log.info("facilityReportList() 실행...!");
		
		PaginationVO<PartnerInspectionVO> pagingVO = new PaginationVO<PartnerInspectionVO>(10,5);
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			pagingVO.setSearchType(searchType);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("searchType", searchType);
		}
		
		// startRow, endRow, startPage, endPage를 결정한다.
		pagingVO.setCurrentPage(currentPage);
		// 총 게시글 수를 이용하여 총 페이지수를 결정하기 위해 총 게시글 수인 totalRecord를 얻어온다.
		int totalRecord = service.reportCount2(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<PartnerInspectionVO> dataList = service.reportList2(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("partnerActive", "active");
		model.addAttribute("facilitytActive", "active");
		model.addAttribute("facilityReportActive", "active");
		return "management/partner/facilityReportList";
	}
	
	@GetMapping("/reportDetail")
	public String reportDetail(PartnerInspectionVO inspectionVO, Model model) {
		log.info("reportDetail() 실행...!");
		PartnerInspectionVO inspectionVO2 = service.reportDetail(inspectionVO);
		model.addAttribute("inspectionVO", inspectionVO2);
		model.addAttribute("partnerActive", "active");
		model.addAttribute("facilitytActive", "active");
		model.addAttribute("facilityReportActive", "active");
		return "management/partner/facilityReportDetail";
	}
	
	@GetMapping("/scheduleList")
	public String facilityScheduleList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			PartnerVO partnerVO, Model model
			) {
		
		log.info("facilityScheduleList()...실행!");
		
		PaginationVO<PartnerInspectionVO> pagingVO = new PaginationVO<PartnerInspectionVO>(10,5);
		
		PartnerInspectionVO countVO = service.count();
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			pagingVO.setSearchType(searchType);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("searchType", searchType);
		}
		
        // 상태 필터링 추가
        if (StringUtils.isNotBlank(selectedItem)) {
            pagingVO.setSelectedItem(selectedItem);
            model.addAttribute("selectedItem", selectedItem);
        }
		
		// startRow, endRow, startPage, endPage를 결정한다.
		pagingVO.setCurrentPage(currentPage);
		// 총 게시글 수를 이용하여 총 페이지수를 결정하기 위해 총 게시글 수인 totalRecord를 얻어온다.
		int totalRecord = service.scheduleCount2(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<PartnerInspectionVO> dataList = service.scheduleList2(pagingVO);
		pagingVO.setDataList(dataList);
		
		List<PartnerVO> partnerVO2 = service2.list2();
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("partnerVO2", partnerVO2);
		model.addAttribute("countVO", countVO);
		model.addAttribute("partnerActive", "active");
		model.addAttribute("facilitytActive", "active");
		model.addAttribute("facilityScheduleActive", "active");
		return "management/partner/facilityScheduleList";
	}
	
	@GetMapping("/scheduleRegister")
	public String scheduleRegisterForm(HttpServletRequest req, Model model) {
		log.info("scheduleRegisterForm() 실행...!");
		return "management/partner/facilityScheduleRegister";
	}
	
	@PostMapping("/scheduleRegister")
	public String scheduleRegister(PartnerInspectionVO inspectionVO, Model model, RedirectAttributes ra) {
		
		log.info("scheduleRegister() 실행...!");
		
		String goPage = "";
		
		int result = service.scheduleRegister(inspectionVO);
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "등록 완료");
			ra.addFlashAttribute("message", "등록이 완료되었습니다!");
			goPage = "redirect:/management/facility/scheduleList";
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			goPage = "management/partner/facilityScheduleRegister";
		}
		return goPage;
	}

}
