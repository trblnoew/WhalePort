package kr.or.ddit.customer.notice.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.customer.notice.service.IUserNoticeService;
import kr.or.ddit.customer.notice.vo.UserFAQVO;
import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.customer.notice.vo.UserQnAVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer")
public class UserNoticeController {
	
	@Inject
	private IUserNoticeService noticeService;
	
	@Resource(name="macUploadPath")
	private String macResourcePath;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	private static String resourcePath;
	
	// FAQ
	@GetMapping("/faq/list")
	public String userFaq(Model model) {
		log.info("userFaq() 실행...!");
		List<UserFAQVO> userFaqList = noticeService.faqList();
		model.addAttribute("faqList", userFaqList);
		
		return "customer/notice/userFAQ";
	}
	
	
	// NOTICE
	@GetMapping("/notice/list")
	public String userNoticeList(@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
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
		int totalRecord = noticeService.userNoticeCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<UserNoticeVO> dataList = noticeService.userNoticeList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		return "customer/notice/userNoticeList";
	}
	
	@GetMapping("/notice/detail")
	public String userNoticeDetail(UserNoticeVO noticeVO, Model model) {
		log.info("userNoticeDetail() 실행...!");
		UserNoticeVO noticeVO2 = noticeService.selectUserNotice(noticeVO);
		
		model.addAttribute("userNoticeVO", noticeVO2);
		return "customer/notice/userNoticeDetail";
	}
	
	// QNA
	@GetMapping("/qna/list")
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
		int totalRecord = noticeService.userQnACount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<UserQnAVO> dataList = noticeService.userQnAList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		return "customer/notice/userQnAList";
	}
	
	@GetMapping("/qna/register")
	public String userQnARegisterForm() {
		log.info("userQnARegisterForm() 실행...!");
		
		return "customer/notice/userQnARegister";
	}
	
	@PostMapping("/qna/register")
	public String userQnARegister(@RequestParam("qnaFile") MultipartFile file, UserQnAVO userQnAVO, Model model, FileVO fileVO, RedirectAttributes ra, HttpServletRequest req) throws Exception {
		log.info("userQnARegister() 실행...!");
		
		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		
		userQnAVO.setCusNo(loginCustomerVO.getCusNo());
		
		String fileSavename = uploadqnaFile(file.getOriginalFilename(), file.getBytes());
		
		// os확인 하여 저장경로 결정
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		//  파일 확장자
		String fileMime = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
		
		String fileYN = "00";
		
		log.info(file.getOriginalFilename());
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileYN = "04";
		}
		
		userQnAVO.setQnaFilecode(fileYN);
		
		
		noticeService.qnaRegister(userQnAVO);
		
		fileVO.setFileOwner(fileYN+userQnAVO.getQnaNo());
		fileVO.setFileSavepath(resourcePath);
		fileVO.setFileSize(file.getSize());
		fileVO.setFileMime(fileMime);
		fileVO.setFileRealname(file.getOriginalFilename());
		fileVO.setFileSavename(fileSavename);
		
		noticeService.saveFile(fileVO);
		ra.addFlashAttribute("msg", "등록");
		ra.addFlashAttribute("message", "등록이 완료되었습니다.");
		return "redirect:/customer/qna/list";
		
	}
	
	@GetMapping("/qna/detail")
	public String userqnaDetail(int qnaNo, Model model) {
		log.info("userqnaDetail() 실행...!");
		UserQnAVO userqnaVO = noticeService.qnaDetail(qnaNo);
		FileVO fileVO = noticeService.takeQnAFile(qnaNo);
		
		String cusId = noticeService.selectCusId(userqnaVO.getCusNo());
		userqnaVO.setCusId(cusId);
		model.addAttribute("fileVO", fileVO);
		model.addAttribute("userqnaVO", userqnaVO);
		return "customer/notice/userQnADetail";
	}
	
	@PostMapping("/qna/delete")
	public String userQnADelete(int qnaNo, Model model, RedirectAttributes ra) {
		log.info("userQnADelete() 실행...!");
		noticeService.qnaDelete(qnaNo);
		ra.addFlashAttribute("msg", "삭제");
		ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
		return "redirect:/customer/qna/list";
	}
	
	@GetMapping("/qna/update")
	public String userQnAUpdateForm(@RequestParam("qnaNo") int qnaNo, Model model) {
		log.info("userNoticeUpdateForm() 실행...!");
		UserQnAVO userqnaVO = noticeService.qnaDetail(qnaNo);
		model.addAttribute("userqnaVO", userqnaVO);
		return "customer/notice/userQnAUpdate";
	}
	
	@PostMapping("/qna/update")
	public String userQnAUpdate(UserQnAVO userQnAVO, Model model, RedirectAttributes ra) {
		log.info("userQnAUpdate() 실행...!");
		noticeService.qnaUpdate(userQnAVO);
		ra.addFlashAttribute("msg", "수정");
		ra.addFlashAttribute("message", "수정이 완료되었습니다!");
	    return "redirect:/customer/qna/detail?qnaNo=" + userQnAVO.getQnaNo();
	}
	
	
	
	//파일 업로드
	private String uploadqnaFile(String originalFilename, byte[] bytes) throws Exception {
		log.info("uploadFile in...!");
		UUID uuid = UUID.randomUUID();		// UUID로 파일명 생성
		// UUID_원본 파일명
		String createdFileName = uuid.toString() + "_" + originalFilename;
		// os확인 하여 저장경로 결정
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		// resourcePath 활용
		File file = new File(resourcePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		File target = new File(resourcePath, createdFileName);  // 파일 업로드 준비
		FileCopyUtils.copy(bytes, target);  //	파일 복사
		return createdFileName;
		
	}
	
}





















