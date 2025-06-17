package kr.or.ddit.common.etc.calendar.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Data
public class CalendarVO {
	private int calNo;				// 일정 번호
	private int empNo;				// 일정 번호
	private String calTitle;		// 일정 제목
	private String calType;			// 일정 유형
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date calStartdate;		// 일정 시작일
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date calEnddate;		// 일정 종료일
	private String calDiv;			// 일정 구분
}
