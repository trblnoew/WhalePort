package kr.or.ddit.management.info.info.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.etc.calendar.vo.CalendarVO;
import kr.or.ddit.management.human.management.vo.EmployeeVO;
import kr.or.ddit.management.info.info.mapper.InfoMapper;
import kr.or.ddit.management.info.info.service.IInfoService;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class InfoServiceImpl implements IInfoService {

	@Inject
	private InfoMapper mapper;
	
	@Override
	public List<EmployeeVO> empList() {
		log.info("# InfoServiceImpl list");
		return mapper.empList();
	}

	@Override
	public EmployeeVO empDetail(String empId) {
		log.info("# InfoServiceImpl detail");
		return mapper.empDetail(empId);
	}

	@Override
	public void empDeptUpdate(EmployeeVO employeeVO) {
		mapper.empDeptUpdate(employeeVO);
		
	}

	@Override
	public void empApproval(EmployeeVO employeeVO) {
		mapper.empApproval(employeeVO);
		
	}

	@Override
	public void empApprovalRe(EmployeeVO employeeVO) {
		mapper.empApprovalRe(employeeVO);
	}

	@Override
	public int selectEmpCount(PaginationVO<EmployeeVO> pagingVO) {
		return mapper.selectEmpCount(pagingVO);
	}

	@Override
	public List<EmployeeVO> selectEmpList(PaginationVO<EmployeeVO> pagingVO) {
		return mapper.selectEmpList(pagingVO);
	}

	@Override
	public EmployeeVO count() {
		return mapper.count();
	}
	
	// 전산관리 - 일정관리 조회
	@Override
	public List<CalendarVO> calendarList(CalendarVO calendarVO) {
		return mapper.calendarList(calendarVO);
	}

}
