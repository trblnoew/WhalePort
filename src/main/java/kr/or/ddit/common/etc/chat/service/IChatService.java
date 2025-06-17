package kr.or.ddit.common.etc.chat.service;


import java.util.List;
import java.util.Map;

import kr.or.ddit.common.etc.chat.vo.ChatMemberVO;
import kr.or.ddit.common.etc.chat.vo.ChatMsgVO;
import kr.or.ddit.common.etc.chat.vo.ChatRoomVO;
import kr.or.ddit.common.login.vo.LoginCommonVO;

public interface IChatService {

	public List<LoginCommonVO> list();

	public List<String> unList(Map<String, Object> params);

	public List<String> list(Map<String, Object> params);

	public int createRoom(List<String> userList);

	public List<ChatMsgVO> getMsg(int roomId);

	public void insertMsg(ChatMsgVO chatMsgVO);

	public List<ChatMsgVO> singleRecentMsg(ChatMsgVO msgVO);

	public List<ChatMsgVO> multiRecentMsg(String userId);

	public void createMtRoom(ChatRoomVO crVO);
	
	
	
}
