package kr.or.ddit.partner.security.emergencySMS.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner/security")
public class EmergencySMSController {

	@GetMapping("/emergencySMS")
	public String emergencySMS() {
		log.info("emergencySMS()실행...!");
		return "partner/security/emergencySMS";
	}
}
