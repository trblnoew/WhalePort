package kr.or.ddit.management.airService.customerManagement.web;


import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.management.airService.customerManagement.service.ICustomerService;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
@RequestMapping("/management/customer")
public class CustomerManagementController {
	
	@Inject
	private ICustomerService cusService;
	
	// 공항서비스관리 > 회원관리(회원 목록)
	@GetMapping("/list")
	public String cusList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "id") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String selectedItem,
			Model model
			) {
		log.info("cusList()실행...!");
		
		PaginationVO<LoginCustomerVO> pagingVO = new PaginationVO<LoginCustomerVO>(10,5);
		
		// 라인 차트
		List<Integer> lineChart = cusService.lineChart();
		
		// 바 차트
		List<Integer> barChart = cusService.barChart();
		
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
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = cusService.selectCusCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<LoginCustomerVO> dataList = cusService.selectCusList(pagingVO);
		pagingVO.setDataList(dataList);
		
		// 회원가입 고객수, 현재 고객수, 탈퇴 고객수
		int currentCount = cusService.currentCount(); 	// 현재 고객 수 
		int totalCount = cusService.totalCount(); 		// 회원가입한 고객 수 (탈퇴 포함)
		int quitCount = totalCount - currentCount;
		int maleCount = cusService.maleCount();	// 남성 고객수
		int femaleCount = cusService.femaleCount();	// 여성 고객수
		
		LoginCustomerVO customerVO = new LoginCustomerVO();
		customerVO.setCurrentCount(currentCount);
		customerVO.setTotalCount(totalCount);
		customerVO.setQuitCount(quitCount);
		customerVO.setMaleCount(maleCount);
		customerVO.setFemaleCount(femaleCount);
		
		
		model.addAttribute("customerVO", customerVO);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("lineChart", lineChart);
		model.addAttribute("barChart", barChart);
		model.addAttribute("totalCount", totalCount);
		
		model.addAttribute("cusDetailActive", "active");
		return "management/customerManagement/customerList";
	}
	
	@GetMapping("/detail")
	public String cusDetail(int cusNo, Model model  ) {
		log.info("cusDetail()실행...!");
		LoginCustomerVO cusVO = cusService.selectCustomer(cusNo);
		model.addAttribute("cusVO", cusVO);
		model.addAttribute("cusDetailActive", "active");
		return "management/customerManagement/customerDetail";
	}
	
	@PostMapping("/upate")
	public String cusUpdate(LoginCustomerVO cusVO, RedirectAttributes ra, Model model) {
		log.info("cusUpdate()실행...!");
		String goPage = "";
		int result = cusService.cusUpdate(cusVO);
		if(result > 0) {
			ra.addFlashAttribute("msg", "수정완료");
			ra.addFlashAttribute("message", "수정을 완료하였습니다.");
			goPage = "redirect:/management/customer/list";
		}else {
			ra.addFlashAttribute("msg", "오류");
			ra.addFlashAttribute("message", "서버에러, 다시 시도해주세요.");
			model.addAttribute("cusVO", cusVO);
			goPage = "management/customerManagement/customerDetail";
		}
		return goPage;
	}
	
	@PostMapping("/delete")
	public String cusDelete(LoginCustomerVO cusVO, RedirectAttributes ra, Model model) {
		log.info("cusDelete()실행...!");
		String goPage = "";
		int result = cusService.cusDelete(cusVO.getCusNo());
		if(result > 0) {
			ra.addFlashAttribute("msg", "삭제완료");
			ra.addFlashAttribute("message", "삭제 완료하였습니다.");
			goPage = "redirect:/management/customer/list";
		}else {
			ra.addFlashAttribute("msg", "오류");
			ra.addFlashAttribute("message", "서버에러, 다시 시도해주세요.");
			goPage = "redirect:/management/customer/detail?cusNo="+cusVO.getCusNo();
			
		}
		return goPage;
	}

	// 리스트 엑셀 파일로 다운로드
	@PostMapping("/excelDown")
	public void excelDownload(
			HttpServletResponse resp, 
			@RequestParam(required = false, defaultValue = "id") String searchType,
			@RequestParam(required = false) String searchWord, 
			Model model	
			) throws IOException{
		
		model.addAttribute("cusDetailActive", "active");
		
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		org.apache.poi.ss.usermodel.Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("customerList");
		
//		List<LoginCustomerVO> customerList = cusService.selectCustomerList(searchWord,searchType);
		List<LoginCustomerVO> customerList = cusService.selectCustomerList();
		
		//첫행   열 이름 표기 
		int cellCount=0;
		row = sheet.createRow(0); //0번째 행
		cell=row.createCell(cellCount++);
		cell.setCellValue("고객 게사판 번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("고객 탈퇴여부");
		cell=row.createCell(cellCount++);
		cell.setCellValue("고객 아이디");
		cell=row.createCell(cellCount++);
		cell.setCellValue("고객 이름");
		cell=row.createCell(cellCount++);
		cell.setCellValue("고객 이메일");
		cell=row.createCell(cellCount++);
		cell.setCellValue("고객 핸드폰 번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("고객 성별");
		cell=row.createCell(cellCount++);
		cell.setCellValue("마케팅 수신여부");
		
		for(int i=0; i < customerList.size() ; i++  ) {
			row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
			cellCount=0; //열 번호 초기화
			cell=row.createCell(cellCount++);
			cell.setCellValue(customerList.get(i).getCusNo()); //고객 게시판 번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(customerList.get(i).getCusDelyn()); // 고객 탈퇴 여부
			cell=row.createCell(cellCount++);
			cell.setCellValue(customerList.get(i).getCusId()); // 고객 아이디
			cell=row.createCell(cellCount++);
			cell.setCellValue(customerList.get(i).getCusName());	// 고객 이름
			cell=row.createCell(cellCount++);
			cell.setCellValue(customerList.get(i).getCusEmail());	// 고객 이메일
			cell=row.createCell(cellCount++);
			cell.setCellValue(customerList.get(i).getCusTel());		// 고객 핸드폰 번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(customerList.get(i).getCusGender());	// 고객 성별
			cell=row.createCell(cellCount++);
			cell.setCellValue(customerList.get(i).getCusSend());	// 마케팅 수신여부
		}
		// 컨텐츠 타입과 파일명 지정
		resp.setContentType("ms-vnd/excel");
		resp.setHeader("Content-Disposition", "attachment;filename=customerList.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(resp.getOutputStream());
	}
}
