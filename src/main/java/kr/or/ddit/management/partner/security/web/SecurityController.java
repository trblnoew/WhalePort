package kr.or.ddit.management.partner.security.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/security")
public class SecurityController {
	
	@GetMapping("/report")
	public String securityReportList() {
		log.info("securityReportList()...실행!");
		return "management/partner/securityReportList";
	}
	
	@GetMapping("/schedule")
	public String securityScheduleList() {
		log.info("securityScheduleList()...실행!");
		return "management/partner/securityScheduleList";
	}


}
