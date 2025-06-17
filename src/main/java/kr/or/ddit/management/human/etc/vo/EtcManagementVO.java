package kr.or.ddit.management.human.etc.vo;

import lombok.Data;

@Data
public class EtcManagementVO {
	private int workNo;
	private int empNo;
	private String workArrive;
	private String workLeave;
	private int workLate;
	private int workEarly;
	private int workOff;
	private int workNochk;
	private int workNormal;
	private String workTime;
	private int workAll;
	
	private String month;
	private String totalInfoWorkHours;
}
