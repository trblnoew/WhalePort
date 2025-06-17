package kr.or.ddit.partner.facilities.web;

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
@RequestMapping("/partner/facilities")
public class PartnerFacilitiesController {
	
	@Inject
	private IPartnerInspectionService service;
	
	@Inject
	private IPartnerAccountService service2;
	

	
	@GetMapping("/reportRegister")
	public String reportRegisterForm(PartnerInspectionVO inspectionVO, HttpServletRequest req, Model model) {
		
		log.info("reportRegisterForm() 실행...!");
		
		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
		
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		PartnerVO partnerVO = (PartnerVO) session.getAttribute("SessionInfo");
		
		List<PartnerInspectionVO> inspectionVO2 = service.scheduleList3();
		
		model.addAttribute("inspectionVO", inspectionVO2);
		model.addAttribute("ptNo", partnerVO.getPtNo());
		
		return "partner/facilities/reportRegister";
	}
	
	@PostMapping("/reportRegister")
	public String reportRegister(PartnerInspectionVO inspectionVO, Model model, RedirectAttributes ra) {
		
		log.info("reportRegister() 실행...!");
		
		String goPage = "";
		
		int result = service.reportRegister(inspectionVO);
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "등록 완료");
			ra.addFlashAttribute("message", "등록이 완료되었습니다!");
			goPage = "redirect:/partner/facilities/reportDetail?inNo=" + inspectionVO.getInNo();
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			goPage = "partner/facilities/reportRegister";
		}
		return goPage;
	}
	
	@GetMapping("/reportList")
	public String reportList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			HttpServletRequest req, Model model
			) {
		log.info("reportList() 실행...!");
		
		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
		
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		PartnerVO partnerVO = (PartnerVO) session.getAttribute("SessionInfo");
		
		PaginationVO<PartnerInspectionVO> pagingVO = new PaginationVO<PartnerInspectionVO>(10,5);
		pagingVO.setPtNo(partnerVO.getPtNo());
		
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
		int totalRecord = service.reportCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<PartnerInspectionVO> dataList = service.reportList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("partnerVO", partnerVO);	
		return "partner/facilities/reportList"; 
	}

	@GetMapping("/reportDetail")
	public String reportDetail(PartnerInspectionVO inspectionVO, Model model) {
		log.info("reportDetail() 실행...!");
		PartnerInspectionVO inspectionVO2 = service.reportDetail(inspectionVO);
		model.addAttribute("inspectionVO", inspectionVO2);
		return "partner/facilities/reportDetail";
	}
	
	
	@GetMapping("/scheduleList")
	public String scheduleList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			HttpServletRequest req, Model model
			) {
		
		log.info("scheduleList()...실행!");

		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
		
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		PartnerVO partnerVO3 = (PartnerVO) session.getAttribute("SessionInfo");
		
		PaginationVO<PartnerInspectionVO> pagingVO = new PaginationVO<PartnerInspectionVO>(10,5);
		pagingVO.setPtNo(partnerVO3.getPtNo());
		
		PartnerInspectionVO countVO = service.count2(partnerVO3.getPtNo());
		
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
		int totalRecord = service.scheduleCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<PartnerInspectionVO> dataList = service.scheduleList(pagingVO);
		pagingVO.setDataList(dataList);
		
		List<PartnerVO> partnerVO2 = service2.list2();
		
		
		model.addAttribute("countVO", countVO);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("partnerVO2", partnerVO2);
		model.addAttribute("partnerVO", partnerVO3);
		
		return "partner/facilities/scheduleList";
	}
	
	@PostMapping("/scheduleCheck")
	public String scheduleCheck(@RequestParam(value = "inNos") List<Integer> inNos, 
	                       Model model, 
	                       RedirectAttributes ra) {
	    log.info("scheduleCheck() 실행...!");

	    String goPage = "";

	    if (inNos == null || inNos.isEmpty()) {
	        model.addAttribute("msg", "오류");
	        model.addAttribute("message", "처리할 항목이 없습니다.");
	        return "redirect:/partner/facilities/scheduleList";
	    }

	    // 각 QNA 번호에 대해 블라인드 처리
	    for (Integer inNo : inNos) {
	        int result = service.scheduleCheck(inNo);
	        if (result <= 0) {
	            model.addAttribute("msg", "오류");
	            model.addAttribute("message", "서버에러, 다시 시도해주세요!");
	            break;
	        }
	    }

	    ra.addFlashAttribute("msg", "접수 처리 완료");
	    ra.addFlashAttribute("message", "접수 처리가 완료되었습니다!");
	    goPage = "redirect:/partner/facilities/scheduleList";

	    return goPage;
	}
	
}


