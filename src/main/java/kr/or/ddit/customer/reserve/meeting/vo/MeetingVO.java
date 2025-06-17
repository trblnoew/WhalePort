package kr.or.ddit.customer.reserve.meeting.vo;

import lombok.Data;

@Data
public class MeetingVO {

	private int mrNo;
	private String mrName;
	private int mrCost;
	
	private int mrrNo;
	private String mrrName;
	private String mrrTel;
	private String mrrTime;
	private String mrrDate;
	private String mrrUse;
	private String mrrStatus;
	private int cusNo;
	private int mrrCost;
	private int countY;
	private int countN;
	private int totalCount;
	private int totalCost;
}
