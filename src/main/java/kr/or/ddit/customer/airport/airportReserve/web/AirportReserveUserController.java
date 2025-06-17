package kr.or.ddit.customer.airport.airportReserve.web;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.customer.airport.airportReserve.service.IAirportReserveService;
import kr.or.ddit.customer.airport.airportReserve.vo.IATACodeVO;
import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.customer.airport.airportReserve.vo.TicketingVO;
import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/customer")
@Slf4j
public class AirportReserveUserController {

	@Inject
	private IAirportReserveService airportService;
	
	
	@GetMapping("/reserve")
	public String reserveDepart(@RequestParam(name = "scBoarding",required = false) String scBoarding,
						@RequestParam(name = "scArrived", required = false) String scArrived,
						@RequestParam(name = "scStdate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date scStdate,
						@RequestParam(name = "scStd", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date scStd,
						@RequestParam(name = "cusCnt", required = false, defaultValue = "1") int cusCnt,
			Model model) {
		
		if(scBoarding != null && scArrived != null && scStdate != null && cusCnt != 0) {
			List<IATACodeVO> IATACode = airportService.codeList();
			
			// 나중에 데이터 연결받아서 진행시키면 됨
			
			log.info("scStdate :: "+scStdate);
			
			PlaneScheduleVO planeVO = new PlaneScheduleVO();
			planeVO.setScBoarding(scBoarding);
			planeVO.setScArrived(scArrived);
			planeVO.setScStd(scStd);
			planeVO.setScStdate(scStdate);
			
//			log.info("stdate :: " + planeVO.getScStdate());
			List<PlaneScheduleVO> searchList = airportService.searchList(planeVO);
			
			log.info("List size :: "+searchList.size());
//			log.info("searchList size :: " + searchList.size());
			model.addAttribute("level", "1");
			model.addAttribute("IATACode", IATACode);
			model.addAttribute("searchList", searchList);
			
		}
		
		
		
		return "customer/airportReserve/reserve";
	}
	
	@GetMapping("/reserveArrive")
	public String reserveArrive(@RequestParam(name = "scBoarding",required = false) String scBoarding,
			@RequestParam(name = "scArrived", required = false) String scArrived,
			@RequestParam(name = "scStdate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date scStdate,
			@RequestParam(name = "scStd", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date scStd,
			@RequestParam(name = "cusCnt", required = false, defaultValue = "1") int cusCnt,
			@RequestParam(name = "scNo") int scNo , Model model) {
		log.info("selectFlights :: "+scNo);
		
		
		PlaneScheduleVO planeVO = new PlaneScheduleVO();
		planeVO.setScBoarding(scArrived);
		planeVO.setScArrived(scBoarding);
		planeVO.setScStd(scStdate);
		planeVO.setScStdate(scStd);
		planeVO.setCusCnt(cusCnt);
		List<PlaneScheduleVO> searchList = airportService.searchList(planeVO);
		if(searchList.size() == 0) {
			return "redirect:/customer/reserve/detail?scNo="+scNo+"&cusCnt=" + cusCnt;
		}
		
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("level","2");
		return "customer/airportReserve/reserve";
	}
	
	
	
	@RequestMapping("/reserve/detail")
	public String reserveDetail(PlaneScheduleVO planeVO, Model model) {
		log.info("planeVO scNo1 :: " + planeVO.getScNo());
		log.info("planeVO scNo2 :: " + planeVO.getScNo2());
		log.info("planeVO scNo :: " + planeVO.getCusCnt());
		model.addAttribute("planeVO", planeVO);
		return "customer/airportReserve/reserveDetail";
	}
	
	@GetMapping("/ticketing")
	@ResponseBody
	public List<TicketingVO> scNoFirst(@RequestParam(name = "scNo") int scNo) {
		List<TicketingVO> tkInfo = airportService.tkInfoOne(scNo);
		return tkInfo;
	}
	
	@PostMapping("/reserve/payment")
	@ResponseBody
	public String paymentAjax(@RequestBody List<PlaneScheduleVO> planeVO, RedirectAttributes ra) {
		log.info("planeVO ::" + planeVO);
		plane = planeVO;
		return "";
	}
	static List<PlaneScheduleVO> plane;
	
	@GetMapping("/reserve/payment")
	public String payment(Model model, HttpServletRequest req) {
		List<PlaneScheduleVO> planeVO = plane;
		if(plane.size() > 1) {
			planeVO.get(0).setScNo2(planeVO.get(1).getScNo());	
		}
		
		List<PlaneScheduleVO> pVO = airportService.payment(planeVO.get(0));
		
		HttpSession session = req.getSession();
		LoginCustomerVO loginUser = (LoginCustomerVO)session.getAttribute("SessionInfo");
		
		String uuid = UUID.randomUUID().toString();
		model.addAttribute("planeVO", planeVO);
		model.addAttribute("pVO", pVO);
		model.addAttribute("uuid", uuid);
		model.addAttribute("loginUser", loginUser);
		return "customer/airportReserve/payment";
	}
	
	@PostMapping("/reserve/pay")
	public String pay(HttpServletRequest req, Model model, TicketingVO ticketVO) {
		HttpSession session = req.getSession();
		LoginCustomerVO loginUser = (LoginCustomerVO)session.getAttribute("SessionInfo");
		
		// tkVO 넣는 로직 짜면됨.
		for(int i = 0 ; i < ticketVO.getTkVO().size() ; i++) {
			ticketVO.getTkVO().get(i).setCusNo(loginUser.getCusNo());
		}
		log.info("tk :: "+ticketVO);
		airportService.insertTicket(ticketVO);
		
		return "redirect:/customer/main";
	}
	
}
