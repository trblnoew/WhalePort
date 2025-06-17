package kr.or.ddit.management.info.notice.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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

import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.management.info.notice.service.IEmpNoticeService;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/info/notice")
public class EmpNoticeController {
	
	@Inject
	private IEmpNoticeService noticeService;

	@GetMapping("/list")
	public String empNoticeList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model
			) {
		log.info("empNoticeList()실행...!");
  		
		PaginationVO<UserNoticeVO> pagingVO = new PaginationVO<UserNoticeVO>(10,5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			pagingVO.setSearchType(searchType);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("searchType", searchType);
		}
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = noticeService.selectEmpNoticeCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<UserNoticeVO> dataList = noticeService.selectEmpNoticeList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		model.addAttribute("empNoticeListActive", "active");
		
		model.addAttribute("totalCnt", totalRecord);
		
		return "management/info/empNoticeList";
	}
	
	@GetMapping("/detail")
	public String empNoticeDetail(UserNoticeVO noticeVO, Model model  ) {
		log.info("empNoticeDetail()실행...!");
		UserNoticeVO noticeVO2 = noticeService.selectEmpNotice(noticeVO);
		
		model.addAttribute("noticeVO", noticeVO2);
		model.addAttribute("empNoticeListActive", "active");

		return "management/info/empNoticeDetail";
		
	}
	
	@GetMapping("/register")
	public String empNoticeRegisterForm(Model model) {
		log.info("empNoticeRegisterForm()실행...!");
		model.addAttribute("empNoticeListActive", "active");

		return "management/info/empNoticeForm";
	}
	
	@PostMapping("/register")
	public String empNoticeRegister(
			RedirectAttributes ra,
			UserNoticeVO noticeVO, Model model
			) {
		log.info("empNoticeRegister()실행...!");
		String goPage = "";
		
//		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		LoginCommonVO empVO = user.getMember();
		
//		if(empVO != null) {
//			noticeVO.setEmpName(empVO.getEmpName());
//			noticeVO.setEmpName("김수연"); //security 적용전이라 일단 하드코딩
			noticeVO.setEmpNo(10); // 일단하드코딩
			int result = noticeService.insertEmpNotice(noticeVO);
			if(result >1) {
				ra.addFlashAttribute("msg", "등록 완료");
				ra.addFlashAttribute("message", "등록을 완료하였습니다.");
//				goPage = "redirect:/info/notice/detail?noNo="+noticeVO.getNoNo();
				goPage = "redirect:/info/notice/list";
			}else {
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				goPage = "management/info/notice/register";
			}
//		}else {
//			ra.addFlashAttribute("msg","로그인");
//			ra.addFlashAttribute("message","로그인 후 사용 가능합니다.");
//			goPage = "redirect:/common/login";
//		}
		
		return goPage;
		
	}
	
	@GetMapping("/download")
	public View empNoticDownload(int fileNo, ModelMap model) {
		log.info("empNoticDownload()실행...!");
		FileVO noticeFileVO = noticeService.empNoticeDownload(fileNo);
		
		Map<String, Object> noticeFileMap = new HashMap<String, Object>();
		
		noticeFileMap.put("fileRealname", noticeFileVO.getFileRealname());
		noticeFileMap.put("fileSize", noticeFileVO.getFileSize());
		noticeFileMap.put("fileSavepath", noticeFileVO.getFileSavepath());
		model.addAttribute("noticeFileMap", noticeFileMap);
		
		return new NoticeDownloadView();
		
		
	}
	
	@GetMapping("/update")
	public String empNoticeUdateForm(UserNoticeVO noticeVO, Model model) {
		
		UserNoticeVO noticeVO2 = noticeService.selectEmpNotice(noticeVO);
		model.addAttribute("noticeVO", noticeVO2);
		model.addAttribute("empNoticeListActive", "active");
		return "management/info/empNoticeUpdate";
	}
	
	@PostMapping("/update")
	public String empNoticeUpdate(RedirectAttributes ra, UserNoticeVO noticeVO, Model model) {
		String goPage = "";
		int result = noticeService.updateEmpNotice(noticeVO);
		if(result > 1) {
			ra.addFlashAttribute("msg", "수정 완료");
			ra.addFlashAttribute("message", "수정을 완료하였습니다.");
			goPage = "redirect:/info/notice/list";
		}else {
			model.addAttribute("msg", "오류");
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("noticeVO", noticeVO);
			goPage = "management/info/notice/update";
		}
		
		return goPage;
	}
	
	
	@PostMapping("/delete")
	public String empNoticeDelete(RedirectAttributes ra, int noNo, Model model ) {
		String goPage= "";
		int result = noticeService.deleteEmpNotice(noNo);
		if(result >0) {
			ra.addFlashAttribute("msg", "삭제 완료");
			ra.addFlashAttribute("message", "삭제를 완료하였습니다.");
			goPage = "redirect:/info/notice/list";
		}else {
			model.addAttribute("msg", "오류");
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			goPage = "redirect:/info/notice/detail?noNo="+noNo;
			
		}
		
		return goPage;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
