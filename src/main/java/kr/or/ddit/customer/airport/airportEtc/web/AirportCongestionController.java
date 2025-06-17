package kr.or.ddit.customer.airport.airportEtc.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//@Controller
@RestController
@RequestMapping("/customer")
public class AirportCongestionController {

    @GetMapping("/airportCongestionTime")
    public String airportCongestionTime(Model model) throws IOException {
    	log.info("airportCongestion() 실행...!");
        String apiUrl = "https://api.odcloud.kr/api/getAPRTWaitTime/v1/aprtWaitTime";

        String page = "1";	
        String perPage = "10";	
        String serviceKey = "51vxpkkHfLI6NaiCFf0WCYcmf9bribGyPb+nhJ3O3AWxQCJfqIOSIKe+/2SapG7j2wQvAT9SfiKZjYp3imgsHA==";


        StringBuilder urlBuilder = new StringBuilder(apiUrl);
        urlBuilder.append("?" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode(perPage, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode(serviceKey, "UTF-8"));

        /*
         * GET방식으로 전송해서 파라미터 받아오기
         */
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
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
        String result= sb.toString();
        Gson json = new Gson();
        
        System.out.println(result);
        log.info("여기1"+result);
        model.addAttribute("result", json.toJson(result));
	    return result;
    }
    
    @GetMapping("/airportCongestionLevel")
    public String airportCongestionLevel(Model model) throws IOException {
    	log.info("airportCongestion() 실행...!");
//        String apiUrl = "https://api.odcloud.kr/api/getAPRTPsgrCongestion/v1/aprtPsgrCongestion​";
//        String apiUrl = "https://api.odcloud.kr/api/getAPRTPsgrCongestion/v110/aprtPsgrCongestion​";
        String apiUrl = "https://api.odcloud.kr/api/getAPRTPsgrCongestion/v1/aprtPsgrCongestion%E2%80%8B?page=1&perPage=10&serviceKey=51vxpkkHfLI6NaiCFf0WCYcmf9bribGyPb%2BnhJ3O3AWxQCJfqIOSIKe%2B%2F2SapG7j2wQvAT9SfiKZjYp3imgsHA%3D%3D​";

    	
//    	String page = "1";	
//    	String perPage = "10";	
//    	String serviceKey = "51vxpkkHfLI6NaiCFf0WCYcmf9bribGyPb+nhJ3O3AWxQCJfqIOSIKe+/2SapG7j2wQvAT9SfiKZjYp3imgsHA==";
//    	String serviceKey = "51vxpkkHfLI6NaiCFf0WCYcmf9bribGyPb%2BnhJ3O3AWxQCJfqIOSIKe%2B%2F2SapG7j2wQvAT9SfiKZjYp3imgsHA%3D%3D";
    	
    	
    	StringBuilder urlBuilder = new StringBuilder(apiUrl);
//    	urlBuilder.append("?" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8"));
//    	urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode(perPage, "UTF-8"));
//    	urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode(serviceKey, "UTF-8"));
//        urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=51vxkkHfLI6NaiCFf0WCYcmf9bribGyPb+nhJ3O3AWxQCJfqIOSIKe+/2SapG7j2wQvAT9SfiKZjYp3imgsHA=="); /*Service Key*/
//        urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=51vxpkkHfLI6NaiCFf0WCYcmf9bribGyPb%2BnhJ3O3AWxQCJfqIOSIKe%2B%2F2SapG7j2wQvAT9SfiKZjYp3imgsHA%3D%3D"); /*Service Key*/
    	
    	/*
    	 * GET방식으로 전송해서 파라미터 받아오기
    	 */
    	URL url = new URL(urlBuilder.toString());
    	HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
    	conn.setRequestMethod("GET");
//    	conn.setRequestProperty("Content-type", "application/json");
    	System.out.println("Response code: " + conn.getResponseCode());
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
    	String result= sb.toString();
    	Gson json = new Gson();
    	
    	log.info("여기2"+result);
    	model.addAttribute("result", json.toJson(result));
    	return result;
    }
}