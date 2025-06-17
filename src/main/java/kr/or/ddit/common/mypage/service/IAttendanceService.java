package kr.or.ddit.common.mypage.service;

import java.util.List;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.common.mypage.vo.EmpWorkVO;

public interface IAttendanceService {

	// 출근 시간 sysdate로 삽입
	public int insertWorkArrive(EmpWorkVO empWorkVO);

	public EmpWorkVO selectWorkArrive(int workNo);

	// 직원 근태 현황 조회
	public EmpWorkVO selectEmpWork(LoginCommonVO loginCommonVO);

	// 퇴근 시간 sysdate로 삽입
	public int insertWorkLeave(EmpWorkVO empWorkVO);
//
//	public String selectWorkNo(int empNo);
//
//
//	public int inputAttendance(EmpWorkVO empWorkVO);
//
//	public int insertWorkToday(EmpWorkVO empWorkVO);

	public List<EmpWorkVO> attendanceMonth(EmpWorkVO empWorkVO);

	public EmpWorkVO attendanceMonth1(EmpWorkVO empWorkVO);

	public EmpWorkVO attendanceMonth2(EmpWorkVO empWorkVO);

	public EmpWorkVO attendanceMonth3(EmpWorkVO empWorkVO);

	public EmpWorkVO attendanceMonth4(EmpWorkVO empWorkVO);

	public EmpWorkVO attendanceMonth5(EmpWorkVO empWorkVO);

	public List<EmpWorkVO> attendanceMonthDetail(EmpWorkVO empWorkVO);

	public int insertTodayTime(EmpWorkVO empWorkVO);






}
