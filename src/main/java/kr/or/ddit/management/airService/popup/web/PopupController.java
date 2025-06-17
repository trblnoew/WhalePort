package kr.or.ddit.management.airService.popup.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.management.airService.popup.service.IPopupService;
import kr.or.ddit.management.airService.popup.vo.PopupVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/popup")
public class PopupController {
	
	@Inject
	private IPopupService popupService;
	
	@RequestMapping("/up")
	public String popUp(HttpServletRequest request , HttpServletResponse response, Model model ) throws Exception {	
		log.info("popUp()...실행!");
		PopupVO popupVO = popupService.selectPopupPosting();
		String popImg = popupVO.getPopImg();
		model.addAttribute("popImg", popImg);
		return "popup/popup";
	}
	


	// crud 시작
	@GetMapping("/list")
	public String popupList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model
			) {
		
		log.info("popupList() 실행...!");
		
		PaginationVO<PopupVO> pagingVO = new PaginationVO<PopupVO>(10,5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			pagingVO.setSearchType(searchType);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("searchType", searchType);
		}
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = popupService.selectPopupCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<PopupVO> dataList = popupService.selectPopupList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("popupActive", "active");
		model.addAttribute("cusManaActive", "active");
		model.addAttribute("totalCnt", totalRecord);


		
		return "management/popup/popList";
	}
	
	
	
	
	@GetMapping("/register")
	public String popupRegisterForm(Model model) {
		log.info("popupRegisterForm() 실행...!");
		model.addAttribute("popupActive", "active");
		model.addAttribute("cusManaActive", "active");
		return "management/popup/popupForm";
	}

	//무조건 게시중 선택하기
	@PostMapping("/register")
	public String popupRegister(
			RedirectAttributes ra,
			PopupVO eventVO, Model model
			) {
		log.info("popupRegister() 실행...!");
		String goPage="";
		popupService.endPopup();
		log.info("endPopup() 실행...!");
		int result = popupService.insert(eventVO);
		if(result >0) {
			ra.addFlashAttribute("msg", "등록 완료");
			ra.addFlashAttribute("message", "등록을 완료하였습니다.");
			goPage = "redirect:/management/popup/list";
		}else {
			goPage = "management/popup/popupForm";
		}
		
		return goPage;
	}
	
	@GetMapping("/detail")
	public String popupDetail(int popNo, Model model) {
		log.info("popupDetail() 실행...!");
		PopupVO eventVO = popupService.selectPopup(popNo);
		model.addAttribute("eventVO", eventVO);
		model.addAttribute("popupActive", "active");
		model.addAttribute("cusManaActive", "active");
		return "management/popup/popupDetail";
	}
	
	//게시 종료할때 수정하는 경우가 대부분
	@GetMapping("/update")
	public String popupUpdateForm(int popNo, Model model) {
		log.info("popupUpdateForm() 실행...!");
		PopupVO eventVO = popupService.selectPopup(popNo);
		model.addAttribute("eventVO", eventVO);
		model.addAttribute("status", "u");
		return "management/popup/popupForm";
	}
	
	
	@PostMapping("/update")
	public String popupUpdate(
			RedirectAttributes ra,
			PopupVO eventVO, Model model
			) {
		log.info("popupUpdate() 실행...!");
		String goPage="";
		int result = popupService.update(eventVO);
		if(result >0) {
			ra.addFlashAttribute("msg", "수정 완료");
			ra.addFlashAttribute("message", "수정을 완료하였습니다.");
			goPage = "redirect:/management/popup/list";
		}else {
			model.addAttribute("eventVO", eventVO);
			model.addAttribute("status", "u");
			goPage = "management/popup/popupForm";
		}
		
		return goPage;
	}
	
	@PostMapping("/delete")
	public String popupDelete(
			RedirectAttributes ra,
			int popNo, Model model
			) {
		log.info("popupDelete() 실행...!");
		String goPage="";
		int result = popupService.delete(popNo);
		if(result >0) {
			ra.addFlashAttribute("msg", "삭제 완료");
			ra.addFlashAttribute("message", "삭제 완료하였습니다");
			goPage = "redirect:/management/popup/list";
		}else {
			ra.addFlashAttribute("msg", "오류");
			ra.addFlashAttribute("message", "서버 에러, 다시 시도해주세요!");
			goPage = "redirect:/management/popup/detail?popNo="+popNo;
		}
		
		return goPage;
	}	
	
	
	@ResponseBody
	@PostMapping("/reject")
	public ResponseEntity<String> rejectUpate(PopupVO popupVO) {
		log.info("rejectUpate()실행...!");
		int result = popupService.rejectUpate(popupVO);
		ResponseEntity<String> entity = null;
		if(result > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			
		}
		return entity;
		
	}
	
	@GetMapping("/updateApproval")
	public String updateApproval(
			RedirectAttributes ra,
			int popNo, Model model
			) {
		log.info("updateApproval() 실행...!");
		String goPage="";
		popupService.endPopup();
		int result = popupService.updateApproval(popNo);
		if(result >0) {
			ra.addFlashAttribute("msg", "승인 완료");
			ra.addFlashAttribute("message", "승인 완료하였습니다");
			goPage = "redirect:/management/popup/list";
		}else {
			ra.addFlashAttribute("msg", "오류");
			ra.addFlashAttribute("message", "서버에러, 다시 시도해주세요!");
			goPage = "redirect:/management/popup/detail?popNo="+popNo;
		}
		
		return goPage;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}





