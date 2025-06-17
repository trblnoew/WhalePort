package kr.or.ddit.management.partner.airportSchedule.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.customer.airport.airportReserve.service.AirportReserveService;
import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.management.partner.airportSchedule.service.IAirportScheduleService;
import kr.or.ddit.management.partner.airportSchedule.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/airport")
public class AirportScheduleController {
	
	@Inject
	private IAirportScheduleService scheduleService;
	
	@GetMapping("/schedule")
	public String airlineSchedule(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			Model model) {
		

		PaginationInfoVO<PlaneScheduleVO> pagingVO = new PaginationInfoVO<PlaneScheduleVO>(10,5);
		
		if(StringUtils.isNotBlank(searchWord)) { 
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		int totalRecord = scheduleService.dataCnt(pagingVO);
		
		pagingVO.setCurrentPage(currentPage);
		List<PlaneScheduleVO> scData =  scheduleService.getData(pagingVO);
//		int totalRecord = scData.size();
		
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setDataList(scData);
		
		model.addAttribute("pagingVO", pagingVO);
		
		model.addAttribute("partnerActive", "active");
		model.addAttribute("airlineActive", "active");
		model.addAttribute("airlineScheduleActive", "active");

		return "management/partner/airportScheduleList";
	}
	

	@PostMapping("/getData")
	@ResponseBody
	public String data(@RequestBody PlaneScheduleVO planeVO) throws IOException {
		AirportReserveService air = new AirportReserveService();
		String airportCode = planeVO.getScBoarding();
		String cityCode = planeVO.getScArrived();
		String pageNo = planeVO.getPageNo();
		String data = air.international(airportCode, cityCode, pageNo);
		
		return data;
	}
	
	@PostMapping("/insertData")
	@ResponseBody
	public ResponseEntity<String> insertData(@RequestBody List<PlaneScheduleVO> planeVO){
		
		log.info("len :: "+planeVO.size());
		scheduleService.insert(planeVO);
		
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	@PostMapping("/schedule/commit")
	@ResponseBody
	public ResponseEntity<String> commitData(@RequestBody List<PlaneScheduleVO> planeVO){
		scheduleService.commitData(planeVO);
		
		return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
	}

}
