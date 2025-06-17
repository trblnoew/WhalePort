package kr.or.ddit.customer.airport.realtime.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer/realtime")
public class RealtimAirportController {

	@GetMapping("/airport")
	public String airport() {
		return "customer/realtimeAirport/realtimeAirport";
	}
}
