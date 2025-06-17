package kr.or.ddit.management.human.group.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/group")
public class GroupController {

	// 조직도
	@GetMapping("/orgChart")
	public String orgChart() {
		return "management/group/orgChart";
	}
}
