package kr.or.ddit.management.human.management.mapper;

import java.util.List;

import kr.or.ddit.common.login.vo.LoginCommonAuthVO;
import kr.or.ddit.management.human.management.vo.EmployeeVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface ManagementMapper {
	public List<EmployeeVO> empList();
	public int empRegister(EmployeeVO employeeVO);
	public EmployeeVO empDetail(String empId);
	public void empUpdate(EmployeeVO employeeVO);
	public void empDelete(String empId);
	public int selectEmpCount(PaginationVO<EmployeeVO> pagingVO);
	public List<EmployeeVO> selectEmpList(PaginationVO<EmployeeVO> pagingVO);
	public void authUpdate(LoginCommonAuthVO authVO);
	public EmployeeVO count();
	
	//리스트 엑셀 다운로드를 위한 메소드
//	public List<EmployeeVO> selectEmployeeList(@Param("searchWord")  String searchWord, @Param("searchType") String searchType);
	public List<EmployeeVO> selectEmployeeList();

}
