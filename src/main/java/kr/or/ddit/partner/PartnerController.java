package kr.or.ddit.partner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.partner.common.account.service.IPartnerAccountService;
import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.partner.common.qna.service.IPartnerQnaService;
import kr.or.ddit.partner.common.qna.vo.PartnerQnaVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner")
public class PartnerController {
	
	@Inject
	private IPartnerAccountService service;
	
	@Inject
	private IPartnerQnaService serviceQna;
	
	@GetMapping("/home")
	public String home(HttpServletRequest req, Model model, RedirectAttributes ra) {
		String goPage = "";
		
		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		PartnerVO partnerVO = (PartnerVO) session.getAttribute("SessionInfo");
		
		// 로그인 안 했을 때
		if(partnerVO == null) {		
			ra.addFlashAttribute("msg", "알림");
			ra.addFlashAttribute("msg2", "warning");
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다.");
			goPage = "redirect:/partner/login";
		}else {
			log.info("partnerVO : " + partnerVO);
			model.addAttribute("partnerVO",partnerVO);
			goPage = "partner/common/home";
		}
		
		// 협력업체 QNA 출력
		PaginationVO<PartnerQnaVO> pagingVO = new PaginationVO<PartnerQnaVO>(5, 1);
		pagingVO.setCurrentPage(1);
		int totalRecord = serviceQna.qnaCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<PartnerQnaVO> dataList = serviceQna.qnaList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		
		return goPage;
	}
	
	// 협력업체 로그인 페이지 이동 화면
	@GetMapping("/login")
	public String partnerLogin() {
		return "login/partnerLogin";
	}
	
	// 협력업체 로그인
	@PostMapping("/login")
	public String partnerLogin(HttpServletRequest req, PartnerVO partner, Model model) {
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
	
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("partner", partner);
			goPage = "/partner/login";
		}else {						
			PartnerVO partnerVO = service.partnerLogin(partner);
			if(partnerVO != null) {
				HttpSession session = req.getSession();
				session.setAttribute("SessionInfo", partnerVO);
				goPage = "redirect:/partner/home";
			}else {
				model.addAttribute("message", "로그인 정보를 정확하게 입력해주세요.");
				model.addAttribute("partner", partner);
				goPage = "/partner/login";
			}
		}
		return goPage;
	}
	
	// 협력업체 로그아웃
	@PostMapping("/logout")
	public String partnerLogout(HttpServletRequest req) {
	    HttpSession session = req.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
	    log.info("협력업체 로그아웃 되었습니다!");
	    return "redirect:/partner/login";
	}
	
	@GetMapping("/account/register")
	public String accountForm() {
		log.info("accountForm() 실행...!");
		return "register/partnerRegister";
	}
	
	// 로그인 세션 시간 리셋 버튼 
	@PostMapping("/resetSession")
	@ResponseBody
	public Map<String, Integer> resetSession(HttpSession session) {
	    int newTimeout = session.getMaxInactiveInterval();
	    Map<String, Integer> response = new HashMap<>();
	    response.put("newTimeout", newTimeout); // 새로운 타임아웃 값을 반환
	    return response;
	}
	
	@PostMapping("/account/register")
	public String accountRegister(PartnerVO partnerVO, Model model, RedirectAttributes ra) {
		
		log.info("accountRegister() 실행...!");

		String goPage = "";
		
		int result = service.register(partnerVO);
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "신청 완료");
			ra.addFlashAttribute("message", "계정 신청이 완료되었습니다!");
			goPage = "redirect:/partner/login";
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			goPage = "register/partnerRegister";
		}
		return goPage;
	}
}
