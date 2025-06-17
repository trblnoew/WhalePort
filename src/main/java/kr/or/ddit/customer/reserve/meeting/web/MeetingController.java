package kr.or.ddit.customer.reserve.meeting.web;

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
import kr.or.ddit.customer.reserve.meeting.service.IMeetingService;
import kr.or.ddit.customer.reserve.meeting.vo.MeetingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer/reserve/meeting")
public class MeetingController {

	@Inject
	private IMeetingService service;
	
	@GetMapping("/list")
	public String meetingList(Model model) {
		log.info("meetingList() 실행...!");
		List<MeetingVO> meetingList = service.list();
		model.addAttribute("meetingList", meetingList);
		return "customer/reserve/meetingList";
	}
	
	@PostMapping("/registerForm")
	public String meetingForm(MeetingVO meetingVO, Model model,HttpServletRequest req, RedirectAttributes ra) {
		log.info("meetingForm() 실행...!");
		String goPage = "";
		int mrNo = meetingVO.getMrNo();
		
		MeetingVO meetingVO2 = service.select(mrNo);
		meetingVO2.setMrrDate(meetingVO.getMrrDate());
		meetingVO2.setMrrTime(meetingVO.getMrrTime());
		
		model.addAttribute("meetingVO", meetingVO2);
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
			goPage = "customer/reserve/meetingRegister";
		}
		return goPage;
	}
	
	
	@PostMapping("/register")
	public String meetingRegister(MeetingVO meetingVO, Model model, RedirectAttributes ra,HttpServletRequest req) {
		log.info("meetingRegister() 실행...!");
		HttpSession session = req.getSession();
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		int cusNo =  loginCustomerVO.getCusNo();
		meetingVO.setCusNo(cusNo);
		service.register(meetingVO);
		ra.addFlashAttribute("msg", "결제");
		ra.addFlashAttribute("message", "결제가 완료되었습니다!");
		return "redirect:/customer/reserve/meeting/list";
	}
	
	
	@PostMapping("/checkin")
	@ResponseBody
	public List<MeetingVO> check(@RequestBody MeetingVO meetingVO) {
		List<MeetingVO> check = service.check(meetingVO);
		
		return check;
	}
}
