package kr.or.ddit.customer.login.login.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.etc.sms.web.SmsController;
import kr.or.ddit.common.mypage.web.ServiceResult;
import kr.or.ddit.customer.login.login.service.LoginCustomerService;
import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 최동재
 * 고객 로그인, 회원가입 컨트롤러
 */
@Slf4j
@Controller
@RequestMapping("customer")
public class LoginCustomerController {
	
	@Inject
	private LoginCustomerService loginCustomerService;
	
	@Inject
    private SmsController smsController;
	
	@Inject
	private PasswordEncoder pe;
	
	// 고객 로그인 화면
	@GetMapping("/login")
	public String customerLogin() {
		return "login/customerLogin";
	}
	
	// 고객 회원가입 화면
	@GetMapping("/signup")
	public String customerSignUp() {
		return "register/customerRegister";
	}
	
	// 고객 로그인
	@PostMapping("/loginChk")
	@ResponseBody
	public Map<String, Object> LoginChk(HttpServletRequest req, LoginCustomerVO customer) {
	    Map<String, Object> result = new HashMap<>();
	    Map<String, String> errors = new HashMap<>();
	    
	    if (errors.size() > 0) {
	        result.put("success", false);
	        result.put("errors", errors);
	    } else {
	        LoginCustomerVO loginCustomerVO = loginCustomerService.loginCheck(customer);
	        if (loginCustomerVO != null) {
	        	// 로그인 성공 후 전달받은 loginCustomerVO의 데이터를 이용해서 세션처리
	            HttpSession session = req.getSession();
	            session.setAttribute("SessionInfo", loginCustomerVO);
	            result.put("success", true);
	        } else {
	            result.put("success", false);
	        }
	    }
	    return result;
	}
	
	// 고객 로그아웃
	@PostMapping("/logout")
	public String logout(HttpServletRequest req) {
	    HttpSession session = req.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
	    log.info("로그아웃 되었습니다!");
	    return "redirect:/customer/login";
	}

	// 고객 아이디 찾기
	@ResponseBody
	@PostMapping("/forgetId")
	public ResponseEntity<String> idForget(@RequestBody LoginCustomerVO loginCustomVO, Model model){
		String forgetId = loginCustomerService.idForget(loginCustomVO);
		model.addAttribute("forgetId", forgetId);
		return new ResponseEntity<String>(forgetId, HttpStatus.OK);
	}
	
	// 고객 비밀번호 찾기
	@PostMapping("/forgetPw")
    @ResponseBody
    public String forgetPw(@RequestBody LoginCustomerVO loginCustomVO) {
		String cusId = loginCustomVO.getCusId();
		String cusTel = loginCustomVO.getCusTel();
        String cusName = loginCustomVO.getCusName();

        if (cusId == null || cusTel == null || cusName == null) {
            return "모든 필드를 입력해주세요.";
        }
        
        String tempPassword = smsController.sendSMSMessage(loginCustomVO.getCusTel());
        loginCustomVO.setCusDepw(tempPassword);
        log.info("empDepw ::: " + loginCustomVO.getCusDepw());
        loginCustomVO.setTempPassword(pe.encode(tempPassword));
        loginCustomerService.updtTempPw(loginCustomVO);
        
		return tempPassword;
    }
	
	// 고객 아이디 중복체크
	@ResponseBody
	@PostMapping("/idCheck")
	public ResponseEntity<ServiceResult> idCheck(@RequestBody Map<String, String> map){
		log.info("# 넘겨받은 아이디 : " + map.get("cusId"));
		ServiceResult result = loginCustomerService.idCheck(map.get("cusId"));
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	// 고객 회원가입
	@PostMapping("/signup")
	public String signup(RedirectAttributes ra, HttpServletRequest req, LoginCustomerVO loginCustomVO, Model model) {
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("customer", loginCustomVO);
			goPage = "customer/signup";
		}else {
			ServiceResult result = loginCustomerService.signup(req, loginCustomVO);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("msg", "회원가입");
				ra.addFlashAttribute("msg2", "success");
				ra.addFlashAttribute("message", "회원가입이 완료되었습니다!");
				goPage = "redirect:/customer/login";
			}else {
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				model.addAttribute("customer", loginCustomVO);
				goPage = "customer/signup";
			}
		}
		return goPage;
	}
}
