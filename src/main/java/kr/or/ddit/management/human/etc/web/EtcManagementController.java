package kr.or.ddit.management.human.etc.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.management.human.etc.service.IEtcManagementService;
import kr.or.ddit.management.human.etc.vo.EtcManagementVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/etc")
public class EtcManagementController {
	
	@Inject
	private IEtcManagementService service;

	// 직원 근태 현황 조회
	@GetMapping("/attendanceChart")
	public String attendanceChart(EtcManagementVO etcVO, Model model) {
		log.info("attendanceChart() 실행...!");
		
		// 근무시간
		List<EtcManagementVO> totalInfoWorkHours = service.totalInfoWorkHours(etcVO);  
		model.addAttribute("totalInfoWorkHours",totalInfoWorkHours);
		
		return "management/etc/attendanceChart";
	}
	
	

	
	
	
	

}
