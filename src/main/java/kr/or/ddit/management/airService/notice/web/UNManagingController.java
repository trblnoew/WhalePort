package kr.or.ddit.management.airService.notice.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.customer.notice.vo.UserFAQVO;
import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.customer.notice.vo.UserQnAVO;
import kr.or.ddit.management.airService.notice.service.IUNManagingService;
import kr.or.ddit.management.info.notice.web.NoticeDownloadView;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management")
public class UNManagingController {
	
	@Inject
	private IUNManagingService unservice;
	
	@Resource(name="macUploadPath")
	private String macResourcePath;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	private static String resourcePath;
	
	
	// userFAQ 시작
	
	@GetMapping("/userFAQ")
	public String userFAQManaging(Model model) {
		log.info("userFAQManaging() 실행...!");
		List<UserFAQVO> userFaqList = unservice.faqList();
		model.addAttribute("faqList", userFaqList);
		model.addAttribute("userFAQActive", "active");
		model.addAttribute("cusManaActive", "active");
		return "management/customerManagement/notice/userFAQ";
	}
	
	@ResponseBody
	@PostMapping("/userFAQ/update")
	public ResponseEntity<String> userFaqUpdate(@RequestBody UserFAQVO notice) {
	    log.info("userFaqUpdate() 실행..!");
	    unservice.faqUpdate(notice);
	    ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    return entity;
	}
	
	@ResponseBody
	@PostMapping("/userFAQ/delete")
	public ResponseEntity<String> userFaqDelete(@RequestBody Map<String, Integer> data) {
	    log.info("userFaqDelete() 실행..!");
	    int faqNo = data.get("faqNo");  // JSON에서 faqNo 추출
	    unservice.faqDelete(faqNo);
	    ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    return entity;
	}
	
	@ResponseBody
	@PostMapping("/userFAQ/add")
	public ResponseEntity<String> userFaqAdd(@RequestBody UserFAQVO notice) {
	    log.info("userFaqDelete() 실행..!");
	    unservice.faqAdd(notice);
	    ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    return entity;
	}
	
	// userFAQ 끝
	
	
	// userNotice 시작
	
