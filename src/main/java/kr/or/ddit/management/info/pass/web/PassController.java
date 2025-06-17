package kr.or.ddit.management.info.pass.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.management.human.management.vo.EmployeeVO;
import kr.or.ddit.management.info.pass.service.IPassService;


@Controller
@RequestMapping("/pass")
public class PassController {

	@Inject
	private IPassService passService;
	
	// 출입증 상세화면 페이지
	@GetMapping("/accessCardDetail")
	public String accessCardDetail(String empId, Model model) {
		EmployeeVO employeeVO = passService.accessDetail(empId);
		model.addAttribute("employeeVO",employeeVO);
		model.addAttribute("empListActive", "active");
		return "management/pass/accessCardDetail";
	}
}
