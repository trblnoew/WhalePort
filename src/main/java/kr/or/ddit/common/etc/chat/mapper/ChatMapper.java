package kr.or.ddit.common.etc.chat.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.etc.chat.vo.ChatMemberVO;
import kr.or.ddit.common.etc.chat.vo.ChatMsgVO;
import kr.or.ddit.common.etc.chat.vo.ChatRoomVO;
import kr.or.ddit.common.login.vo.LoginCommonVO;

public interface ChatMapper {

	public List<LoginCommonVO> list();

	public List<String> unList(Map<String, Object> params);

	public List<String> liveList(Map<String, Object> params);

	public int createRoom(ChatRoomVO chatRoom);

	public void insertMember(Map<String, Object> param);

	public int nextval();

	public List<ChatMsgVO> getMsg(int roomNo);

	public void insertMsg(ChatMsgVO chatMsgVO);

	public List<ChatMsgVO> singleRecentMsg(ChatMsgVO msgVO);

	public List<ChatMsgVO> multiRecentMsg(String userId);

	public void createMtRoom(ChatRoomVO crVO);

}

