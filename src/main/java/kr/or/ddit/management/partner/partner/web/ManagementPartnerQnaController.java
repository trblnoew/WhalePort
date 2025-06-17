package kr.or.ddit.management.partner.partner.web;

import java.util.List;
import javax.inject.Inject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.or.ddit.partner.common.qna.service.IPartnerQnaService;
import kr.or.ddit.partner.common.qna.vo.PartnerFaqVO;
import kr.or.ddit.partner.common.qna.vo.PartnerQnaVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/partner")
public class ManagementPartnerQnaController {
	
	@Autowired
	JavaMailSenderImpl mailSender;
	
	@Inject
	private IPartnerQnaService service;
	
	// 협력업체 문의사항 리스트 조회
	@GetMapping("/qna/qnaList")
	public String qnaList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			Model model
			) {
		log.info("qnaList() 실행...!");

		PaginationVO<PartnerQnaVO> pagingVO = new PaginationVO<PartnerQnaVO>(10,5);
		
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
		int totalRecord = service.qnaCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<PartnerQnaVO> dataList = service.qnaList2(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("partnerQnaActive", "active");
		model.addAttribute("pagingVO", pagingVO);
		return "management/partner/qnaList";
	}
	
	// 협력업체 문의사항 리스트 상세 조회
	@GetMapping("/qna/qnaDetail")
	public String qnaDetail(PartnerQnaVO partnerQnaVO, Model model) {
		log.info("qnaDetail() 실행...!");
		PartnerQnaVO partnerQnaVO2 = service.detail2(partnerQnaVO);
		model.addAttribute("partnerQnaActive", "active");
		model.addAttribute("partnerQnaVO", partnerQnaVO2);
		return "management/partner/qnaDetail";
	}
	
	@PostMapping("/qna/qnaAnswer")
	public String qnaAnswer(PartnerQnaVO partnerQnaVO, Model model, RedirectAttributes ra) {
		log.info("qnaAnswer() 실행...!");
		
		String goPage = "";
		
		int result = service.answer(partnerQnaVO);
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "답변 완료");
			ra.addFlashAttribute("message", "답변이 완료되었습니다!");
			goPage = "redirect:/management/partner/qna/qnaDetail?qnaNo=" + partnerQnaVO.getQnaNo();
		}else {
			model.addAttribute("msg", "오류");
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("partnerQnaVO", partnerQnaVO);
			goPage = "management/partner/qnaDetail";
		}
		return goPage;
	}
	
	@PostMapping("/qna/blind")
	public String qnaBlind(@RequestParam(value = "qnaNos") List<Integer> qnaNos, 
	                       Model model, 
	                       RedirectAttributes ra) {
	    log.info("qnaBlind() 실행...!");

	    String goPage = "";

	    if (qnaNos == null || qnaNos.isEmpty()) {
	        model.addAttribute("msg", "오류");
	        model.addAttribute("message", "처리할 항목이 없습니다.");
	        return "redirect:/management/partner/qna/qnaList";
	    }

	    // 각 QNA 번호에 대해 블라인드 처리
	    for (Integer qnaNo : qnaNos) {
	        int result = service.delete(qnaNo);
	        if (result <= 0) {
	            model.addAttribute("msg", "오류");
	            model.addAttribute("message", "서버에러, 다시 시도해주세요!");
	            break;
	        }
	    }

	    ra.addFlashAttribute("msg", "블라인드 처리 완료");
	    ra.addFlashAttribute("message", "블라인드 처리가 완료되었습니다!");
	    goPage = "redirect:/management/partner/qna/qnaList";

	    return goPage;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
		// 협력업체 FAQ 리스트 조회
		@GetMapping("/faq/faqList")
		public String faqList(PartnerFaqVO partnerFaqVO, Model model) {
			log.info("faqList() 실행...!");
			List<PartnerFaqVO> faqList = service.faqList();
			model.addAttribute("faqList", faqList);
			model.addAttribute("partnerQnaActive", "active");
			return "management/partner/faqList";
		}
		
		@PostMapping("/faq/faqRegister")
		public String faqRegister(@RequestBody PartnerFaqVO partnerFaqVO, Model model, RedirectAttributes ra) {
		    log.info("faqRegister() 실행..!");
		   
		    String goPage = "";
			
			int result = service.register(partnerFaqVO);
			
			if(result > 0) {
				ra.addFlashAttribute("msg", "등록 완료");
				ra.addFlashAttribute("message", "등록이 완료되었습니다!");
				goPage = "redirect:/management/partner/faq/faqList";
			}else {
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				goPage = "management/partner/faqList";
			}
			return goPage;
		}
		
		@GetMapping("/faq/faqDelete")
		@ResponseBody
		public String faqDelete(@RequestParam(value = "faqNo") int faqNo) {
			
			String goPage = "";
			
			int result = service.faqDelete(faqNo);
			
			if(result > 0) {
				goPage = "SUCCESS";
			} else {
				goPage = "FAIL";
			}
			return goPage;
		}
		
		@PostMapping("/faq/faqUpdate")
		public String faqUpdate(@RequestBody PartnerFaqVO partnerFaqVO, Model model, RedirectAttributes ra) {
			log.info("faqUpdate() 실행..!");
			
			String goPage = "";
			
			int result = service.faqUpdate(partnerFaqVO);
			
			if(result > 0) {
				ra.addFlashAttribute("msg", "수정 완료");
				ra.addFlashAttribute("message", "수정이 완료되었습니다!");
				goPage = "redirect:/management/partner/faq/faqList";
			}else {
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				goPage = "management/partner/faqList";
			}
			return goPage;
		}
	
}
