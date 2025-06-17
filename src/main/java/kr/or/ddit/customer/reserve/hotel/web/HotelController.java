package kr.or.ddit.customer.reserve.hotel.web;

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
import kr.or.ddit.customer.reserve.hotel.service.IHotelService;
import kr.or.ddit.customer.reserve.hotel.vo.HotelVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer/reserve/hotel")
public class HotelController {

	@Inject
	private IHotelService service;

	@GetMapping("/list")
	public String hotelList(Model model) {
		log.info("hotelList() 실행...!");
		List<HotelVO> hotelList = service.list();
		model.addAttribute("hotelList", hotelList);
		return "customer/reserve/hotelList";
	}

	@PostMapping("/registerForm")
	public String hotelForm(HotelVO hotelVO, Model model, HttpServletRequest req, RedirectAttributes ra) {
		log.info("hotelForm() 실행...!");
		String goPage = "";
		int htNo = hotelVO.getHtNo();

		HotelVO hotelVO2 = service.select(htNo);
		hotelVO2.setHrCheckin(hotelVO.getHrCheckin());

		model.addAttribute("hotelVO", hotelVO2);
		HttpSession session = req.getSession();
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		if (loginCustomerVO == null) {
			ra.addFlashAttribute("msg", "알림");
			ra.addFlashAttribute("msg2", "warning");
			ra.addFlashAttribute("message", "로그인후 이용가능합니다.");
			goPage = "redirect:/customer/login";
		} else {
			String uuid = UUID.randomUUID().toString();
			model.addAttribute("uuid", uuid);
			goPage = "customer/reserve/hotelRegister";
		}
		return goPage;
	}

	@PostMapping("/register")
	public String hotelRegister(HotelVO hotelVO, Model model, RedirectAttributes ra, HttpServletRequest req) {
		log.info("hotelRegister() 실행...!");
		HttpSession session = req.getSession();
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		int cusNo = loginCustomerVO.getCusNo();
		hotelVO.setCusNo(cusNo);
		service.register(hotelVO);
		ra.addFlashAttribute("msg", "결제");
		ra.addFlashAttribute("message", "결제가 완료되었습니다!");
		return "redirect:/customer/reserve/hotel/list";
	}

	@ResponseBody
	@PostMapping("/checkin")
	public String check(@RequestBody HotelVO hotelVO) {
		int cnt = service.check(hotelVO);
		String res = Integer.toString(5 - cnt);

		return res;
	}

}
