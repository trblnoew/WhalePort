package kr.or.ddit.management.info.role.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	// 접근권한 관리 페이지
	@GetMapping("/accessControl")
	public String accessControl() {
		return "management/role/accessControl";
	}
	
	// 접근권한 수정 폼 페이지
	@GetMapping("/accessControlForm")
	public String accessControlForm() {
		return "management/role/accessControlForm";
	}
}
