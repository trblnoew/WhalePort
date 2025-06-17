package kr.or.ddit.management;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.util.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user")
public class QRManagementController {
	
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_HUMAN', 'ROLE_INFO', 'ROLE_PARTNER', 'ROLE_SERVICE')")
	@GetMapping("/myqr")
	public String myqr(String empId, Model model) {
		log.info("myqr()실행...!");
		CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	       LoginCommonVO loginCommonVO = auth.getMember();
	       log.info("loginCommonVO ::: " + loginCommonVO);
		model.addAttribute("employeeVO",loginCommonVO);
		return "user/myqr";
	}
	
	

}
