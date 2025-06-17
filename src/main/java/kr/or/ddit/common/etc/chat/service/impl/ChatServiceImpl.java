package kr.or.ddit.common.etc.chat.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.etc.chat.mapper.ChatMapper;
import kr.or.ddit.common.etc.chat.service.IChatService;
import kr.or.ddit.common.etc.chat.vo.ChatMemberVO;
import kr.or.ddit.common.etc.chat.vo.ChatMsgVO;
import kr.or.ddit.common.etc.chat.vo.ChatRoomVO;
import kr.or.ddit.common.login.vo.LoginCommonVO;

@Service
public class ChatServiceImpl implements IChatService{

	@Inject
	private ChatMapper mapper;
	
	@Override
	public List<LoginCommonVO> list() {
		return mapper.list();
	}

	
	@Override
	public int createRoom(List<String> userList) {

		ChatRoomVO chatRoom = new ChatRoomVO();
		mapper.createRoom(chatRoom);
		int roomNo = chatRoom.getRoomNo();
		
		Map<String, Object> param = new HashMap<>();
		param.put("roomNo", roomNo);
		
		
		for(String user : userList) {
			param.put("user", user);
			mapper.insertMember(param);
		}
		
		return roomNo;
	}

	@Override
	public List<String> unList(Map<String, Object> params) {
		return mapper.unList(params);
	}

	@Override
	public List<String> list(Map<String, Object> params) {
		
		return mapper.liveList(params);
	}


	@Override
	public List<ChatMsgVO> getMsg(int roomNo) {
		return mapper.getMsg(roomNo);
	}


	@Override
	public void insertMsg(ChatMsgVO chatMsgVO) {
		mapper.insertMsg(chatMsgVO);
		
	}


	@Override
	public List<ChatMsgVO> multiRecentMsg(String userId) {

		return mapper.multiRecentMsg(userId);
	}


	@Override
	public void createMtRoom(ChatRoomVO crVO) {
		mapper.createMtRoom(crVO);
		
		String[] users = crVO.getUserId().split(",");
		
		Map<String, Object> param = new HashMap<>();

		param.put("roomNo", crVO.getRoomNo());

		for(String user : users) {
			param.put("user", user);
			mapper.insertMember(param);
		}
		param.put("user", crVO.getMyId());
		mapper.insertMember(param);
	}


	@Override
	public List<ChatMsgVO> singleRecentMsg(ChatMsgVO msgVO) {
		return mapper.singleRecentMsg(msgVO);
	}


	

}
