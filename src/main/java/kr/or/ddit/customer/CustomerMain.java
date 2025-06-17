package kr.or.ddit.customer;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.management.airService.popup.service.IPopupService;
import kr.or.ddit.management.airService.popup.vo.PopupVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer")
public class CustomerMain {
	
	@Inject
	private IPopupService popupService;
	
	// 고객 메인 페이지 이동
	@GetMapping("/main")
	public String customerMain(HttpServletRequest req, Model model) {
		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		
		log.info("loginCustomerVO : " + loginCustomerVO);
		PopupVO popupVO = popupService.selectPopupPosting();
		String popImg = popupVO.getPopImg();
		model.addAttribute("popupVO", popupVO);
		
		
		return "customer/main";
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
}
