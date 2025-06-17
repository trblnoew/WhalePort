package kr.or.ddit.management.partner.airportSchedule.vo;

import lombok.Data;

@Data
public class FlightScheduleVO {
    private String internationalMon;
    private String internationalTue;
    private String internationalWed;
    private String internationalThu;
    private String internationalFri;
    private String internationalSat;
    private String internationalSun;
    private String internationalStdate;
    private String internationalEddate;
    private String internationalNum;
    private String airlineEnglish;
    private String airportCode;
    private String cityCode;
    private String internationalTime;
}
