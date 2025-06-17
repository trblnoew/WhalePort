package kr.or.ddit.common.mypage.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.common.mypage.service.IAttendanceService;
import kr.or.ddit.common.mypage.vo.EmpWorkVO;
import kr.or.ddit.util.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common")
public class AttendanceController {
	
	@Inject
	private IAttendanceService attService;
	
	static LoginCommonVO loginCommonVO;
	

	// 직원 근태 현황 조회
	@GetMapping("/attendance")
	public String attendance(Model model) {
		log.info("attendance()실행...!");
		CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		loginCommonVO = auth.getMember();
		//LoginCommonVO(empNo=1, empId=emp_test,...
	    log.info("loginCommonVO ::: " + loginCommonVO);
	    EmpWorkVO empWorkVO = attService.selectEmpWork(loginCommonVO);
	    model.addAttribute("empWorkVO", empWorkVO);
		return "common/myPage/attendanceSample"; //리턴값 바꿈
	}
	
	// 직원 근태 현황 css를 위한 깡통
	@GetMapping("/attendanceSample")
	public String attendanceSample(Model model) {
		log.info("attendanceSample()실행...!");
		CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		loginCommonVO = auth.getMember();
	    log.info("loginCommonVO ::: " + loginCommonVO);
	    EmpWorkVO empWorkVO = attService.selectEmpWork(loginCommonVO);
	    model.addAttribute("empWorkVO", empWorkVO);
	    return "common/myPage/attendance"; //리턴값 바꿈
	}
	
	// 출근 시간 입력
	@ResponseBody
	@GetMapping("/attendanceArrive")
	public ResponseEntity<EmpWorkVO> attendanceArrive(@RequestParam(name = "empNo", required = false, defaultValue = "0") int empNum ) {
		
		EmpWorkVO empWorkVO = new EmpWorkVO();
		if(empNum > 0) {
			empWorkVO.setEmpNo(empNum);
		} else {
			CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			loginCommonVO = auth.getMember();
			empWorkVO.setEmpNo(loginCommonVO.getEmpNo());
		}
		
		int result = attService.insertWorkArrive(empWorkVO); // sysdate로 출근 시간 삽입->workNo 사용가능
		
		if(result > 0) {
			empWorkVO = attService.selectWorkArrive(empWorkVO.getWorkNo());
		} else {
			empWorkVO = null;	
		}
		
		return new ResponseEntity<EmpWorkVO>(empWorkVO, HttpStatus.OK);
	}

	// 퇴근 시간 입력
//	@ResponseBody
//	@GetMapping("/attendanceLeave")
//	public ResponseEntity<EmpWorkVO> attendanceLeave() {
//		log.info("attendanceLeave()실행...!");
//		
//		CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		loginCommonVO = auth.getMember();
//		
//		EmpWorkVO empWorkVO = attService.selectEmpWork(loginCommonVO);
//		
//		int result = attService.insertWorkLeave(empWorkVO);
//		String status = "";
//		if(result > 0) {
//			status = "SUCCESS";
//		}else {
//			status = "FAIL";	
//		}
//		
//		return new ResponseEntity<EmpWorkVO>(empWorkVO, HttpStatus.OK);
//	}
	
	@ResponseBody
	@PostMapping("/attendanceLeave")
	public ResponseEntity<EmpWorkVO> attendanceLeave(@RequestBody EmpWorkVO empWorkVO) {
		log.info("attendanceLeave()실행...!");
		
		
		CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		loginCommonVO = auth.getMember();
		
		EmpWorkVO empWorkVO2 = attService.selectEmpWork(loginCommonVO);
		
		empWorkVO.setWorkNo(empWorkVO2.getWorkNo());
		int result2 =  attService.insertTodayTime(empWorkVO);

		int result = attService.insertWorkLeave(empWorkVO2);
		String status = "";
		if(result > 0) {
			status = "SUCCESS";
		}else {
			status = "FAIL";	
		}
		
		empWorkVO2.setTodayTime(empWorkVO.getTodayTime());
		
		
		return new ResponseEntity<EmpWorkVO>(empWorkVO2, HttpStatus.OK);
	}
	
