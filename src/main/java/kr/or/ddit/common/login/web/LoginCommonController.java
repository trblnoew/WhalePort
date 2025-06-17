package kr.or.ddit.common.login.web;

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

import kr.or.ddit.common.etc.sms.web.SmsController;
import kr.or.ddit.common.login.service.LoginCommonService;
import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.partner.common.account.vo.PartnerVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 최동재
 * 직원 / 협력업체 로그인, 아이디 찾기, 비밀번호 찾기 구현을 위한 클래스
 */
@Slf4j
@Controller
@RequestMapping("/common")
public class LoginCommonController {
	
	@Inject
	private LoginCommonService loginCommonService;
	
	@Inject
    private SmsController smsController;
	
	@Inject
	private PasswordEncoder pe;
	
	// 직원 로그인 페이지 이동 화면
	@GetMapping("/login")
	public String managementLogin() {
		return "login/adminLogin";
	}
	
	// 직원 아이디 찾기
	@ResponseBody
	@PostMapping("/forgetId")
	public ResponseEntity<String> idForget(@RequestBody LoginCommonVO loginCommonVO, Model model){
		String forgetId = loginCommonService.idForget(loginCommonVO);
		model.addAttribute("forgetId", forgetId);
		return new ResponseEntity<String>(forgetId, HttpStatus.OK);
	}
	
	// 직원 비밀번호 찾기
	@PostMapping("/forgetPw")
    @ResponseBody
    public String forgetPw(@RequestBody LoginCommonVO loginCommonVO) {
		String empId = loginCommonVO.getEmpId();
		String empTel = loginCommonVO.getEmpTel();
        String empName = loginCommonVO.getEmpName();

        if (empName == null || empId == null || empTel == null) {
            return "모든 필드를 입력해주세요.";
        }
        
        String tempPassword = smsController.sendSMSMessage(loginCommonVO.getEmpTel());
        loginCommonVO.setEmpDepw(tempPassword);
        log.info("empDepw ::: " + loginCommonVO.getEmpDepw());
        loginCommonVO.setTempPassword(pe.encode(tempPassword));
        loginCommonService.updtTempPw(loginCommonVO);
        
		return tempPassword;
    }
	
	// 직원 계정 잠금
	@ResponseBody
	@PostMapping("/lockAccount")
	public ResponseEntity<String> lockAccount(@RequestBody Map<String, String> param) {
	    try {
	    	param.put("status", "Y");
	        loginCommonService.lockAccount(param);
	        return ResponseEntity.ok("계정이 성공적으로 잠겼습니다.");
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("계정 잠금에 실패했습니다.");
	    }
	}

	// 협력업체 아이디 찾기
	@ResponseBody
	@PostMapping("/partnerForgetId")
	public ResponseEntity<String> idForget(@RequestBody PartnerVO partnerVO, Model model){
		String forgetId = loginCommonService.partnerForgetId(partnerVO);
		model.addAttribute("forgetId", forgetId);
		return new ResponseEntity<String>(forgetId, HttpStatus.OK);
	}
	
	// 협력업체 비밀번호 찾기
//	@PostMapping("/partnerForgetPw")
//    @ResponseBody
//    public String forgetPw(@RequestBody PartnerVO partnerVO) {
//		String ptId = partnerVO.getPtId();
//        String ptName = partnerVO.getPtName();
//
//        if (ptId == null || ptName == null) {
//            return "모든 필드를 입력해주세요.";
//        }
//        
//        String tempPassword = smsController.sendSMSMessage(partnerVO.getCusTel());
//        partnerVO.setCusDepw(tempPassword);
//        log.info("empDepw ::: " + partnerVO.getCusDepw());
//        partnerVO.setTempPassword(pe.encode(tempPassword));
//	        loginCommonService.updtTempPw(partnerVO);
//	        
//			return tempPassword;
//	    }
}
