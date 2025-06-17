package kr.or.ddit.common.etc.chat.vo;

import lombok.Data;

@Data
public class ChatMemberVO {
	private int stNo;
	private int roomNo;
	private String userId;
	private String crDate;
	private String crYn;
	private int msgCount;
	
	private String myId;
}
