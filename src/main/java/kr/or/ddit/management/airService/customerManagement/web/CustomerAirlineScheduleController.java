package kr.or.ddit.management.airService.customerManagement.web;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.customer.airport.airportReserve.vo.TicketingVO;
import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.management.airService.customerManagement.service.ITicketingService;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/customer")
public class CustomerAirlineScheduleController {
	
	@Inject
	private ITicketingService ticketingService;
	
	// 공항서비스 관리 > 항공편 스케줄 안내(안 씀)
	@GetMapping("/airlineSchedule")
	public String airlineSchedule(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchWord,
			Model model
			) {
		log.info("airlineSchedule()실행...!");
		
		PaginationVO<TicketingVO> pagingVO = new PaginationVO<TicketingVO>(10,5);
		
		int totalCount = ticketingService.selectAllTicketing();			// 총 예약자 수
		int todayCount = ticketingService.selectTodayTicketing();		// 오늘 예약(오늘 이용하는 고객 수)
		int newCount = ticketingService.selectNewTicketingList();	// 새로운 예약(오늘 결제한 예약 고객 수)
		int cancelCount = ticketingService.selectCancelTicketingList();	// 예약 취소
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}

		
		List<Integer> preReserNum = ticketingService.preReserNum();	// 전달 예야건수
		List<Integer> thisReserNum = ticketingService.thisReserNum();	// 이번달 예약건수
        
		// startRow, endRow, startPage, endPage를 결정한다.
		pagingVO.setCurrentPage(currentPage);
		// 총 게시글 수를 이용하여 총 페이지수를 결정하기 위해 총 게시글 수인 totalRecord를 얻어온다.
		int totalRecord = ticketingService.selectTicketingCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<TicketingVO> dataList = ticketingService.selectTicketingList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("todayCount", todayCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("newCount", newCount);
		model.addAttribute("cancelCount", cancelCount);
		model.addAttribute("preReserNum", preReserNum);
		model.addAttribute("thisReserNum", thisReserNum);
		
		
		return "management/customerManagement/airlineSchedule";
	}
	
	// 공항서비스 관리 > 항공편 예약 관리 css
	@GetMapping("/airlineReserveList")
	public String airlineReserveList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			Model model
			) {
		
		log.info("airlineReserveList()실행...!");
		
		log.info("airlineReserveList->currentPage : " + currentPage);
		log.info("airlineReserveList->searchType : " + searchType);
		log.info("airlineReserveList->searchWord : " + searchWord);
		log.info("airlineReserveList->selectedItem : " + selectedItem);
		
		PaginationVO<TicketingVO> pagingVO = new PaginationVO<TicketingVO>(10,5);
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			pagingVO.setSearchType(searchType);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("searchType", searchType);
		}
		
		int totalCount = ticketingService.selectAllTicketing();			// 총 예약자 수
		int todayCount = ticketingService.selectTodayTicketing();		// 오늘 예약(오늘 이용하는 고객 수)
		int newCount = ticketingService.selectNewTicketingList();	// 새로운 예약(오늘 결제한 예약 고객 수)
		int cancelCount = ticketingService.selectCancelTicketingList();	// 예약 취소

		// 상태 필터링 추가
        if (StringUtils.isNotBlank(selectedItem)) {
            pagingVO.setSelectedItem(selectedItem);
            model.addAttribute("selectedItem", selectedItem);
        }
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}

		
		List<Integer> preReserNum = ticketingService.preReserNum(); 	//지난 달 예약 건수
		List<Integer> thisReserNum = ticketingService.thisReserNum();	// 이번 달 예약 건수
		
		List<TicketingVO> countryList = ticketingService.countryList();
        
		// startRow, endRow, startPage, endPage를 결정한다.
		pagingVO.setCurrentPage(currentPage);
		/*
		PaginationVO(totalRecord=0, totalPage=0, currentPage=1, screenSize=10, blockSize=5, 
		startRow=1, endRow=10, startPage=1, endPage=5, dataList=null, searchType=null, 
		searchWord=null, selectedItem=T, cusId=null)
		 */
		log.info("airlineReserveList->pagingVO : " + pagingVO);
		// 총 게시글 수를 이용하여 총 페이지수를 결정하기 위해 총 게시글 수인 totalRecord를 얻어온다.
		int totalRecord = ticketingService.selectTicketingCount(pagingVO);
		log.info("airlineReserveList->totalRecord : " + totalRecord);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		/*
		pagingVO2 : PaginationVO(totalRecord=25, totalPage=3, currentPage=1, screenSize=10, 
		blockSize=5, startRow=1, endRow=10, startPage=1, endPage=5, dataList=null,
		 searchType=null, searchWord=null, selectedItem=T, cusId=null)
		 */
		log.info("airlineReserveList->pagingVO2 : " + pagingVO);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<TicketingVO> dataList = ticketingService.selectTicketingList(pagingVO);
		log.info("airlineReserveList->dataList : " + dataList);
		pagingVO.setDataList(dataList);
		log.info("airlineReserveList->pagingVO3 : " + pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("todayCount", todayCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("newCount", newCount);
		model.addAttribute("cancelCount", cancelCount);
		model.addAttribute("preReserNum", preReserNum);
		model.addAttribute("thisReserNum", thisReserNum);
		model.addAttribute("countryList", countryList);
		
		model.addAttribute("airlineReserveDetailActive", "active");

		
		return "management/customerManagement/airlineReserveList";
	}
	
	@GetMapping("/airlineReserveDetail")
	public String airlineReserveDetail(int tkNo, Model model ) {
		log.info("airlineReserveDetail()실행...!");
		
		TicketingVO ticketingVO = ticketingService.selectAirlineReserve(tkNo);
		LoginCustomerVO customerVO = ticketingService.selectCustomer(ticketingVO.getCusNo());
		
		model.addAttribute("airlineReserveDetailActive", "active");
		model.addAttribute("ticketingVO", ticketingVO);
		model.addAttribute("customerVO", customerVO);
		
		
		return "management/customerManagement/airlineReserveDetail";
	}
	
	@GetMapping("/airlineReserveCancel")
	public String airlineReserveCancel(int tkNo, Model model, RedirectAttributes ra ) {
		log.info("airlineReserveCancel()실행...!");
		
		String goPage = "";

		int result = ticketingService.airlineReserveCancel(tkNo);
		
		if(result>0) {
			ra.addFlashAttribute("msg", "예약취소");
			ra.addFlashAttribute("message", "예약취소 완료하였습니다.");
			goPage = "redirect:/management/customer/airlineReserveList";
		}else {
			ra.addFlashAttribute("msg", "오류");
			ra.addFlashAttribute("message", "서버에러, 다시 시도해주세요.");
			goPage = "redirect:/management/customer/airlineReserveDetail?tkNo="+tkNo;
			
		}
		
		model.addAttribute("airlineReserveDetailActive", "active");
		
		return goPage;
	}
	
	
	
	
	
	
	

	

}














