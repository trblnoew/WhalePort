package kr.or.ddit.customer.restrict.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.customer.restrict.service.OpenAIService;



@Controller
public class AIChatController {

    @Autowired
    private OpenAIService openAIService;

    @GetMapping("/customer/restrictGoods")
    public String chatForm() {
        return "customer/etc/AIchat";
    }

    @PostMapping("/chat")
    public ResponseEntity<String> chatSubmit(@RequestParam("message") String message, Model model) {
    	String response="";
        try {
            response = openAIService.getChatResponse(
            		"이 채팅은 항공기 탑승 시에 가져갈 수 있는 물품인지 간단한 정보를 확인하고 싶어서 만든 챗봇으로 사용할 것입니. "
            		+ "<"+message+"> 앞에 꺽쇠 안에 씌여진 물품이 고객이 채팅으로 검색한 정보입니다. 처음으로는 대한항공 항공기 반입 가능한지 간단하게 한 문장으로 말해주도록 하고, "
            		+ "제한 사항이나 허용 수량이 존재할 경우 한 문장으로 간단하게 알려주시길 바랍니다. 혹시 항공기 반입 가능 물품과 조금이라도 관련된 질문이 아니거나 문장으로 다른 말을 할 경우에는 "
            		+ "'죄송합니다. 관련된 항목을 다시 검색해주세요.'라고 답해주십시오. 실제 사용자들은 꺽쇠를 보지 못하기 때문에 꺽쇠라는 말이나 꺽쇠를 출력하지 않았으면 좋겠습니다."
            		+ "추가로 대한항공이라는 단어는 답변에서 제외해주십시오.");
            model.addAttribute("userMessage", message);
            model.addAttribute("botResponse", response);
        } catch (Exception e) {
            model.addAttribute("error", "Error communicating with OpenAI API");
            e.printStackTrace();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("text/plain; charset=UTF-8"));
        
        return new ResponseEntity<String>(response, headers, HttpStatus.OK);
    }
}
