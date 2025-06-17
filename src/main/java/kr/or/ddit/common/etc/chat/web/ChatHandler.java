package kr.or.ddit.common.etc.chat.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ChatHandler extends TextWebSocketHandler {
    
//	@Inject
//	private IChatService chatService;
	
    // 현재 접속 중인 사용자 리스트를 관리
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
    private Map<String, String> userMap = new ConcurrentHashMap<>(); // sessionId -> userId 매핑
    private ObjectMapper objectMapper = new ObjectMapper();
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	 
       String userId = getUserIdFromQuery(session);       
       session.getAttributes().put("userId", userId);
       list.add(session);
       userMap.put(session.getId(), userId);
       
       Map<String, Object> msg = new HashMap<>();
       msg.put("type", "userList");
       msg.put("list", userMap.values());
       
       String message = objectMapper.writeValueAsString(msg);
       for(WebSocketSession s : list ) {
    	
       	   if(s.isOpen()) {
       		   s.sendMessage(new TextMessage(message));
       	   }
       }
   	   // 모든 사용자에게 업데이트된 유저 리스트 전송
//       broadcastUserList();
        
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	list.remove(session);
        userMap.remove(session.getId());
        
        Map<String, Object> msg = new HashMap<>();
        msg.put("type", "userList");
        msg.put("list", userMap.values());
        String message = objectMapper.writeValueAsString(msg);
        for(WebSocketSession s : list ) {
     	
        	if(s.isOpen()) {
        		   s.sendMessage(new TextMessage(message));
        	}
        }
        
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 클라이언트로부터의 메시지 처리
    	
    	
        String payload = message.getPayload();
        log.info("Received message: " + payload);
        // 채팅 메시지를 모든 사용자에게 브로드캐스트
        for (WebSocketSession s : list) {
            if (s.isOpen()) {
            	log.info("payload ::: " + new TextMessage(payload));
                s.sendMessage(new TextMessage(payload));
            }
        }
    }

    // 쿼리 파라미터에서 userId 추출
    private String getUserIdFromQuery(WebSocketSession session) {
        String query = session.getUri().getQuery();
        if (query != null && query.contains("userId")) {
            String[] params = query.split("&");
            for (String param : params) {
                String[] keyValue = param.split("=");
                if (keyValue[0].equals("userId")) {
                    return keyValue[1];
                }
            }
        }
        return null;
    }

}
