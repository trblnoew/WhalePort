package kr.or.ddit.common.etc.calendar.service;

import java.util.List;

import kr.or.ddit.common.etc.calendar.vo.CalendarVO;

public interface ICalendarService {
	
	// 일정 조회 - 전체
	public List<CalendarVO> calendarList(CalendarVO calendarVO);
	
	// 일정 등록
	public void addEvent(CalendarVO calendarVO);
	
	// 일정 삭제
	public int calendarDelete(int calNo, int empNo);
	
	// 일정 변경
	public void calendarUpdate(CalendarVO calendarVO);
	
	// 일정 조회 - 부서별
//	public List<CalendarVO> calendarDeptList(String empDept);
	
	// 일정 조회 - 개인별
//	public List<CalendarVO> calendarOwnList(int empNo);

}
