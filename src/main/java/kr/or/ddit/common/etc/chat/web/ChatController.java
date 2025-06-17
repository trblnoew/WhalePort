package kr.or.ddit.common.etc.chat.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.etc.chat.service.IChatService;
import kr.or.ddit.common.etc.chat.vo.ChatMsgVO;
import kr.or.ddit.common.etc.chat.vo.ChatRoomVO;
import kr.or.ddit.common.etc.chat.vo.UserDataVO;
import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.util.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/common")
@Slf4j
public class ChatController {
	
	@Inject
	private IChatService chatService;

	// svn 수정수정
	@GetMapping("/chat/chat")
	public String chatPages(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    CustomUser customUser = (CustomUser) authentication.getPrincipal();	    
	    LoginCommonVO user = customUser.getMember();
	    
	    List<LoginCommonVO> mems = chatService.list();
		model.addAttribute("user", user);
		model.addAttribute("mems", mems);
		return "common/chat/chat";
		
	}

	@GetMapping("/multiRecentMsg")
	@ResponseBody
	public List<ChatMsgVO> multiRecentMsg(@RequestParam(value = "userId") String userId){
	    log.info("userId : " + userId);
	    List<ChatMsgVO> chatMsg = chatService.multiRecentMsg(userId);
	    return chatMsg;
	}
	
	@PostMapping("/singleRecentMsg")
	@ResponseBody
	public List<ChatMsgVO> singleRecentMsg(@RequestBody ChatMsgVO msgVO){
	    List<ChatMsgVO> chatMsg = chatService.singleRecentMsg(msgVO);
	    return chatMsg;
	}
	
	
	@PostMapping("/createRoom")
	@ResponseBody
	public int createRoom(@RequestBody List<String> userList) {
		log.info("users ::: "+userList.size());
		log.info("users.toString ::: "+userList.toString());
		int roomNo = chatService.createRoom(userList);
		
		return roomNo;
	}
	
	
	@PostMapping("/sessionUser")
	@ResponseBody
	public Map<String, Object> unUserList(@RequestBody UserDataVO userData) {
		log.info("user :: " + userData.toString());
		Map<String, Object> param = new HashMap<>();
		param.put("list", userData.getUserList());
        param.put("sessionUserId", userData.getSessionUserId());
        Map<String, Object> userListMessage = new HashMap<>();
        
        List<String> userList = chatService.list(param);
        userListMessage.put("users", userList);
        List<String> unUserList = chatService.unList(param);
        userListMessage.put("unUsers", unUserList);
		return userListMessage;
	}
	
	@GetMapping("/getMsg")
	@ResponseBody
	public List<ChatMsgVO> chatList(@RequestParam(value = "roomNo") int roomNo){
	    log.info("roomNo : " + roomNo);
	    List<ChatMsgVO> chatList = chatService.getMsg(roomNo);
	    return chatList;
	}
	
	@PostMapping("/sendMsg")
	@ResponseBody
	public int sendMsg(@RequestBody ChatMsgVO chatMsgVO) {
		chatService.insertMsg(chatMsgVO);
		
		return chatMsgVO.getRoomNo();
	}
	
	@PostMapping("/createMtRoom")
	@ResponseBody
	public String makeMtRoom(@RequestBody ChatRoomVO crVO) {
		log.info("memVO :: " + crVO.toString());
		chatService.createMtRoom(crVO);
		
		return crVO.getMyId();
	}
}


