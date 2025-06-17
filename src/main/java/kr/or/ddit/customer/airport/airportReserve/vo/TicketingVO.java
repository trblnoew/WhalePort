package kr.or.ddit.customer.airport.airportReserve.vo;

import java.util.List;

import lombok.Data;

@Data
public class TicketingVO {
	private int tkNo;
	private int cusNo;
	private int tkAge;
	private int tkFlight;
	private String tkSeat;
	private String tkDepart;

	private String tkDepartdate;
	private String tkArrival;
	private String tkArridate;
	private String tkPassport;
	private int tkPrice;
	private String tkEngfirst;
	private String tkLastname;
	private int tkWeight;
	private String tkTel;
	private String tkEmail;
	private String tkBirth;
	private String tkGender;
	private String tkGroup;
	private String tkDate;
	private String tkDel;
	private String tkKrname;
	
	private String cusName;
	private String tkSetprice;
	
	
	private List<TicketingVO> tkVO;
	private List<PlaneScheduleVO> pVO;
	private List<PlaneScheduleVO> planeVO;
	
	
	
}
