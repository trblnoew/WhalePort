package kr.or.ddit.management.partner.partner.web;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.management.partner.partner.service.IStoreManagementService;
import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/partner/store")
public class StoreManagementController {
	
	@Inject
	private IStoreManagementService storeService;
	
	@GetMapping("/list")
	public String storeList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchWord, Model model
			) {
		log.info("storeList() 실행...!");
		
		PaginationVO<PartnerVO> pagingVO = new PaginationVO<PartnerVO>(10,5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = storeService.selectStoreCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<PartnerVO> dataList = storeService.selectStoreList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("totalCnt", totalRecord);
		model.addAttribute("partnerActive", "active");
		model.addAttribute("storeActive", "active");
		model.addAttribute("storListActive", "active");
		return "management/partner/store/storeList";
		
		
	}
	
	
	@GetMapping("/detail")
	public String storeDetail(int ptNo, Model model) {
		log.info("storeDetail()실행...!");
		PartnerVO storeVO = storeService.selectStore(ptNo);
		model.addAttribute("storeVO", storeVO);
		model.addAttribute("partnerActive", "active");
		model.addAttribute("storeActive", "active");
		model.addAttribute("storListActive", "active");
		return "management/partner/store/storeDetail";
	}

	// 말이 등록이지 없는 정보 넣어주는거라 업데이트이다
	@PostMapping("/register")
	public String storeRegister(PartnerVO storeVO, Model model, RedirectAttributes ra) {
		log.info("storeRegister()실행...!");
		String goPage = "";
		int result = storeService.insertStore(storeVO);
		if(result > 0) {
			ra.addFlashAttribute("msg", "등록 완료");
			ra.addFlashAttribute("message", "등록을 완료하였습니다");
			goPage="redirect:/management/partner/store/detail?ptNo="+storeVO.getPtNo();
		}else {
			model.addAttribute("storeVO", storeVO);
			goPage = "management/partner/store/storeDetail";
		}
		return goPage;
	}
	
	
	
	@PostMapping("/update")
	public String storeUpdate(PartnerVO storeVO, Model model, RedirectAttributes ra) {
		log.info("storeUpdate()실행...!");
		String goPage = "";
		int result = storeService.insertStore(storeVO);
		if(result > 0) {
			ra.addFlashAttribute("msg", "수정 완료");
			ra.addFlashAttribute("message", "수정을 완료하였습니다");
			goPage="redirect:/management/partner/store/detail?ptNo="+storeVO.getPtNo();
		}else {
			model.addAttribute("storeVO", storeVO);
			goPage = "management/partner/store/storeDetail";
		}
		return goPage;
	}
	
	
	

}
