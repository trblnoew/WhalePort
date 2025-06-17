package kr.or.ddit.management.airService.customerManagement.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.customer.reserve.hotel.vo.HotelVO;
import kr.or.ddit.customer.reserve.meeting.vo.MeetingVO;
import kr.or.ddit.customer.reserve.parking.vo.ParkingVO;
import kr.or.ddit.customer.reserve.rounge.vo.RoungeVO;
import kr.or.ddit.management.airService.customerManagement.service.CustomerReserveService;
import kr.or.ddit.management.airService.customerManagement.service.IHotelReserveService;
import kr.or.ddit.management.airService.customerManagement.service.IMeetingReserveService;
import kr.or.ddit.management.airService.customerManagement.service.IParkingReserveService;
import kr.or.ddit.management.airService.customerManagement.service.IRoungeReserveService;
import kr.or.ddit.management.airService.customerManagement.vo.HotelReservationVO;
import kr.or.ddit.management.airService.customerManagement.vo.MeetingReservationVO;
import kr.or.ddit.management.airService.customerManagement.vo.ParkingReservationVO;
import kr.or.ddit.management.airService.customerManagement.vo.RoungeReservationVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/reserve")
public class CustomerReserveController {
	
	@Inject
	private IHotelReserveService service;
	
	@Inject
	private IRoungeReserveService service1;
	
	@Inject
	private IParkingReserveService service2;
	
	@Inject
	private IMeetingReserveService service3;
	
