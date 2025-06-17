package kr.or.ddit.common.etc.chat.vo;

import lombok.Data;

@Data
public class ChatRoomVO {
	private int roomNo;
	private int empNo;
	private String roomName;
	private String roomCreate;
	private String singleChat;
	
	// table에는 없음. ajax때문에
	private String userId;
	private String myId;
}
