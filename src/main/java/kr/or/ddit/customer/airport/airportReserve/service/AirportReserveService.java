package kr.or.ddit.customer.airport.airportReserve.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AirportReserveService {
    public String international(String airportCode, String cityCode, String pageNo) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=OXnXFU%2BxIohThzHidFw2TW6OO%2Bg8RXbTEcMZFR3A8X9vBXqO2YPrU%2FO%2B2br3Mc8Rt3ok6JI9d%2B7OVK4U6cNUfA%3D%3D"); /*Service Key*/
//        urlBuilder.append("&" + URLEncoder.encode("schDate","UTF-8") + "=20241024"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("schDeptCityCode","UTF-8") + "=" + airportCode); 
        urlBuilder.append("&" + URLEncoder.encode("schArrvCityCode","UTF-8") + "=" + cityCode); 
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNo);
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=json");
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.info("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        log.info(sb.toString());
        return sb.toString();
    }
}

