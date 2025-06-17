package kr.or.ddit.management;


import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.common.mypage.service.IAttendanceService;
import kr.or.ddit.common.mypage.vo.EmpWorkVO;
import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.management.info.notice.service.IEmpNoticeService;
import kr.or.ddit.util.security.CustomUser;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author USER
 * 직원 메인 페이지
 */
@Controller
@Slf4j
@RequestMapping("/common")
public class MainHomeController {
	
	@Inject
	private IEmpNoticeService noticeService;
	
	@Inject
	private IAttendanceService attService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_HUMAN', 'ROLE_INFO', 'ROLE_PARTNER', 'ROLE_SERVICE')")
	@GetMapping("/home")
	public String home(String empId, Model model, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage) {
		log.info("home()실행...!");
		CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        LoginCommonVO loginCommonVO = auth.getMember();
        log.info("loginCommonVO ::: " + loginCommonVO);
		model.addAttribute("employeeVO",loginCommonVO);
		
		// 공지사항 리스트 출력
		PaginationVO<UserNoticeVO> pagingVO = new PaginationVO<UserNoticeVO>(5, 1);
		pagingVO.setCurrentPage(1);
		int totalRecord = noticeService.selectEmpNoticeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<UserNoticeVO> dataList = noticeService.selectEmpNoticeList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		
		// 근태현황 출력
	    EmpWorkVO empWorkVO = attService.selectEmpWork(loginCommonVO);
	    model.addAttribute("empWorkVO", empWorkVO);
		
		return "common/home";
	}
}
