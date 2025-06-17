package kr.or.ddit.customer.reserve.rounge.web;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.customer.reserve.rounge.service.IRoungeService;
import kr.or.ddit.customer.reserve.rounge.vo.RoungeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer/reserve/rounge")
public class RoungeController {

	@Inject
	private IRoungeService service;
	
	@GetMapping("/list")
	public String roungeList(Model model) {
		log.info("roungeList() 실행...!");
		List<RoungeVO> roungeList = service.list();
		model.addAttribute("roungeList", roungeList);
		return "customer/reserve/roungeList";
	}
	
	@GetMapping("/detail")
	public String roungeDetail(int rgNo, Model model) {
		log.info("roungeDetail() 실행...!");
		RoungeVO roungeVO = service.detail(rgNo);
		model.addAttribute("roungeVO", roungeVO);
		return "customer/reserve/roungeDetail";
	}
	
	@PostMapping("/registerForm")
	public String roungeForm(RoungeVO roungeVO, Model model,HttpServletRequest req, RedirectAttributes ra) {
		log.info("roungeForm() 실행...!");
		
		String goPage = "";
		model.addAttribute("roungeVO", roungeVO);
		
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
			goPage =  "customer/reserve/roungeRegister";
		}
		return goPage;
		
	}
	
	@PostMapping("/register")
	public String roungeRegister(RoungeVO roungeVO, Model model, RedirectAttributes ra,HttpServletRequest req) {
		log.info("roungeRegister() 실행...!");
		HttpSession session = req.getSession();
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		int cusNo =  loginCustomerVO.getCusNo();
		roungeVO.setCusNo(cusNo);
		service.register(roungeVO);
		ra.addFlashAttribute("msg", "결제");
		ra.addFlashAttribute("message", "결제가 완료되었습니다!");
		return "redirect:/customer/reserve/rounge/list";
	}
	
}

