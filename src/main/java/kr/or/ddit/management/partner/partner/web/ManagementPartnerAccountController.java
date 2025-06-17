package kr.or.ddit.management.partner.partner.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.or.ddit.partner.common.account.service.IPartnerAccountService;
import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/partner/account")
public class ManagementPartnerAccountController {
	
	@Autowired
	JavaMailSenderImpl mailSender;
	
	@Inject
	private IPartnerAccountService service;

	// 협력업체 신청 리스트 조회
	@GetMapping("/accountList")
	public String accountList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			Model model
			) {
		log.info("accountList() 실행...!");

		PaginationVO<PartnerVO> pagingVO = new PaginationVO<PartnerVO>(10,5);
		PartnerVO countVO = service.count();
		PartnerVO pieChart = service.pieChart();
		
		List<Integer> preBarChart = service.preBarChart();
		List<Integer> thisBarChart = service.thisBarChart();
		
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
		int totalRecord = service.accountCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<PartnerVO> dataList = service.list(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("countVO", countVO);
		model.addAttribute("pieChart", pieChart);
		model.addAttribute("preBarChart", preBarChart);
		model.addAttribute("partnerActive", "active");
		model.addAttribute("thisBarChart", thisBarChart);
		
		return "management/partner/accountList";
	}
	
	// 협력업체 신청 리스트 상세 조회
	@GetMapping("/accountDetail")
	public String accountDetail(PartnerVO partnerVO, Model model) {
		log.info("accountDetail() 실행...!");
		String fileOwner = "10"+ partnerVO.getPtNo();
		partnerVO.setFileOwner(fileOwner);
		PartnerVO partnerVO2 = service.detail(partnerVO);
		model.addAttribute("partnerActive", "active");
		model.addAttribute("partnerVO", partnerVO2);
		return "management/partner/accountDetail";
	}
	
	// 협력업체 승인
	@PostMapping("/accountApprove")
	public String accountApprove(PartnerVO partnerVO, Model model, RedirectAttributes ra) {
		log.info("accountApproves() 실행...!");
		service.approve(partnerVO);
		return "redirect:/management/partner/account/accountDetail?ptNo=" + partnerVO.getPtNo();
	}
	
	// 협력업체 아이디 발급
	@PostMapping("/accountIdIssue")
	public String accountIdIssue(PartnerVO partnerVO, Model model, RedirectAttributes ra) {
		log.info("accountIdIssue() 실행...!");
		service.idIssue(partnerVO);
		return "redirect:/management/partner/account/accountDetail?ptNo=" + partnerVO.getPtNo();
	}
	
	// 협력업체 수정 폼
	@GetMapping("/accountUpdate")
	public String accountUpdateForm(PartnerVO partnerVO, Model model) {
		log.info("accountUpdateForm() 실행...!");

		String fileOwner = "10"+ partnerVO.getPtNo();
		partnerVO.setFileOwner(fileOwner);
		
		PartnerVO partnerVO2 = service.detail(partnerVO);
		
		model.addAttribute("partnerVO", partnerVO2);
		return "management/partner/accountUpdate";
	}
	
	// 협력업체 수정
	@PostMapping("/accountUpdate")
	public String accountUpdate(PartnerVO partnerVO, Model model, RedirectAttributes ra) {
		log.info("accountUpdate() 실행...!");
		
		String goPage = "";

		int result = service.update(partnerVO);
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "수정");
			ra.addFlashAttribute("message", "수정이 완료되었습니다!");
			goPage = "redirect:/management/partner/account/accountDetail?ptNo=" + partnerVO.getPtNo();
		}else {
			model.addAttribute("msg", "오류");
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("partnerVO", partnerVO);
			goPage = "management/partner/accountUpdate";
		}
	    return goPage;
	}
	
	// 다운로드
	@GetMapping("/download")
	public View download(int fileNo, ModelMap model) {
		log.info("download()실행...!");
		FileVO ptFileVO = service.ptDownload(fileNo);
		
		Map<String, Object> ptFileMap = new HashMap<String, Object>();
		
		ptFileMap.put("fileRealname", ptFileVO.getFileRealname());
		ptFileMap.put("fileSize", ptFileVO.getFileSize());
		ptFileMap.put("fileSavepath", ptFileVO.getFileSavepath());
		model.addAttribute("ptFileMap", ptFileMap);
		
		return new PtDownloadView();
	}
	
	// 이메일 발송
	@ResponseBody
	@PostMapping("/sendEmail")
	public int sendEmail(PartnerVO partnerVO, Model model, RedirectAttributes ra) {
	    
	    // 이메일 보낼 양식
	    final String setFrom = "seonye0ng@naver.com"; // 보내는 사람 이메일
	    String toMail = partnerVO.getPtMgremail();
	    String title = "[WHALEPORT] 협력업체 아이디 발급 이메일 입니다.";
	    String content = "<html>" +
                "<body style='font-family: Arial, sans-serif; color: #333;'>" +
                "<div style='text-align: center;'>" +
                "<img src=\"data:image/png;base64,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\" style='width: 250px; height: auto;' />"+
                "<br><br><br>" +
                "</div>" +
                "<div style='text-align: center;'>" +
                "<h1 style='color: #007BFF;'>안녕하세요!</h1>" +
                "<p style='font-size: 20px;'>WhalePort의 협력업체가 되신 것을 진심으로 환영합니다!</p>" +
                "</div>" +
                "<div style='text-align: center;'>" +
                "<hr style='border: 1px solid #007BFF; width: 50%; margin: 20px auto;'>" + // 수평선 길이 조정
                "</div>" +
                "<div style='text-align: center;'>" +
                "<p style='font-size: 18px;'>아래는 귀하의 계정 정보입니다.</p>" +
                "<p style='font-weight: bold;'>아이디 : <span style='color: #007BFF;'>" + partnerVO.getPtId() + "</span></p>" +
                "<p style='font-weight: bold;'>비밀번호 : <span style='color: #007BFF;'>" + partnerVO.getPtPw() + "</span></p>" +
                "</div>" +
                "<div style='text-align: center;'>" +
                "<hr style='border: 1px solid #007BFF; width: 50%; margin: 20px auto;'>" + // 수평선 길이 조정
                "</div>" +
                "<div style='text-align: center;'>" + // 가운데 정렬로 수정
                "<p style='font-size: 18px;'>이제 WhalePort의 다양한 서비스를 이용하실 수 있습니다.</p>" +
                "<p style='font-size: 18px;'>궁금한 점이 있으시면 언제든지 문의해 주세요.</p>" +
                "</div>" +
                "<br>" +
                "<div style='text-align: center; margin: 20px;'>" + // 가운데 정렬로 수정
                "<p style='font-size: 18px;'>감사합니다.</p>" +
                "<p style='font-size: 18px;'>WhalePort 드림</p>" +
                "</div>" +
                "</body>" +
                "</html>";



	    try {
	        // 이메일 유효성 검사 (간단한 정규 표현식 사용)
	        if (!isValidEmail(toMail)) {
	            log.error("Invalid email address: " + toMail);
	            return 0; // 유효하지 않은 이메일 주소
	        }

	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	        helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content, true);
	        mailSender.send(message);
	        
	        log.info("이메일이 성공적으로 전송되었습니다: " + toMail);
	        return 1; // 이메일 전송 성공
	    } catch (Exception e) {
	        log.error("이메일 전송 실패: " + e.getMessage());
	        e.printStackTrace();
	        return 0; // 이메일 전송 실패
	    }
	}

	// 이메일 유효성 검사 메서드
	private boolean isValidEmail(String email) {
	    String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$"; // 간단한 이메일 정규식
	    return email.matches(emailRegex);
	}



	
}
