package kr.or.ddit.common.etc.email.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class EmailController {
	
	// 전체 메일함 화면
	@GetMapping("/entireEmail")
	public String entireEmail() {
		return "common/email/entireEmail";
	}
	
	// 받은 메일함 화면
	@GetMapping("/receiveEmail")
	public String receiveEmail() {
		return "common/email/receiveEmail";
	}
	
	// 보낸 메일함 화면
	@GetMapping("/sendEmail")
	public String sendEmail() {
		return "common/email/sendEmail";
	}
	
	// 중요 메일함 화면
	@GetMapping("/importantEmail")
	public String importantEmail() {
		return "common/email/importantEmail";
	}
	
	// 휴지통 화면
	@GetMapping("/trashEmail")
	public String trashEmail() {
		return "common/email/trashEmail";
	}
	
	// 웹메일 쓰기 화면
	@GetMapping("/emailForm")
	public String emailForm() {
		return "common/email/emailForm";
	}

}


