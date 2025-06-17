package kr.or.ddit.partner.airline.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import freemarker.log.Logger;
import kr.or.ddit.customer.airport.airportReserve.vo.PlaneScheduleVO;
import kr.or.ddit.management.partner.airportSchedule.vo.PaginationInfoVO;
import kr.or.ddit.partner.airline.service.IAirlineService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner/airline")
public class airlineController {

	@Inject
	private IAirlineService airService;
	
	@GetMapping("/schedule")
	public String airlineSchedule(
			@RequestParam(name = "scStdate", required = false) String scStdate,
			@RequestParam(name = "scStd", required = false) String scStd,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		PaginationInfoVO<PlaneScheduleVO> pagingVO = new PaginationInfoVO<PlaneScheduleVO>(10,5);
		log.info("std :: " + scStd);
		log.info("stdate :: " + scStdate);
		
		if(scStd != null) {
			pagingVO.setScStd(scStd.replace("T", " "));	
		}
		if(scStdate != null) {	
			pagingVO.setScStdate(scStdate.replace("T", " "));
		}
		
		log.info("SCDATE :: " + pagingVO.getScStdate());
		log.info("SCD :: " + pagingVO.getScStd());
		pagingVO.setScAirline("ASIANA AIRLINE");
		
		int totalRecord = airService.dataCnt(pagingVO);
	
		
		pagingVO.setCurrentPage(currentPage);
		List<PlaneScheduleVO> pList = airService.getMySchedule(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setDataList(pList);
		
		model.addAttribute("pagingVO", pagingVO);
		return "partner/airline/airlineSchedule";
		
		
	}
}
