package kr.or.ddit.management.human.management.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.common.login.vo.LoginCommonAuthVO;
import kr.or.ddit.management.human.management.vo.EmployeeVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IManagementService {
	public List<EmployeeVO> empList();
	public int empRegister(HttpServletRequest req, EmployeeVO employeeVO);
	public EmployeeVO empDetail(String empId);
	public void empUpdate(EmployeeVO employeeVO);
	public void empDelete(String empId);
	public int selectEmpCount(PaginationVO<EmployeeVO> pagingVO);
	public List<EmployeeVO> selectEmpList(PaginationVO<EmployeeVO> pagingVO);
	public EmployeeVO count();
	// 직원 리스트 엑셀 다운로드
//	public List<EmployeeVO> selectEmployeeList(String searchWord, String searchType);
	public List<EmployeeVO> selectEmployeeList();
	
}
