package kr.or.ddit.management.info.info.service;

import java.util.List;

import kr.or.ddit.common.etc.calendar.vo.CalendarVO;
import kr.or.ddit.management.human.management.vo.EmployeeVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IInfoService {
	public List<EmployeeVO> empList();
	public EmployeeVO empDetail(String empId);
	public void empDeptUpdate(EmployeeVO employeeVO);
	public void empApproval(EmployeeVO employeeVO);
	public void empApprovalRe(EmployeeVO employeeVO);
	public int selectEmpCount(PaginationVO<EmployeeVO> pagingVO);
	public List<EmployeeVO> selectEmpList(PaginationVO<EmployeeVO> pagingVO);
	public EmployeeVO count();
	
	// 전산관리 - 일정관리 조회
	public List<CalendarVO> calendarList(CalendarVO calendarVO);

}
