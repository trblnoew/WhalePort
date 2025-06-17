package kr.or.ddit.customer.restrict.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.customer.restrict.config.OpenAIConfig;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Slf4j
@Service
public class OpenAIService {

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private OpenAIConfig openAIConfig;

    private final String OPENAI_API_URL = "https://api.openai.com/v1/chat/completions";

    public String getChatResponse(String userMessage) throws Exception {
        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(openAIConfig.getApiKey());

        // 요청 바디 설정
        Map<String, Object> body = new HashMap<>();
        body.put("model", "gpt-4o");
        
        // 메시지 형식에 맞게 구성
        Map<String, String> message = new HashMap<>();
        message.put("role", "user");
        message.put("content", userMessage);
        body.put("messages", new Map[] { message });

        // HTTP 엔티티 생성
        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        // API 호출
        ResponseEntity<String> response = restTemplate.postForEntity(OPENAI_API_URL, requestEntity, String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            // JSON 파싱
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());
            JsonNode choices = root.path("choices");
            if (choices.isArray() && choices.size() > 0) {
                return choices.get(0).path("message").path("content").asText();
            }
        }

        throw new Exception("Failed to get response from OpenAI API");
    }
}
