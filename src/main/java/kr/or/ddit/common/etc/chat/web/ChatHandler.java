import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.common.etc.chat.service.IChatService;
import kr.or.ddit.common.etc.chat.vo.ChatMsgVO;
import kr.or.ddit.common.etc.chat.vo.ChatRoomVO;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ChatHandler extends TextWebSocketHandler {

    private static List<WebSocketSession> sessions = new ArrayList<>();
    private Map<String, String> userMap = new ConcurrentHashMap<>(); // sessionId → userId
    private ObjectMapper objectMapper = new ObjectMapper();

    @Inject
    private IChatService chatService;

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String userId = getUserIdFromQuery(session);
        session.getAttributes().put("userId", userId);
        sessions.add(session);
        userMap.put(session.getId(), userId);

        sendUserListToAll(userMap);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
        userMap.remove(session.getId());
        sendUserListToAll(userMap);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        Map<String, Object> data = objectMapper.readValue(message.getPayload(), Map.class);
        String type = (String) data.get("type");

        switch (type) {
            case "chat":
                handleChatMessage(data);
                break;
            case "createRoom":
                handleCreateRoom(session, data);
                break;
            case "createMtRoom":
                handleCreateMtRoom(data);
                break;
            default:
                log.warn("Unknown message type: " + type);
        }
    }

    private void handleChatMessage(Map<String, Object> data) throws Exception {
        ChatMsgVO msgVO = new ChatMsgVO();
        msgVO.setChatSender((String) data.get("chatSender"));
        msgVO.setChatMsg((String) data.get("chatMsg"));
        msgVO.setRoomNo((Integer) data.get("roomNo"));

        chatService.insertMsg(msgVO);

        broadcast(objectMapper.writeValueAsString(data));
    }

    private void handleCreateRoom(WebSocketSession session, Map<String, Object> data) throws Exception {
        List<String> userList = (List<String>) data.get("userList");
        int roomNo = chatService.createRoom(userList);

        Map<String, Object> result = new HashMap<>();
        result.put("type", "createRoomResult");
        result.put("roomNo", roomNo);
        result.put("userList", userList);

        session.sendMessage(new TextMessage(objectMapper.writeValueAsString(result)));
    }

    private void handleCreateMtRoom(Map<String, Object> data) throws Exception {
        ChatRoomVO roomVO = new ChatRoomVO();
        roomVO.setMyId((String) data.get("myId"));
        roomVO.setUserId((String) data.get("userId"));
        roomVO.setRoomName((String) data.get("roomName"));

        chatService.createMtRoom(roomVO);

        Map<String, Object> result = new HashMap<>();
        result.put("type", "alarm");
        result.put("userId", roomVO.getMyId());

        broadcast(objectMapper.writeValueAsString(result));
    }

    private void sendUserListToAll(Map<String, String> userMap) throws Exception {
    
    	Map<String, Object> param = new HashMap<>();
        param.put("type", "userList");
        param.put("list", userMap.values());
        param.put("sessionUserId", "");
        Map<String, Object> userListMessage = new HashMap<>();
        
        List<String> userList = chatService.list(param);
        userListMessage.put("users", userList);
        List<String> unUserList = chatService.unList(param);
        userListMessage.put("unUsers", unUserList);
        
        String json = objectMapper.writeValueAsString(userListMessage);

        for (WebSocketSession s : sessions) {
            if (s.isOpen()) {
                s.sendMessage(new TextMessage(json));
            }
        }
    }

    private void broadcast(String json) throws Exception {
        for (WebSocketSession s : sessions) {
            if (s.isOpen()) {
                s.sendMessage(new TextMessage(json));
            }
        }
    }

    private String getUserIdFromQuery(WebSocketSession session) {
        String query = session.getUri().getQuery();
        if (query != null && query.contains("userId")) {
            for (String param : query.split("&")) {
                String[] kv = param.split("=");
                if (kv[0].equals("userId")) return kv[1];
            }
        }
        return null;
    }
}
