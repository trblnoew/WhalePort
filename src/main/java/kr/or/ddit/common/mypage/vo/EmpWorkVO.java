package kr.or.ddit.common.mypage.vo;


import lombok.Data;

@Data
public class EmpWorkVO {
	
	private int workNo;
	private int empNo;
	private String workDate;	 //근무 날짜
	private String workArrive;	 //출근시간
	private String workLeave;	//퇴근시간
	private int workNormal;		// 정상출근
	private int workLate;		//지각
	private int workEarly;		//조기퇴근
	private int workOff;		//결근
	private int workNochk;		// 퇴근 미체크
	private String workTime;		// 하루 일한 시간(-시간 -분)
	private int workAll;		// 하루 일한 시간(분 단위)
	private String month;		// 근태 원하는 월
	private int week;		// 근태 원하는 주
	private String date1;		// 근태 시작하는 주 날짜
	private String date2;		// 근태 끝나는 주 날짜
	
	private String todayTime;		// 00:00:00 형태의 누적시간
	
	private int sumWorkNormal;
	private int sumWorkLate;
	private int sumWorkEarly;
	private int sumWorkOff;
	private int sumWorkNochk;
	public int getWorkNo() {
		return workNo;
	}
	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public String getWorkArrive() {
		return workArrive;
	}
	public void setWorkArrive(String workArrive) {
		this.workArrive = workArrive;
	}
	public String getWorkLeave() {
		return workLeave;
	}
	public void setWorkLeave(String workLeave) {
		this.workLeave = workLeave;
	}
	public int getWorkNormal() {
		return workNormal;
	}
	public void setWorkNormal(int workNormal) {
		this.workNormal = workNormal;
	}
	public int getWorkLate() {
		return workLate;
	}
	public void setWorkLate(int workLate) {
		this.workLate = workLate;
	}
	public int getWorkEarly() {
		return workEarly;
	}
	public void setWorkEarly(int workEarly) {
		this.workEarly = workEarly;
	}
	public int getWorkOff() {
		return workOff;
	}
	public void setWorkOff(int workOff) {
		this.workOff = workOff;
	}
	public int getWorkNochk() {
		return workNochk;
	}
	public void setWorkNochk(int workNochk) {
		this.workNochk = workNochk;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}
	public int getWorkAll() {
		return workAll;
	}
	public void setWorkAll(int workAll) {
		this.workAll = workAll;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public String getTodayTime() {
		return todayTime;
	}
	public void setTodayTime(String todayTime) {
		this.todayTime = todayTime;
	}
	public int getSumWorkNormal() {
		return sumWorkNormal;
	}
	public void setSumWorkNormal(int sumWorkNormal) {
		this.sumWorkNormal = sumWorkNormal;
	}
	public int getSumWorkLate() {
		return sumWorkLate;
	}
	public void setSumWorkLate(int sumWorkLate) {
		this.sumWorkLate = sumWorkLate;
	}
	public int getSumWorkEarly() {
		return sumWorkEarly;
	}
	public void setSumWorkEarly(int sumWorkEarly) {
		this.sumWorkEarly = sumWorkEarly;
	}
	public int getSumWorkOff() {
		return sumWorkOff;
	}
	public void setSumWorkOff(int sumWorkOff) {
		this.sumWorkOff = sumWorkOff;
	}
	public int getSumWorkNochk() {
		return sumWorkNochk;
	}
	public void setSumWorkNochk(int sumWorkNochk) {
		this.sumWorkNochk = sumWorkNochk;
	}
	
	
} 
