package kr.or.ddit.management.info.info.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.etc.calendar.vo.CalendarVO;
import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.management.human.management.vo.EmployeeVO;
import kr.or.ddit.management.info.info.service.IInfoService;
import kr.or.ddit.util.security.CustomUser;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/info")
public class InfoController {

	@Inject
	private IInfoService infoService;
	
	// 등록신청한 직원 목록 페이지
	@GetMapping("/empInsertList")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO')")
	public String empInsertList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "name") String searchType,
			@RequestParam(required = false) String selectedItem,
			@RequestParam(required = false) String searchWord, Model model) {
		log.info("empInsertList() 실행...!");
		
		PaginationVO<EmployeeVO> pagingVO = new PaginationVO<EmployeeVO>(10,5);
		EmployeeVO countVO = infoService.count();
		
		//List<EmployeeVO> empList = infoService.empList();
		//model.addAttribute("empList" ,empList);
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			pagingVO.setSearchType(searchType);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("searchType", searchType);
		}
		
		 // 상태 필터링 추가
        if (StringUtils.isNotBlank(selectedItem)) {
            pagingVO.setSelectedItem(selectedItem);
            model.addAttribute("selectedItem", selectedItem);
        }
        
		
		// startRow, endRow, startPage, endPage를 결정한다.
		pagingVO.setCurrentPage(currentPage);
		// 총 게시글 수를 이용하여 총 페이지수를 결정하기 위해 총 게시글 수인 totalRecord를 얻어온다.
		int totalRecord = infoService.selectEmpCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<EmployeeVO> dataList = infoService.selectEmpList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("countVO", countVO);
		model.addAttribute("empInsertListActive", "active");

		
		return "management/info/empInsertList";
	}
	
	// 등록신청한 직원 상세보기 페이지
	@GetMapping("/empInsertDetail")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO')")
	public String empInsertDetail(String empId, Model model,RedirectAttributes ra) {
		log.info("empInsertDetail() 실행...!");
		EmployeeVO employeeVO = infoService.empDetail(empId);
		model.addAttribute("employeeVO",employeeVO);
		model.addAttribute("empInsertListActive", "active");
		return "management/info/empInsertDetail";
	}
	
	// 직원 부서(권한) 변경 기능
	@PostMapping("/deptUpdate")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO')")
	public String empDeptUpdate(EmployeeVO employeeVO, Model model) {
		log.info("empDeptUpdate() 실행...!");
		infoService.empDeptUpdate(employeeVO);
		return "redirect:/info/empInsertDetail?empId=" + employeeVO.getEmpId();
	}
	
	// 직원 등록 승인 기능
	@PostMapping("/empApproval")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO')")
	public String empApproval(EmployeeVO employeeVO, Model model) {
		log.info("empApproval() 실행...!");
		infoService.empApproval(employeeVO);
		return "redirect:/info/empInsertList";
	}
	
	// 직원 등록 반려 기능
	@PostMapping("/empApprovalRe")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO')")
	public String empApproval2(EmployeeVO employeeVO, Model model) {
		log.info("empApproval2() 실행...!");
		infoService.empApprovalRe(employeeVO);
		return "redirect:/info/empInsertList";
	}
	
	// 전산관리 - 일정관리 페이지 이동
	@GetMapping("/accessRight")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO')")
	public String accessRight() {
		log.info("accessRight() 실행...!");
		return "management/info/accessRight";
	}
	
	// 전산관리 - 접근권한 페이지 이동
	@GetMapping("/accessRight1")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO')")
	public String accessRight1() {
		log.info("accessRight1() 실행...!");
		return "management/info/accessRight1";
	}
	@GetMapping("/accessRight2")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO')")
	public String accessRight2(RedirectAttributes ra) {
		log.info("accessRight2() 실행...!");
		ra.addFlashAttribute("msg", "접근권한");
		ra.addFlashAttribute("message", "권한이 수정되었습니다!");
		return "redirect:/info/accessRight1";
	}
	
	// 전산관리 - 일정관리  리스트 값
	@ResponseBody
	@GetMapping("/calendarInfo")
	public ResponseEntity<Map<String, Object>> calendarList(@RequestParam(value = "calDiv", required = false) String calDiv) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	        LoginCommonVO loginCommonVO = auth.getMember();
	        log.info("loginCommonVO ::: " + loginCommonVO);
	        
	        CalendarVO calendarVO = new CalendarVO();
	        
	        int empNo = loginCommonVO.getEmpNo();
	        log.info("empNo ::: " + empNo);
	        
	        calendarVO.setEmpNo(empNo);
	        calendarVO.setCalDiv(calDiv);
	        List<CalendarVO> calendar = infoService.calendarList(calendarVO);
	        List<Map<String, Object>> result = new ArrayList<>();
	        
	        for (CalendarVO cal : calendar) {
	            Map<String, Object> map = new HashMap<>();
	            map.put("id", cal.getCalNo());
	            map.put("title", cal.getCalTitle());
	            map.put("start", cal.getCalStartdate());
	            map.put("end", cal.getCalEnddate());
	            map.put("color", getColorByType(cal.getCalType()));
	            map.put("calType", cal.getCalType());
	            map.put("calDiv", cal.getCalDiv());
	            
	            result.add(map);
	        }
	        
	        response.put("status", "success");
	        response.put("data", result);
	        response.put("message", "Calendar information retrieved successfully.");
	        
	        log.info("jsonArrCheck: {}", result);
	        return ResponseEntity.ok(response);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}
	
	// 전산관리 - 일정관리 캘린더 색깔 지정
	private String getColorByType(String calType) {
	    if (calType == null) {
	        return "#d1eff9"; 
	    }

	    switch (calType) {
	        case "Danger":
	            return "#f4bab9";
	        case "Success":
	            return "#d5f1d8";
	        case "Primary":
	            return "#bcbbf9";
	        case "Warning":
	            return "#fef7b4";
	        default:
	            return "#d1eff9";
	    }
	}
	
	
	
	
	//출입증발급
	@GetMapping("/qrqr")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO')")
	public String qrqr(EmployeeVO employeeVO, Model model, RedirectAttributes ra) {
		log.info("qrqr() 실행...!");
		ra.addFlashAttribute("message", "발급이 완료되었습니다!");
		return "redirect:/info/empInsertList";
	}
	

	
	
}
