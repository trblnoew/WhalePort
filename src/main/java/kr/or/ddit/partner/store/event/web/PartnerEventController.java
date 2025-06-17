package kr.or.ddit.partner.store.event.web;

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

import kr.or.ddit.management.airService.popup.vo.PopupVO;
import kr.or.ddit.partner.store.event.service.IPartnerEventService;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner/event")
public class PartnerEventController {
	
	@Inject
	private IPartnerEventService eventService;

	@GetMapping("/list")
	public String eventList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model
			) {
		
		log.info("eventList() 실행...!");
		
		PaginationVO<PopupVO> pagingVO = new PaginationVO<PopupVO>(10,5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			pagingVO.setSearchType(searchType);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("searchType", searchType);
		}
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = eventService.selectStoreEventCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<PopupVO> dataList = eventService.selectStoreEventList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "partner/event/eventList";
	}
	
	@GetMapping("/register")
	public String eventRegisterForm() {
		log.info("eventRegisterForm() 실행...!");
		return "partner/event/eventForm";
	}
	
	// pt_no=5 일단 하드코딩, POP_APPROVAL="신청"
	@PostMapping("/register")
	public String eventRegister(
			RedirectAttributes ra,
			PopupVO eventVO, Model model
			) {
		log.info("eventRegister() 실행...!");
		String goPage="";
		int result = eventService.insert(eventVO);
		if(result >0) {
			ra.addFlashAttribute("msg", "등록 완료");
			ra.addFlashAttribute("message", "등록을 완료하였습니다");
			goPage = "redirect:/partner/event/list";
		}else {
			goPage = "partner/event/eventForm";
		}
		
		return goPage;
	}
	
	@GetMapping("/detail")
	public String eventDetail(int popNo, Model model) {
		log.info("eventDetail() 실행...!");
		PopupVO eventVO = eventService.selectStoreEvent(popNo);
		model.addAttribute("eventVO", eventVO);
		return "partner/event/eventDetail";
	}
	
	@GetMapping("/update")
	public String eventUpdateForm(int popNo, Model model) {
		log.info("eventUpdateForm() 실행...!");
		PopupVO eventVO = eventService.selectStoreEvent(popNo);
		model.addAttribute("eventVO", eventVO);
		model.addAttribute("status", "u");
		return "partner/event/eventForm";
	}
	
	// pt_no=5 일단 하드코딩, POP_APPROVAL="신청"
	@PostMapping("/update")
	public String eventUpdate(
			RedirectAttributes ra,
			PopupVO eventVO, Model model
			) {
		log.info("eventUpdate() 실행...!");
		String goPage="";
		int result = eventService.update(eventVO);
		if(result >0) {
			ra.addFlashAttribute("msg", "수정 완료");
			ra.addFlashAttribute("message", "수정을 완료하였습니다");
			goPage = "redirect:/partner/event/list";
		}else {
			model.addAttribute("eventVO", eventVO);
			model.addAttribute("status", "u");
			goPage = "partner/event/eventForm";
		}
		
		return goPage;
	}
	
	@PostMapping("/delete")
	public String eventDelete(
			RedirectAttributes ra,
			int popNo, Model model
			) {
		log.info("eventDelete() 실행...!");
		String goPage="";
		int result = eventService.delete(popNo);
		if(result >0) {
			ra.addFlashAttribute("msg", "삭제 완료");
			ra.addFlashAttribute("message", "삭제 완료하였습니다");
			goPage = "redirect:/partner/event/list";
		}else {
			ra.addFlashAttribute("msg", "오류");
			ra.addFlashAttribute("message", "서버 에버, 다시 시도해주세요!");
			goPage = "redirect:/partner/event/detail?popNo="+popNo;
		}
		
		return goPage;
	}
	
	
	
	
	
	
	
	
	
	
	

}










