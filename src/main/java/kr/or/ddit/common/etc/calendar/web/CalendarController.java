package kr.or.ddit.common.etc.calendar.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.etc.calendar.service.ICalendarService;
import kr.or.ddit.common.etc.calendar.vo.CalendarVO;
import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.util.security.CustomUser;
import lombok.extern.slf4j.Slf4j;


/**
 * @author 최동재
 * 풀캘린더를 이용한 CRUD
 */
@Slf4j
@Controller
@RequestMapping("/common")
public class CalendarController {

	@Inject
	private ICalendarService calendarService;
	
	// 캘린더 페이지 이동
	@GetMapping("/calendar")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_INFO', 'ROLE_HUMAN', 'ROLE_SERVICE', 'ROLE_PARTNER')")
	public String calendarPages(Model model) {
		CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    LoginCommonVO loginCommonVO = auth.getMember();
	    log.info("loginCommonVO ::: " + loginCommonVO);
	    
	    CalendarVO calendarVO = new CalendarVO();
	    
	    int empNo = loginCommonVO.getEmpNo();
	    List<CalendarVO> calendar = calendarService.calendarList(calendarVO);
	    model.addAttribute("calendar", calendar);
		return "common/calendar/calendar";
	}
	
	// 캘린더 리스트 값
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
	        List<CalendarVO> calendar = calendarService.calendarList(calendarVO);
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



	// 일정 등록
	@PostMapping("/addEvent")
	public String addEvent(@RequestBody CalendarVO calendarVO, Model model) {
	    CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    LoginCommonVO loginCommonVO = auth.getMember();
	    log.info("loginCommonVO ::: " + loginCommonVO);
	    
	    int empNo = loginCommonVO.getEmpNo();
	    log.info("empNo ::: " + empNo);
	    calendarVO.setEmpNo(empNo);
	    
	    calendarService.addEvent(calendarVO);
	    return "redirect:/common/calendar";
	}
	
	// 일정 변경
	@PostMapping("/calendarUpdate")
	public String calendarUpdate(@RequestBody CalendarVO calendarVO, Model model) {
	    CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    LoginCommonVO loginCommonVO = auth.getMember();
	    log.info("loginCommonVO ::: " + loginCommonVO);
	    
	    int empNo = loginCommonVO.getEmpNo();
	    log.info("empNo ::: " + empNo);
	    calendarVO.setEmpNo(empNo);
	    
	    calendarService.calendarUpdate(calendarVO);
	    return "redirect:/common/calendar";
	}
	
	// 일정 삭제
	@PostMapping("/calendarDelete")
	public String calendarDelete(@RequestBody Map<String, Integer> param, Model model) {
		CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    LoginCommonVO loginCommonVO = auth.getMember();
	    
	    int empNo = loginCommonVO.getEmpNo();
		
		String goPage= "";
		
		int result = calendarService.calendarDelete(param.get("calNo"), empNo);
		
		if(result > 0) {
			goPage = "redirect:/common/calendar";
		}else {
			goPage = "redirect:/common/calendar";
		}
		return goPage;
	}
	
	// 캘린더 색깔 지정
	private String getColorByType(String calType) {
		// 기본 색상 설정(검정색)
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
}


