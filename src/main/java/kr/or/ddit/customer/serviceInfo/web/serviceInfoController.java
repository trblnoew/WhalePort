package kr.or.ddit.customer.serviceInfo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer/infoService")
public class serviceInfoController {

	@GetMapping("/customize")
	public String customize() {
		log.info("customize()...! 실행");
		return "customer/infoService/customize";
	}
	
	@GetMapping("/realFly")
	public String realFly() {
		log.info("realFly()...! 실행");
		return "customer/infoService/realFly";
	}
	
	@GetMapping("/siteInfo")
	public String siteInfo() {
		log.info("siteInfo()...! 실행");
		return "customer/infoService/siteInfo";
	}

	
}
