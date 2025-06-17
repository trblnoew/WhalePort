package kr.or.ddit.management.human.management.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.login.vo.LoginCommonAuthVO;
import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.management.human.management.service.IManagementService;
import kr.or.ddit.management.human.management.vo.EmployeeVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management")
public class ManagementController {

	@Inject
	private IManagementService managementService;
	
	// 직원 등록 기능
	@PostMapping("/register")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_HUMAN')")
	public String empRegister(
			HttpServletRequest req, EmployeeVO employeeVO, Model model, RedirectAttributes ra) {
		log.info("empRegister() 실행...!");
		String goPage = "";
		
		int result = managementService.empRegister(req, employeeVO);
		if(result > 0) {
			ra.addFlashAttribute("msg", "등록 완료");
			ra.addFlashAttribute("message", "직원 등록을 완료하였습니다!");
			goPage = "redirect:/management/list";
		}else {
			model.addAttribute("msg", "오류");
			model.addAttribute("message", "다시 시도해주세요!");
			model.addAttribute("employeeVO", employeeVO);
			goPage = "management/register";
		}
		
		return goPage;
	}
	
	// 직원 등록 폼 페이지
	@GetMapping("/registerForm")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_HUMAN')")
	public String empRegisterForm(Model model) {
		model.addAttribute("empListActive", "active");
		return "management/management/registerForm";
	}
	
	// 직원 목록 조회 페이지
	@GetMapping("/list")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_HUMAN')")
	public String empList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "all") String searchType,
			@RequestParam(required = false) String selectedItem,
			@RequestParam(required = false) String searchWord,
			Model model) {
		log.info("empList() 실행...!");
//		List<EmployeeVO> empList = managementService.empList();
//		model.addAttribute("empList" ,empList);
		
		PaginationVO<EmployeeVO> pagingVO = new PaginationVO<EmployeeVO>(10,5);
		EmployeeVO countVO = managementService.count();
		
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
		int totalRecord = managementService.selectEmpCount(pagingVO);
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord);
		// 총 게시글 수 및 총 페이지 수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<EmployeeVO> dataList = managementService.selectEmpList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("countVO", countVO);
		
		model.addAttribute("empListActive", "active");
		return "management/management/empList";
	}
	
	// 직원 상세보기 
	@GetMapping("/empDetail")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_HUMAN')")
	public String empDetail(@RequestParam(value = "empId") String empId, Model model) {
		log.info("empDetail() 실행...!");
		EmployeeVO employeeVO = managementService.empDetail(empId);
		model.addAttribute("employeeVO", employeeVO);
		log.info("employeeVO::::"+employeeVO);
		model.addAttribute("empListActive", "active");
		return "management/management/empDetail";
	}
	
	// 직원 정보 수정 화면
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_HUMAN')")
	@GetMapping("/updateForm")
	public String empUpdateForm(String empId, Model model) {
		log.info("empUpdate()실행...!");
		EmployeeVO employeeVO = managementService.empDetail(empId);
		model.addAttribute("employeeVO", employeeVO);
		model.addAttribute("status", "u");
		model.addAttribute("empListActive", "active");
		return "management/management/empUpdate";
	}
	// 직원 정보 수정 기능
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_HUMAN')")
	@PostMapping("/update")
	public String empUpdate(EmployeeVO employeeVO, LoginCommonAuthVO authVO, Model model) {
		log.info("empUpdate()실행...!");
		managementService.empUpdate(employeeVO);
		//model.addAttribute("msg", "수정이 완료되었습니다!");
		return "redirect:/management/empDetail?empId=" + employeeVO.getEmpId();
	}
	
	// 직원 정보 삭제 기능
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_HUMAN')")
	@PostMapping("/delete")
	public String empDelete(String empId, EmployeeVO employeeVO, Model model, RedirectAttributes ra) {
		log.info("empDelete()실행...!");
		managementService.empDelete(empId);
		ra.addFlashAttribute("msg", "삭제");
		ra.addFlashAttribute("msg", "삭제가 완료되었습니다.");
		return "redirect:/management/empDetail?empId=" + employeeVO.getEmpId();
	}
	
	
	// 리스트 엑셀 파일로 다운로드
	@PostMapping("/excelDown")
	public void excelDownload(
			HttpServletResponse resp, 
			@RequestParam(required = false, defaultValue = "name") String searchType,
			@RequestParam(required = false) String searchWord, 
			Model model	
			) throws IOException{
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		org.apache.poi.ss.usermodel.Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("employeeList");
		
//		List<EmployeeVO> employeeList = managementService.selectEmployeeList(searchWord,searchType);
		List<EmployeeVO> employeeList = managementService.selectEmployeeList();
		
		//첫행   열 이름 표기 
		int cellCount=0;
		row = sheet.createRow(0); //0번째 행
		cell=row.createCell(cellCount++);
		cell.setCellValue("게사판 번호");
		cell=row.createCell(cellCount++);
		cell.setCellValue("이름");
		cell=row.createCell(cellCount++);
		cell.setCellValue("사번");
		cell=row.createCell(cellCount++);
		cell.setCellValue("입사일");
		cell=row.createCell(cellCount++);
		cell.setCellValue("부서");
		cell=row.createCell(cellCount++);
		cell.setCellValue("직위");
		cell=row.createCell(cellCount++);
		cell.setCellValue("승인여부");
		
		for(int i=0; i < employeeList.size() ; i++  ) {
			row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
			cellCount=0; //열 번호 초기화
			cell=row.createCell(cellCount++);
			cell.setCellValue(employeeList.get(i).getEmpNo()); //게사판 번호
			cell=row.createCell(cellCount++);
			cell.setCellValue(employeeList.get(i).getEmpName()); // 이름
			cell=row.createCell(cellCount++);
			cell.setCellValue(employeeList.get(i).getEmpId()); // 사번
			cell=row.createCell(cellCount++);
			cell.setCellValue(employeeList.get(i).getEmpStartdate());	// 입사일
			cell=row.createCell(cellCount++);
			cell.setCellValue(employeeList.get(i).getEmpDept());	// 부서
			cell=row.createCell(cellCount++);
			cell.setCellValue(employeeList.get(i).getEmpPosition());		// 승인여부
			cell=row.createCell(cellCount++);
			cell.setCellValue(employeeList.get(i).getEmpApproval());	// 고객 성별
		}
		
		

		// 컨텐츠 타입과 파일명 지정
		resp.setContentType("ms-vnd/excel");
		resp.setHeader("Content-Disposition", "attachment;filename=employeeList.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(resp.getOutputStream());
	}
	
	
	
}
