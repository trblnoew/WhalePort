package kr.or.ddit.customer.trafficInfo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer/trafficInfo")
public class TrafficInformationController {

	@GetMapping("/direction")
	public String direction() {
		log.info("direction()...! 실행");
		return "customer/trafficInfo/direction";
	}
	
	@GetMapping("/parkingInfo")
	public String parkingInformation() {
		log.info("parkingInformation()...! 실행");
		return "customer/trafficInfo/parkingInfo";
	}
	
	@GetMapping("/shuttleBus")
	public String shuttleBus() {
		log.info("shuttleBus()...! 실행");
		return "customer/trafficInfo/shuttleBus";
	}

	@GetMapping("/rentalCar")
	public String rentalCar() {
		log.info("rentalCar()...! 실행");
		return "customer/trafficInfo/rentalCar";
	}
	
}
