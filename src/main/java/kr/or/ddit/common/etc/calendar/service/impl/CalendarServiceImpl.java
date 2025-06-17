package kr.or.ddit.common.etc.calendar.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.etc.calendar.mapper.CalendarMapper;
import kr.or.ddit.common.etc.calendar.service.ICalendarService;
import kr.or.ddit.common.etc.calendar.vo.CalendarVO;
import kr.or.ddit.util.vo.FileVO;


@Service
public class CalendarServiceImpl implements ICalendarService{
	@Inject
	private CalendarMapper mapper;
	
	// 일정 조회 - 전체
	@Override
	public List<CalendarVO> calendarList(CalendarVO calendarVO) {
		return mapper.calendarList(calendarVO);
	}
	
	// 일정 등록
	@Override
	public void addEvent(CalendarVO calendarVO) {
		mapper.addEvent(calendarVO);
	}
	
	// 일정 삭제
	@Override
	public int calendarDelete(int calNo, int empNo) {
		
		int result = mapper.calendarDelete(calNo, empNo);
		
		if(result > 0) {
			result = 1;
	    } else {
	        result = 0;
	    }
	    return result;
		
	}
	
	// 일정 변경
	@Override
	public void calendarUpdate(CalendarVO calendarVO) {
		mapper.calendarUpdate(calendarVO);
		
	}
	
	// 일정 조회 - 부서별
//	@Override
//	public List<CalendarVO> calendarDeptList(String empDept) {
//		return mapper.calendarDeptList(empDept);
//	}
//	
//	// 일정 조회 - 개인별
//	@Override
//	public List<CalendarVO> calendarOwnList(int empNo) {
//		return mapper.calendarOwnList(empNo);
//	}
}