	@Inject
	private CustomerReserveService customerReserveService;
	
	
	// 호텔내역 조회
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SERVICE')")
	@GetMapping("/hotelList")
	public String hotelList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			Model model
			) {
		log.info("hotelList() 실행...!");

		PaginationVO<HotelVO> pagingVO = new PaginationVO<HotelVO>(10,5);
		HotelVO countVO = service.count1();
		
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
		int totalRecord = service.count(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<HotelVO> dataList = service.list(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("countVO", countVO);
		model.addAttribute("cusReserveActive", "active");
		model.addAttribute("hotelListActive", "active");
		return "management/reserve/hotelList";
	}
	
	// 호텔내역 상세 조회
//	@GetMapping("/hotelDetail")
//	public String hotelDetail(int hrNo, Model model) {
//		log.info("hotelDetail() 실행...!");
//		HotelVO hotelVO = service.detail(hrNo);
//		model.addAttribute("hotelVO", hotelVO);
//		return "management/reserve/hotelDetail";
//	}
//	
	// 호텔내역 승인
	@PostMapping("/hotelStatus")
	public String hotelStatus(HotelVO hotelVO, Model model, RedirectAttributes ra) {
		log.info("hotelStatus() 실행...!");
		service.status(hotelVO);
	    return "redirect:/management/reserve/hotelList";
	}
	
	// 호텔내역 수정 폼
//	@GetMapping("/hotelUpdate")
//	public String hotelUpdateForm(int hrNo, Model model) {
//		log.info("hotelUpdateForm() 실행...!");
//		HotelVO hotelVO = service.detail(hrNo);
//		model.addAttribute("hotelVO", hotelVO);
//		return "management/reserve/hotelUpdate";
//	}
//	
//	// 호텔내역 수정
//	@PostMapping("/hotelUpdate")
//	public String hotelUpdate(HotelVO hotelVO, Model model, RedirectAttributes ra) {
//		log.info("hotelUpdate() 실행...!");
//		service.update(hotelVO);
//		ra.addFlashAttribute("msg", "취소");
//		ra.addFlashAttribute("message", "예약이 취소되었습니다!");
//	    return "redirect:/management/reserve/hotelDetail?hrNo=" + hotelVO.getHrNo();
//	}
	
	
	// 호텔내역  리스트 엑셀 파일로 다운로드
	@PostMapping("/excelHotelDown")
	public void excelHotelDown(
			HttpServletResponse resp, 
			Model model	
			) throws IOException{
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		org.apache.poi.ss.usermodel.Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("hotelReserveList");
		
		List<HotelVO> hotelReserveList = service.selectHotelReserveList();
		
		//첫행   열 이름 표기 
		int cellCount=0;
		row = sheet.createRow(0); //0번째 행
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("객실");
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약자명");
		cell=row.createCell(cellCount++);
		cell.setCellValue("휴대번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("결제금액");
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약일시");
		cell=row.createCell(cellCount++);
		cell.setCellValue("상태");
		
		for(int i=0; i < hotelReserveList.size() ; i++  ) {
			row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
			cellCount=0; //열 번호 초기화
			cell=row.createCell(cellCount++);
			cell.setCellValue(hotelReserveList.get(i).getHrNo());  
			cell=row.createCell(cellCount++);
			cell.setCellValue(hotelReserveList.get(i).getHtName());  
			cell=row.createCell(cellCount++);
			cell.setCellValue(hotelReserveList.get(i).getHrName());  
			cell=row.createCell(cellCount++);
			cell.setCellValue(hotelReserveList.get(i).getHrTel());	 
			cell=row.createCell(cellCount++);
			cell.setCellValue(hotelReserveList.get(i).getHrCost());	 
			cell=row.createCell(cellCount++);
			cell.setCellValue(hotelReserveList.get(i).getHrDate());		 
			cell=row.createCell(cellCount++);
			cell.setCellValue(hotelReserveList.get(i).getHrStatus());	 
			
		}
		
		

		// 컨텐츠 타입과 파일명 지정
		resp.setContentType("ms-vnd/excel");
		resp.setHeader("Content-Disposition", "attachment;filename=hotelReserveList.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(resp.getOutputStream());
	}
			
	
	// 라운지내역 조회
	@GetMapping("/roungeList")
	public String roungeList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			Model model
			) {
		log.info("roungeList() 실행...!");

		PaginationVO<RoungeVO> pagingVO = new PaginationVO<RoungeVO>(10,5);
		RoungeVO countVO = service1.count1();
		
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
		int totalRecord = service1.count(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<RoungeVO> dataList = service1.list(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("countVO", countVO);
		model.addAttribute("cusReserveActive", "active");
		model.addAttribute("roungeListActive", "active");
		return "management/reserve/roungeList";
	}
	

	// 라운지내역 승인
	@PostMapping("/roungeStatus")
	public String roungeStatus(RoungeVO roungeVO, Model model, RedirectAttributes ra) {
		log.info("roungeStatus() 실행...!");
		service1.status(roungeVO);
	    return "redirect:/management/reserve/roungeList";
	}
	
	// 라운지내역 엑셀 파일로 다운로드
	@PostMapping("/excelRoungeDown")
	public void excelRoungeDown(
			HttpServletResponse resp, 
			Model model	
			) throws IOException{
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		org.apache.poi.ss.usermodel.Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("roungeReserveList");
		
		List<RoungeVO> roungeReserveList = service1.selectRoungeReserveList();
		
		//첫행   열 이름 표기 
		int cellCount=0;
		row = sheet.createRow(0); //0번째 행
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("이용권명");
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약자명");
		cell=row.createCell(cellCount++);
		cell.setCellValue("휴대번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("개수");
		cell=row.createCell(cellCount++);
		cell.setCellValue("결제금액");
		cell=row.createCell(cellCount++);
		cell.setCellValue("결제일시");
		cell=row.createCell(cellCount++);
		cell.setCellValue("상태");
		
		for(int i=0; i < roungeReserveList.size() ; i++  ) {
			row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
			cellCount=0; //열 번호 초기화
			cell=row.createCell(cellCount++);
			cell.setCellValue(roungeReserveList.get(i).getRrNo()); //예약번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(roungeReserveList.get(i).getRgName()); // 이용권명
			cell=row.createCell(cellCount++);
			cell.setCellValue(roungeReserveList.get(i).getRrName()); // 예약자명
			cell=row.createCell(cellCount++);
			cell.setCellValue(roungeReserveList.get(i).getRrTel());	// 휴대번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(roungeReserveList.get(i).getRrCount());	// 개수
			cell=row.createCell(cellCount++);
			cell.setCellValue(roungeReserveList.get(i).getRrCost());		// 결제금액
			cell=row.createCell(cellCount++);
			cell.setCellValue(roungeReserveList.get(i).getRrDate());	// 결제일시
			cell=row.createCell(cellCount++);
			cell.setCellValue(roungeReserveList.get(i).getRrStatus());	// 상태
			
		}
		
		// 컨텐츠 타입과 파일명 지정
		resp.setContentType("ms-vnd/excel");
		resp.setHeader("Content-Disposition", "attachment;filename=roungeReserveList.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(resp.getOutputStream());
	}
	
	
	
	
	// 주차장내역 조회
	@GetMapping("/parkingList")
	public String parkingList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			Model model
			) {
		log.info("parkingList() 실행...!");

		PaginationVO<ParkingVO> pagingVO = new PaginationVO<ParkingVO>(10,5);
		ParkingVO countVO = service2.count1();
		
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
		int totalRecord = service2.count(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<ParkingVO> dataList = service2.list(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("countVO", countVO);
		model.addAttribute("cusReserveActive", "active");
		model.addAttribute("parkingListActive", "active");
		return "management/reserve/parkingList";
	}
	
	
	// 주차장내역 승인
	@PostMapping("/parkingStatus")
	public String parkingStatus(ParkingVO parkingVO, Model model, RedirectAttributes ra) {
		log.info("parkingStatus() 실행...!");
		service2.status(parkingVO);
	    return "redirect:/management/reserve/parkingList";
	}
	
	// 주차장내역 엑셀 파일로 다운로드
	@PostMapping("/excelParkingDown")
	public void excelParkingDown(
			HttpServletResponse resp, 
			Model model	
			) throws IOException{
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		org.apache.poi.ss.usermodel.Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("parkingReserveList");
		
		List<ParkingVO> parkingReserveList = service2.selectParkingReserveList();
		
		//첫행   열 이름 표기 
		int cellCount=0;
		row = sheet.createRow(0); //0번째 행
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("유형");
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약자명");
		cell=row.createCell(cellCount++);
		cell.setCellValue("휴대번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("차량번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("입차일");
		cell=row.createCell(cellCount++);
		cell.setCellValue("출차일");
		cell=row.createCell(cellCount++);
		cell.setCellValue("결제금액");
		cell=row.createCell(cellCount++);
		cell.setCellValue("상태");
		
		for(int i=0; i < parkingReserveList.size() ; i++  ) {
			row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
			cellCount=0; //열 번호 초기화
			cell=row.createCell(cellCount++);
			cell.setCellValue(parkingReserveList.get(i).getPrNo()); //예약번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(parkingReserveList.get(i).getPlName()); // 유형
			cell=row.createCell(cellCount++);
			cell.setCellValue(parkingReserveList.get(i).getPrName()); // 예약자명
			cell=row.createCell(cellCount++);
			cell.setCellValue(parkingReserveList.get(i).getPrTel());	// 휴대번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(parkingReserveList.get(i).getPrCarno());	// 차량번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(parkingReserveList.get(i).getPrEntry());		// 입차일
			cell=row.createCell(cellCount++);
			cell.setCellValue(parkingReserveList.get(i).getPrExit());	// 출차일
			cell=row.createCell(cellCount++);
			cell.setCellValue(parkingReserveList.get(i).getPrCost());	// 결제금액
			cell=row.createCell(cellCount++);
			cell.setCellValue(parkingReserveList.get(i).getPrStatus());	// 상태
			
		}
		
		

		// 컨텐츠 타입과 파일명 지정
		resp.setContentType("ms-vnd/excel");
		resp.setHeader("Content-Disposition", "attachment;filename=parkingReserveList.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(resp.getOutputStream());
	}
	
	
	
	
	// 회의실내역 조회
	@GetMapping("/meetingList")
	public String meetingList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			Model model
			) {
		log.info("meetingList() 실행...!");

		PaginationVO<MeetingVO> pagingVO = new PaginationVO<MeetingVO>(10,5);
		MeetingVO countVO = service3.count1();
		
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
		int totalRecord = service3.count(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<MeetingVO> dataList = service3.list(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("countVO", countVO);
		model.addAttribute("cusReserveActive", "active");
		model.addAttribute("meetingListActive", "active");
		return "management/reserve/meetingList";
	}
	
	// 회의실내역 승인
	@PostMapping("/meetingStatus")
	public String meetingStatus(MeetingVO meetingVO, Model model, RedirectAttributes ra) {
		log.info("meetingStatus() 실행...!");
		service3.status(meetingVO);
	    return "redirect:/management/reserve/meetingList";
	}
	
	// 회의실내역 엑셀 파일로 다운로드
	@PostMapping("/excelMeetingDown")
	public void excelDownload(
			HttpServletResponse resp, 
			Model model	
			) throws IOException{
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		org.apache.poi.ss.usermodel.Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("meetingReserveList");
		
		List<MeetingVO> meetingReserveList = service3.selectMeetingReserveList();
		
		//첫행   열 이름 표기 
		int cellCount=0;
		row = sheet.createRow(0); //0번째 행
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("회의실명");
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약자명");
		cell=row.createCell(cellCount++);
		cell.setCellValue("휴대번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약일시");
		cell=row.createCell(cellCount++);
		cell.setCellValue("예약시간");
		cell=row.createCell(cellCount++);
		cell.setCellValue("결제금액");
		cell=row.createCell(cellCount++);
		cell.setCellValue("상태");
		
		for(int i=0; i < meetingReserveList.size() ; i++  ) {
			row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
			cellCount=0; //열 번호 초기화
			cell=row.createCell(cellCount++);
			cell.setCellValue(meetingReserveList.get(i).getMrrNo()); //예약번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(meetingReserveList.get(i).getMrName()); // 회의실명
			cell=row.createCell(cellCount++);
			cell.setCellValue(meetingReserveList.get(i).getMrrName()); //예약자명
			cell=row.createCell(cellCount++);
			cell.setCellValue(meetingReserveList.get(i).getMrrTel());	// 휴대번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(meetingReserveList.get(i).getMrrDate());	// 예약일시
			cell=row.createCell(cellCount++);
			cell.setCellValue(meetingReserveList.get(i).getMrrTime());		// 예약시간
			cell=row.createCell(cellCount++);
			cell.setCellValue(meetingReserveList.get(i).getMrrCost());	// 결제금액
			cell=row.createCell(cellCount++);
			cell.setCellValue(meetingReserveList.get(i).getMrrStatus());	// 상태
			
		}
		
		

		// 컨텐츠 타입과 파일명 지정
		resp.setContentType("ms-vnd/excel");
		resp.setHeader("Content-Disposition", "attachment;filename=meetingReserveList.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(resp.getOutputStream());
	}
	
	// 공항서비스 관리 - 시설 예약 관리 - 전체 현황
	@GetMapping("/reserveManagement")
	public String reserveManagement(Model model) {
		log.info("reserveManagement()...! 실행");
		model.addAttribute("cusReserveActive", "active");
		model.addAttribute("reserveManagementActive", "active");
		
		// 레디얼 차트 - 호텔 총 매출
		HotelReservationVO radialCapsuleHotel = customerReserveService.radialCapsuleHotel();
        model.addAttribute("radialCapsuleHotel", radialCapsuleHotel);
        log.info("호텔 매출 : " + radialCapsuleHotel);
        
        // 레디얼 차트 - 라운지 총 매출
        RoungeReservationVO radialRounge = customerReserveService.radialRounge();
        model.addAttribute("radialRounge", radialRounge);
        log.info("라운지 매출 : " + radialRounge);
        
        // 레디얼 차트 - 주차장 총 매출
        ParkingReservationVO radialParking = customerReserveService.radialParking();
        model.addAttribute("radialParking", radialParking);
        log.info("주차장 매출 : " + radialParking);
        
        // 레디얼 차트 - 회의실 총 매출
        MeetingReservationVO radialMeeting = customerReserveService.radialMeeting();
        model.addAttribute("radialMeeting", radialMeeting);
        log.info("회의실 매출 : " + radialMeeting);
		
		return "management/reserve/reserveManagement";
	}
}
