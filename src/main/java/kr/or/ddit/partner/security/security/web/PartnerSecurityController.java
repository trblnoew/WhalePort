package kr.or.ddit.partner.security.security.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner/security")
public class PartnerSecurityController {
	
	
	@GetMapping("/scheduleList")
	public String scheduleList() {
		log.info("scheduleList() 실행...!");
		return "partner/security/scheduleList";
	}
	
	@GetMapping("/reportRegister")
	public String reportRegisterForm() {
		log.info("reportRegisterForm() 실행...!");
		return "partner/security/reportRegister";
	}
	
	@PostMapping("/reportRegister")
	public String reportRegister() {
		log.info("reportRegister() 실행...!");
		return "redirect:/partner/security/reportList";
	}
	
	@GetMapping("/reportList")
	public String reportList() {
		log.info("reportList() 실행...!");
		return "partner/security/reportList";
	}
	
	
}


