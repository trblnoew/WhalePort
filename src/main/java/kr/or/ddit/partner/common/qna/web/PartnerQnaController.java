package kr.or.ddit.partner.common.qna.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.partner.common.qna.service.IPartnerQnaService;
import kr.or.ddit.partner.common.qna.vo.PartnerFaqVO;
import kr.or.ddit.partner.common.qna.vo.PartnerQnaVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner/qna")
public class PartnerQnaController {

	@Inject
	private IPartnerQnaService service;
	
	@GetMapping("/register")
	public String qnaForm(HttpServletRequest req, Model model) {
		log.info("qnaForm() 실행...!");

		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
		
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		PartnerVO partnerVO = (PartnerVO) session.getAttribute("SessionInfo");
		
		model.addAttribute("partnerVO",partnerVO);
		
		return "partner/common/qnaRegister";
	}
	
	@PostMapping("/register")
	public String qnaRegister(PartnerQnaVO partnerQnaVO, Model model, RedirectAttributes ra) {
		
		log.info("qnaRegister() 실행...!");
		
		String goPage = "";
		
		int result = service.register(partnerQnaVO);
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "등록 완료");
			ra.addFlashAttribute("message", "등록이 완료되었습니다!");
			goPage = "redirect:/partner/qna/detail?qnaNo=" + partnerQnaVO.getQnaNo();
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			goPage = "partner/common/qnaRegister";
		}
		return goPage;
	}

	@GetMapping("/list")
	public String qnaList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			HttpServletRequest req, Model model
			) {
		
		log.info("qnaList() 실행...!");
		
		PaginationVO<PartnerQnaVO> pagingVO = new PaginationVO<PartnerQnaVO>(10,5);
		
		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
				
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		PartnerVO partnerVO = (PartnerVO) session.getAttribute("SessionInfo");
				
		log.info("테스트!!!!!" + partnerVO.getPtNo());
		
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
		List<PartnerQnaVO> dataList = service.qnaList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("ptNo", partnerVO.getPtNo());
		
		return "partner/common/qnaList";
	}
	
	@GetMapping("/detail")
	public String qnaDetail(PartnerQnaVO partnerQnaVO, HttpServletRequest req, Model model) {
		log.info("qnaDetail() 실행...!");
		
		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
				
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		PartnerVO partnerVO = (PartnerVO) session.getAttribute("SessionInfo");
		
		PartnerQnaVO partnerQnaVO2 = service.detail(partnerQnaVO);
		model.addAttribute("partnerQnaVO", partnerQnaVO2);
		model.addAttribute("ptNo", partnerVO.getPtNo());

		return "partner/common/qnaDetail";
	}
	
	@GetMapping("/update")
	public String qnaUpdateForm(PartnerQnaVO partnerQnaVO, Model model) {
		log.info("qnaUpdateForm() 실행...!");
		PartnerQnaVO partnerQnaVO2 = service.detail(partnerQnaVO);
		model.addAttribute("partnerQnaVO", partnerQnaVO2);
		return "partner/common/qnaUpdate";
	}
	
	@PostMapping("/update")
	public String qnaUpdate(PartnerQnaVO partnerQnaVO, Model model, RedirectAttributes ra) {
		log.info("qnaUpdate() 실행...!");
		
		String goPage = "";
		
		int result = service.update(partnerQnaVO);
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "수정 완료");
			ra.addFlashAttribute("message", "수정이 완료되었습니다!");
			goPage = "redirect:/partner/qna/detail?qnaNo=" + partnerQnaVO.getQnaNo();
		}else {
			model.addAttribute("msg", "오류");
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("partnerQnaVO", partnerQnaVO);
			goPage = "partner/common/qnaUpdate";
		}
		return goPage;
	}
	
	@PostMapping("/delete")
	public String qnaDelete(int qnaNo, Model model, RedirectAttributes ra) {
		log.info("qnaDelete() 실행...!");
		
		String goPage= "";
		
		int result = service.delete(qnaNo);
		
		if(result >0) {
			ra.addFlashAttribute("msg", "삭제 완료");
			ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
			goPage = "redirect:/partner/qna/list";
		}else {
			model.addAttribute("msg", "오류");
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			goPage = "redirect:/partner/qna/detail?qnaNo=" + qnaNo;
		}
		return goPage;
	}
		
	@GetMapping("/download")
	public View qnaDownload(int fileNo, ModelMap model) {
		log.info("qnaDownload()실행...!");
		FileVO qnaFileVO = service.qnaDownload(fileNo);
		
		Map<String, Object> qnaFileMap = new HashMap<String, Object>();
		
		qnaFileMap.put("fileRealname", qnaFileVO.getFileRealname());
		qnaFileMap.put("fileSize", qnaFileVO.getFileSize());
		qnaFileMap.put("fileSavepath", qnaFileVO.getFileSavepath());
		model.addAttribute("qnaFileMap", qnaFileMap);
		
		return new QnaDownloadView();
	}
	
	@GetMapping("/faqList")
	public String faqList(PartnerFaqVO partnerFaqVO, Model model) {
		log.info("faqList() 실행...!");
		List<PartnerFaqVO> faqList = service.faqList();
		model.addAttribute("faqList", faqList);
		return "partner/common/faqList";
	}
	

}
