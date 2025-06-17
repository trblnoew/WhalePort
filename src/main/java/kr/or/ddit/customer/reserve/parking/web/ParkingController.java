package kr.or.ddit.customer.reserve.parking.web;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.customer.reserve.parking.service.IParkingService;
import kr.or.ddit.customer.reserve.parking.vo.ParkingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer/reserve/parking")
public class ParkingController {


	@Inject
	private IParkingService service;
	
	@GetMapping("/list")
	public String parkingList(Model model) {
		log.info("parkingList() 실행...!");
		List<ParkingVO> parkingList = service.list();
		model.addAttribute("parkingList", parkingList);
		return "customer/reserve/parkingList";
	}
	
	@PostMapping("/registerForm")
	public String parkingForm(ParkingVO parkingVO, Model model,HttpServletRequest req, RedirectAttributes ra) {
		log.info("parkingForm() 실행...!");
		String goPage = "";
		int plNo = parkingVO.getPlNo();
		
		ParkingVO parkingVO2 = service.select(plNo);
		parkingVO2.setPrEntry(parkingVO.getPrEntry());
		parkingVO2.setPrExit(parkingVO.getPrExit());
		
		model.addAttribute("parkingVO", parkingVO2);
		HttpSession session = req.getSession();
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		
		if(loginCustomerVO == null ) {		
			ra.addFlashAttribute("msg", "알림");
			ra.addFlashAttribute("msg2", "warning");
			ra.addFlashAttribute("message", "로그인후 이용가능합니다.");
			goPage = "redirect:/customer/login";
		}else {
			String uuid = UUID.randomUUID().toString(); 
			model.addAttribute("uuid",uuid);
			goPage = "customer/reserve/parkingRegister";
		}
		return goPage;
	}
	
	
	@PostMapping("/register")
	public String parkingRegister(ParkingVO parkingVO, Model model, RedirectAttributes ra ,HttpServletRequest req) {
		log.info("parkingRegister() 실행...!");
		HttpSession session = req.getSession();
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		int cusNo =  loginCustomerVO.getCusNo();
		parkingVO.setCusNo(cusNo);
		service.register(parkingVO);
		ra.addFlashAttribute("msg", "결제");
		ra.addFlashAttribute("message", "결제가 완료되었습니다!");
		return "redirect:/customer/reserve/parking/list";
	}
	
	@ResponseBody
	@PostMapping("/checkin")
	public String check(@RequestBody ParkingVO parkingVO) {
		int cnt = service.check(parkingVO);		
		if(cnt >= 5) {				// 주차장 수용대수가 4개 일경우
			return "impossible"; 
		} else {
			return "possible";
		}
		
	}
	}