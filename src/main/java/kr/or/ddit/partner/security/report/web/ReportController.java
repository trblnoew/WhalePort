package kr.or.ddit.partner.security.report.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner/report")
public class ReportController {

	
	// 작업 중
	@GetMapping("/register")
	public String reportRegister() {
		return "partner/security/reportRegister";
	}

	@GetMapping("/list")
	public String reportList() {
		return "partner/security/reportList";
	}
	
}