	// 월별 근태 현황
	@ResponseBody
	@PostMapping("/attendanceMonth")
	public List<EmpWorkVO> attendanceMonth(@RequestBody EmpWorkVO empWorkVO) {
		log.info("attendanceMonth()실행...!");
		
		
		//근무 시작하는 첫번째 날
		
		List<EmpWorkVO> empWorkList = attService.attendanceMonth(empWorkVO);
		int empWorkListSize = empWorkList.size();
		String firstDate = empWorkList.get(empWorkListSize-1).getWorkArrive().split(" ")[0].replace("-", "/");
		String lastDate = empWorkList.get(0).getWorkArrive().split(" ")[0].replace("-", "/") ;
		String fistY = firstDate.split("/")[0];
		String fistM = firstDate.split("/")[1];
		String fistD = firstDate.split("/")[2];
		String lastY = lastDate.split("/")[0];
		String lastM = lastDate.split("/")[1];
		String lastD = lastDate.split("/")[2];
		
		// 첫째주
		int firstWeekEnd = Integer.parseInt(fistD)+4;
		empWorkVO.setDate1(firstDate);
		empWorkVO.setDate2(fistY+"/"+fistM+"/"+firstWeekEnd);
		EmpWorkVO empWork1 = attService.attendanceMonth1(empWorkVO);

		// 둘쨋주
		int twoWeekStart = Integer.parseInt(fistD)+7;
		int twoWeekEnd = firstWeekEnd+7;
		empWorkVO.setDate1(fistY+"/"+fistM+"/"+twoWeekStart);
		empWorkVO.setDate2(fistY+"/"+fistM+"/"+twoWeekEnd);
		EmpWorkVO empWork2 = attService.attendanceMonth2(empWorkVO);
		
		// 셋째주
		int threeWeekStart = twoWeekStart+7;
		int threeWeekEnd = twoWeekEnd+7;
		empWorkVO.setDate1(fistY+"/"+fistM+"/"+threeWeekStart);
		empWorkVO.setDate2(fistY+"/"+fistM+"/"+threeWeekEnd);
		EmpWorkVO empWork3 = attService.attendanceMonth3(empWorkVO);
		
		// 넷쨋주
		int fourWeekStart = threeWeekStart+7;
		int fourWeekEnd = threeWeekEnd+7;
		empWorkVO.setDate1(fistY+"/"+fistM+"/"+fourWeekStart);
		empWorkVO.setDate2(fistY+"/"+fistM+"/"+fourWeekEnd);
		EmpWorkVO empWork4 = attService.attendanceMonth4(empWorkVO);
		
		// 다섯째주
		EmpWorkVO empWork5 = null;
		if(empWorkList.size() > 20) {
			int fiveWeekStart = fourWeekStart+7;
			int fiveWeekEnd = fourWeekEnd+7;
			empWorkVO.setDate1(fistY+"/"+fistM+"/"+fiveWeekStart);
			empWorkVO.setDate2(fistY+"/"+fistM+"/"+fiveWeekEnd);
			empWork5 = attService.attendanceMonth5(empWorkVO);
			
		}
		
		List<EmpWorkVO> empWorkSumList= new ArrayList<EmpWorkVO>();
		
		if(empWork1 != null) empWorkSumList.add(empWork1);
		if(empWork2 != null) empWorkSumList.add(empWork2);
		if(empWork3 != null) empWorkSumList.add(empWork3);
		if(empWork4 != null) empWorkSumList.add(empWork4);
		if(empWork5 != null) empWorkSumList.add(empWork5);
		                     		
		log.info("empWorkSumList : "+empWorkSumList);
		log.info("List size :: " + empWorkSumList.size());
		
		return empWorkSumList;
	}
	
	// 주별 근태 현황
	@ResponseBody
	@PostMapping("/attendanceMonthDetail")
	public List<EmpWorkVO> attendanceMonthDetail(@RequestBody EmpWorkVO empWorkVO) {
		log.info("attendanceMonthDetail()실행...!");
		
		//근무 시작하는 첫번째 날
		
		List<EmpWorkVO> empWorkList = attService.attendanceMonth(empWorkVO);
		int empWorkListSize = empWorkList.size();
		String firstDate = empWorkList.get(empWorkListSize-1).getWorkArrive().split(" ")[0].replace("-", "/");
		String lastDate = empWorkList.get(0).getWorkArrive().split(" ")[0].replace("-", "/") ;
		String fistY = firstDate.split("/")[0];
		String fistM = firstDate.split("/")[1];
		String fistD = firstDate.split("/")[2];
		String lastY = lastDate.split("/")[0];
		String lastM = lastDate.split("/")[1];
		String lastD = lastDate.split("/")[2];
		
		int firstWeekEnd=0;
		int twoWeekStart = 0;
		int twoWeekEnd = 0;
		int threeWeekStart = 0;
		int threeWeekEnd = 0;
		int fourWeekStart= 0;
		int fourWeekEnd = 0;
		
		List<EmpWorkVO> empWorkDetailList = null;
		
		
		// 첫째주
		if(empWorkVO.getWeek()==1) {
			firstWeekEnd = Integer.parseInt(fistD)+4;
			empWorkVO.setDate1(firstDate);
			empWorkVO.setDate2(fistY+"/"+fistM+"/"+firstWeekEnd);
			empWorkDetailList = attService.attendanceMonthDetail(empWorkVO);
		}else if(empWorkVO.getWeek()==2) {
		// 둘쨋주
			twoWeekStart = Integer.parseInt(fistD)+7;
			twoWeekEnd = firstWeekEnd+7;
			empWorkVO.setDate1(fistY+"/"+fistM+"/"+twoWeekStart);
			empWorkVO.setDate2(fistY+"/"+fistM+"/"+twoWeekEnd);
			empWorkDetailList = attService.attendanceMonthDetail(empWorkVO);
		}else if(empWorkVO.getWeek()==3) {
			// 셋째주
			threeWeekStart = twoWeekStart+7;
			threeWeekEnd = twoWeekEnd+7;
			empWorkVO.setDate1(fistY+"/"+fistM+"/"+threeWeekStart);
			empWorkVO.setDate2(fistY+"/"+fistM+"/"+threeWeekEnd);
			empWorkDetailList = attService.attendanceMonthDetail(empWorkVO);
		}else if(empWorkVO.getWeek()==4) {
			// 넷쨋주
			 fourWeekStart = threeWeekStart+7;
			 fourWeekEnd = threeWeekEnd+7;
			empWorkVO.setDate1(fistY+"/"+fistM+"/"+fourWeekStart);
			empWorkVO.setDate2(fistY+"/"+fistM+"/"+fourWeekEnd);
			empWorkDetailList = attService.attendanceMonthDetail(empWorkVO);
		}else {
			// 다섯째주
			int fiveWeekStart = fourWeekStart+7;
			int fiveWeekEnd = fourWeekEnd+7;
			empWorkVO.setDate1(fistY+"/"+fistM+"/"+fiveWeekStart);
			empWorkVO.setDate2(fistY+"/"+fistM+"/"+fiveWeekEnd);
			empWorkDetailList = attService.attendanceMonthDetail(empWorkVO);
		}
		
	
		return empWorkDetailList;
	}
	
	
	
	
	

}
