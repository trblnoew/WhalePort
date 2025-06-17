package kr.or.ddit.common.etc.chat.vo;

import java.util.List;

import lombok.Data;

@Data
public class UserDataVO {
	private List<String> userList;
    private String sessionUserId;
}
