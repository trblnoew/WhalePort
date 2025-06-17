package kr.or.ddit.common.etc.chat.vo;

import lombok.Data;

@Data
public class ChatMsgVO {
	private int chatNo;
	private String chatMsg;
	private String chatSender;
	private String chatDate;
	private int roomNo;
	private String chatFilecode;
	private String chatRead;
	
	// table에는 없는놈임
	private String otherUserId;
	private String roomName;
	private String searchWord;
	private String userId;
	private String userImage;
	private String userName;
	private String userPosition;
}
