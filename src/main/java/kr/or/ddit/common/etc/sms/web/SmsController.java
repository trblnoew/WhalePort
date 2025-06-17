package kr.or.ddit.common.etc.sms.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.common.login.service.LoginCommonService;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@Controller
public class SmsController {

    // CoolSMS 메시지 서비스 객체 생성 (API Key, Secret Key)
    private final DefaultMessageService messageService;
    
    @Inject
    private LoginCommonService loginCommonService;

    public SmsController() {
        this.messageService = NurigoApp.INSTANCE.initialize("", "", "https://api.coolsms.co.kr");
    }

    // 핸드폰 번호를 받아 SMS를 발송하는 메소드
    @PostMapping("/sendSMS")
    public ModelAndView sendSms(@RequestParam("phoneNumber") String phoneNumber) {
        ModelAndView mav = new ModelAndView("result");

        sendSMSMessage(phoneNumber);

        // 성공 메시지 설정
        mav.addObject("message", "SMS가 성공적으로 발송되었습니다.");
        return mav;
    }
    
    public String sendSMSMessage(String phoneNumber) {
    	// 임시 비밀번호 생성
        String temporaryPassword = generateTemporaryPassword();
    	
    	Message message = new Message();
        message.setFrom("");  // 발신자 번호 (API에 등록된 번호)
        message.setTo(phoneNumber);  // 수신자 번호
        message.setText("[WhalePort] 임시비밀번호는 " + temporaryPassword + " 입니다.");
        log.info("임시비밀번호 : " + temporaryPassword);
        try {
            // 메시지 전송 요청
        	SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        	String statusCode = response.getStatusCode();
        	log.info("## statusCode : " + statusCode);
        	if(!statusCode.equals("2000")) {	// 전송 성공
        		temporaryPassword = "failed";
        	}
        } catch (Exception e) {
        	e.printStackTrace();
        }
    	
    	return temporaryPassword;
    }

    // 임시 비밀번호 생성 메소드
    public String generateTemporaryPassword() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder tempPassword = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            tempPassword.append(chars.charAt((int) (Math.random() * chars.length())));
        }
        return tempPassword.toString();
    }
}
