package kr.or.ddit.common.etc.captcha.web;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Producer;

import kr.or.ddit.common.login.service.LoginCommonService;

@Controller
@RequestMapping("/captcha")
public class CaptchaController {

	@Inject
	private LoginCommonService loginCommonService;
	
    @Autowired
    private Producer captchaProducer;
    
    @GetMapping("/image")
    public void getCaptchaImage(HttpServletResponse response, HttpServletRequest request) throws IOException {
        // 캡챠 생성
        String captchaText = captchaProducer.createText();
        BufferedImage captchaImage = captchaProducer.createImage(captchaText);

        // 캡챠 텍스트를 세션에 저장
        request.getSession().setAttribute("captcha", captchaText);

        // 이미지 응답 설정
        response.setContentType("image/png");
        ImageIO.write(captchaImage, "png", response.getOutputStream());
    }
    
    @ResponseBody
    @PostMapping("/submit")
    public String submitForm(@RequestBody Map<String, String> param, HttpServletRequest request) {
    	String result = "FAILED";
        // 세션에서 저장한 캡챠 텍스트와 비교
        String generatedCaptcha = (String) request.getSession().getAttribute("captcha");

        if (param.get("captcha").equals(generatedCaptcha)) {
        	param.put("status", "N");
        	loginCommonService.lockAccount(param);
            result = "SUCCESS";
        } 
        return result;
    }
    
    @GetMapping("/form")
    public String showForm(HttpServletRequest request, Model model) {
        String captchaText = (String) request.getSession().getAttribute("captcha");
        model.addAttribute("captchaText", captchaText);
        return "form"; // form.html
    }
}

