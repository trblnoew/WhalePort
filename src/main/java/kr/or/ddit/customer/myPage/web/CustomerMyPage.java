package kr.or.ddit.customer.myPage.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.customer.myPage.service.CustomerMyPageService;
import kr.or.ddit.customer.myPage.vo.CustomerMyPageVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer")
public class CustomerMyPage {

	@Inject
	private CustomerMyPageService service;
	
	// 고객 마이페이지 (내 정보 및 모든 예약내역)
	@GetMapping("/myPage")
	public String myPage(HttpServletRequest req, Model model) {
		log.info("CustomerMyPage myPage() 실행...!");
		// HttpSession : 로그인 처리 후 세션 정보에서 얻어온 회원 정보를 활용하기 위한 준비
		HttpSession session = req.getSession();
		// SessionInfo : 키를 이용하여 세션에서 회원정보 가져오기
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		
		log.info("loginCustomerVO : " + loginCustomerVO);
		String cusId= loginCustomerVO.getCusId();
		int cusNo = loginCustomerVO.getCusNo();
		// 내 정보 보기
		CustomerMyPageVO customerVO = service.myInfomation(cusId);
		model.addAttribute("customerVO", customerVO);
		// 각 예약 내역의 갯수 조회
		Map<String, Integer> myReserveCountMap = service.myReserveCount(cusId);
		model.addAttribute("myReserveCount", myReserveCountMap);
		// 주차예약 내역
		CustomerMyPageVO myParkingVO = service.myParkingReserve(cusId);
		model.addAttribute("myParkingVO", myParkingVO);
		// 호텔예약 내역
		CustomerMyPageVO myHotelVO = service.myHotelReserve(cusId);
		model.addAttribute("myHotelVO", myHotelVO);
		// 라운지예약 내역
		CustomerMyPageVO myRoungeVO = service.myRoungeReserve(cusId);
		model.addAttribute("myRoungeVO", myRoungeVO);
		// 항공권 예약 내역
		List<CustomerMyPageVO> myTicketingVO = service.myTicketing(cusId);
		model.addAttribute("myTicketingVO", myTicketingVO);
		
//		List<CustomerMyPageVO> departIcKr = service.departIcKr(cusId);
//		model.addAttribute("departIcKr",departIcKr);
//		List<CustomerMyPageVO> arrivalIcKr = service.arrivalIcKr(cusId);
//		model.addAttribute("arrivalIcKr",arrivalIcKr);
		
		
//		if(myTicketingVO.size() != 0) {
//			// 출발티켓의 출발지 (나라)표기
//			if(myTicketingVO.get(0) != null) {
//				String departIcKr = service.departIcKr(myTicketingVO.get(0));
//				model.addAttribute("departIcKr",departIcKr);
//				// 출발티켓의 도착지 (나라)표기
//				String arrivalIcKr = service.arrivalIcKr(myTicketingVO.get(0));
//				model.addAttribute("arrivalIcKr",arrivalIcKr);
//			}
//			if(myTicketingVO.get(1) != null) {
//				// 도착티켓의 출발지 (나라)표기
//				String departIcKr2 = service.departIcKr(myTicketingVO.get(1));
//				model.addAttribute("departIcKr2",departIcKr2);
//				// 도착티켓의 도착지 (나라)표기
//				String arrivalIcKr2 = service.arrivalIcKr(myTicketingVO.get(1));
//				model.addAttribute("arrivalIcKr2",arrivalIcKr2);
//			}
//		}

		return "customer/myPage/customerProfile";
	}
	
	// 예약 취소
	@PostMapping("/myReserveDelete")
	public String myReserveDelete(CustomerMyPageVO customerVO, Model model, RedirectAttributes ra) {
		log.info("myReserveDelete() 실행...!");
		// 주차 예약 취소
		service.myParkingReserveDelete(customerVO);
		// 호텔 예약 취소
		service.myHtReserveDelete(customerVO);
		// 라운지 예약 취소
		service.myRrReserveDelete(customerVO);
		// 항공권 예약 취소(1건)
		service.myTicketingDelete(customerVO);
		
		int prNo = customerVO.getPrNo(); // 주차예약번호
		int hrNo = customerVO.getHrNo(); // 호텔예약번호
		int rrNo = customerVO.getRrNo(); // 라운지예약번호
		int tkNo = customerVO.getTkNo(); // 항공권예약번호
		
		if(prNo != 0) {
			ra.addFlashAttribute("msg", "주차 예약 취소 완료!");
			ra.addFlashAttribute("message","주차 예약이 취소되었습니다.");
		}
		if(hrNo != 0) {
			ra.addFlashAttribute("msg", "호텔 예약 취소 완료!");
			ra.addFlashAttribute("message","호텔 예약이 취소되었습니다.");
		}
		if(rrNo != 0) {
			ra.addFlashAttribute("msg","라운지 예약 취소 완료!");
			ra.addFlashAttribute("message","라운지 예약이 취소되었습니다.");
		}
		if(tkNo != 0) {
			ra.addFlashAttribute("msg", "선택한 항공권 예약 취소 완료!");
			ra.addFlashAttribute("message", "항공권 예약이 취소되었습니다.");
		}
		
		return "redirect:/customer/myPage";
	}
	
	// 호텔 예약 취소
//	@PostMapping("/myHtDelete")
//	public String myHotelReserveDelete(CustomerMyPageVO customerVO, Model model, RedirectAttributes ra) {
//		log.info("myHotelReserveDelete() 실행...!");
//		service.myHtReserveDelete(customerVO);
//		ra.addFlashAttribute("msg", "호텔 예약 취소 완료!");
//		ra.addFlashAttribute("message","호텔 예약이 취소되었습니다.");
//		return "redirect:/customer/myPage"; 
//	}
	
	// 내 정보 수정
	@PostMapping("/myInfoUpdate")
	public String myInfoUpdate(CustomerMyPageVO customerVO, Model model, RedirectAttributes ra) {
		log.info("myInfoUpdate()실행...!");
		service.myInfoUpdate(customerVO);
		ra.addFlashAttribute("message", "수정이 완료되었습니다!");
		return "redirect:/customer/myPage";
	}
	
	// 여권 정보 수정
	@PostMapping("/myPassportUpdate")
	public String myPassportUpdate(CustomerMyPageVO customerVO, Model model, RedirectAttributes ra) {
		log.info("myPassportUpdate() 실행...!");
		service.myPassportUpdate(customerVO);
		ra.addFlashAttribute("msg", "여권 정보 수정 완료!");
		ra.addFlashAttribute("message", "수정이 완료되었습니다.");
		return "redirect:/customer/myPage";
	}
	
	// 내 게시글 조회(문의사항)
	@GetMapping("/myBoardList")
	public String myBoardList(@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, HttpServletRequest req, Model model
			) {
		log.info("myBoardList() 실행...!");

		PaginationVO<CustomerMyPageVO> pagingVO = new PaginationVO<CustomerMyPageVO>(10,5);
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			pagingVO.setSearchType(searchType);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("searchType", searchType);
		}
		HttpSession session = req.getSession();
		LoginCustomerVO loginCustomerVO = (LoginCustomerVO) session.getAttribute("SessionInfo");
		String cusId= loginCustomerVO.getCusId();
		// startRow, endRow, startPage, endPage를 결정한다.
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setCusId(cusId);
		// 총 게시글 수를 이용하여 총 페이지수를 결정하기 위해 총 게시글 수인 totalRecord를 얻어온다.
		int totalRecord = service.myBoardCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<CustomerMyPageVO> dataList = service.myBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("cusId", cusId);
		
		return "customer/myPage/myBoardList";
	}
	
}
