package kr.or.ddit.customer.airport.airportEtc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer/flightInfo")
public class FlightInformation {

	@GetMapping("/departureArrival")
	public String departureArrival() {
		log.info("departureArrival()...! 실행");
		return "customer/flightInfo/departureArrival";
	}
	
	@GetMapping("/schedule")
	public String schedule() {
		log.info("schedule()...! 실행");
		return "customer/flightInfo/schedule";
	}
	
	@GetMapping("/boardingSimulation")
	public String boardingSimulation() {
		log.info("boardingSimulation()...! 실행");
		return "customer/flightInfo/boardingSimulation";
	}

	@GetMapping("/arrivalSimulation")
	public String arrivalSimulation() {
		log.info("arrivalSimulation()...! 실행");
		return "customer/flightInfo/arrivalSimulation";
	}
	@GetMapping("/OperatingAirline")
	public String OperatingAirline() {
		log.info("OperatingAirline()...! 실행");
		return "customer/flightInfo/OperatingAirline";
	}
	
}