	@GetMapping("userNotice/list")
	public String userNoticeList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model
			) {
		log.info("userNoticeList() 실행...!");

		PaginationVO<UserNoticeVO> pagingVO = new PaginationVO<UserNoticeVO>(10,5);
		
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
		int totalRecord = unservice.userNoticeCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<UserNoticeVO> dataList = unservice.userNoticeList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("userNoticeActive", "active");
		model.addAttribute("cusManaActive", "active");

		return "management/customerManagement/notice/userNotice";
	}
	
	@GetMapping("/userNotice/register")
	public String userNoticeForm(Model model) {
		log.info("userNoticeForm() 실행...!");
		
		model.addAttribute("userNoticeActive", "active");
		model.addAttribute("cusManaActive", "active");

		return "management/customerManagement/notice/userNoticeRegister";
	}
	
	@PostMapping("/userNotice/register")
	public String userNoticeRegister(
			RedirectAttributes ra,
			UserNoticeVO noticeVO, Model model
			) {
		log.info("userNoticeRegister() 실행...!");
		String goPage = "";
		
//		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		LoginCommonVO empVO = user.getMember();
		
//		if(empVO != null) {
//			noticeVO.setEmpName(empVO.getEmpName());
//			noticeVO.setEmpName("김수연"); //security 적용전이라 일단 하드코딩
			noticeVO.setEmpNo(10); // 일단하드코딩
			int result = unservice.insertUserNotice(noticeVO);
			if(result >1) {
				ra.addFlashAttribute("msg", "등록 완료");
				ra.addFlashAttribute("message", "등록을 완료하였습니다.");
//				goPage = "redirect:/info/notice/detail?noNo="+noticeVO.getNoNo();
				goPage = "redirect:/management/userNotice/list";
			}else {
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				goPage = "management/userNotice/register";
			}
//		}else {
//			ra.addFlashAttribute("msg","로그인");
//			ra.addFlashAttribute("message","로그인 후 사용 가능합니다.");
//			goPage = "redirect:/common/login";
//		}
			
			return goPage;
		
	}
	
	@GetMapping("/userNotice/detail")
	public String userNoticeDetail(UserNoticeVO noticeVO, Model model) {
		log.info("userNoticeDetail() 실행...!");
		UserNoticeVO noticeVO2 = unservice.selectUserNotice(noticeVO);
		
		model.addAttribute("noticeVO", noticeVO2);
		model.addAttribute("userNoticeActive", "active");
		model.addAttribute("cusManaActive", "active");

		return "management/customerManagement/notice/userNoticeDetail";
	}
	
	@PostMapping("/userNotice/delete")
	public String userNoticeDelete(int noNo, Model model, RedirectAttributes ra) {
		log.info("userNoticeDelete() 실행...!");
		unservice.noticeDelete(noNo);
		ra.addFlashAttribute("msg", "삭제");
		ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
		return "redirect:/management/userNotice/list";
	}
	
	@GetMapping("/userNotice/update")
	public String userNoticeUpdateForm(UserNoticeVO noticeVO, Model model) {
		log.info("userNoticeUpdateForm() 실행...!");
		UserNoticeVO noticeVO2 = unservice.selectUserNotice(noticeVO);
		model.addAttribute("userNoticeVO", noticeVO2);

		
		return "management/customerManagement/notice/userNoticeUpdate";
	}
	
	@PostMapping("/userNotice/update")
	public String userNoticeUpdate(UserNoticeVO userNoticeVO, Model model, RedirectAttributes ra) {
		log.info("userNoticeUpdate() 실행...!");
	    String goPage = "";
		int result = unservice.updateUserNotice(userNoticeVO);
		if(result > 1) {
			ra.addFlashAttribute("msg", "수정 완료");
			ra.addFlashAttribute("message", "수정을 완료하였습니다.");
			goPage = "redirect:/management/userNotice/list";
		}else {
			model.addAttribute("msg", "오류");
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("noticeVO", userNoticeVO);
			goPage = "management/userNotice/update";
		}
		
		return goPage;
	}
	
	// userNotice 끝
	
	
	// userQnA 시작
	@GetMapping("/userQnA/list")
	public String userQnAList(@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model
			) {
		log.info("userQnAList() 실행...!");

		PaginationVO<UserQnAVO> pagingVO = new PaginationVO<UserQnAVO>(10,5);
		
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
		int totalRecord = unservice.userQnACount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<UserQnAVO> dataList = unservice.userQnAList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("userQnAActive", "active");
		model.addAttribute("cusManaActive", "active");

		return "management/customerManagement/notice/userQnAList";
	}
	
	@GetMapping("/userQnA/detail")
	public String userqnaDetail(int qnaNo, Model model) {
		log.info("userqnaDetail() 실행...!");
		UserQnAVO userqnaVO = unservice.qnaDetail(qnaNo);
		FileVO fileVO = unservice.takeQnAFile(qnaNo);
		model.addAttribute("fileVO", fileVO);
		model.addAttribute("userqnaVO", userqnaVO);
		model.addAttribute("userQnAActive", "active");
		model.addAttribute("cusManaActive", "active");
		return "management/customerManagement/notice/userQnADetail";
	}
	
	@PostMapping("/userQnA/delete")
	public String userQnADelete(int qnaNo, Model model, RedirectAttributes ra) {
		log.info("userQnADelete() 실행...!");
		unservice.qnaDelete(qnaNo);
		ra.addFlashAttribute("msg", "삭제");
		ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
		return "redirect:/management/userQnA/list";
	}
	
	@PostMapping("/userQnA/update")
	public String userQnAUpdate(UserQnAVO userQnAVO, Model model, RedirectAttributes ra) {
		log.info("userQnAUpdate() 실행...!");
		unservice.qnaUpdate(userQnAVO);
		ra.addFlashAttribute("msg", "수정");
		ra.addFlashAttribute("message", "수정이 완료되었습니다!");
	    return "redirect:/management/userQnA/detail?qnaNo=" + userQnAVO.getQnaNo();
	}
	
	
	// userQnA 끝
	

	
	@GetMapping("/download")
		public View UserNoticDownload(int fileNo, ModelMap model) {
			log.info("UserNoticDownload()실행...!");
			FileVO noticeFileVO = unservice.USerNoticeDownload(fileNo);
			
			Map<String, Object> noticeFileMap = new HashMap<String, Object>();
			
			noticeFileMap.put("fileRealname", noticeFileVO.getFileRealname());
			noticeFileMap.put("fileSize", noticeFileVO.getFileSize());
			noticeFileMap.put("fileSavepath", noticeFileVO.getFileSavepath());
			model.addAttribute("noticeFileMap", noticeFileMap);
			
			return new NoticeDownloadView();
			
			
		}
}



