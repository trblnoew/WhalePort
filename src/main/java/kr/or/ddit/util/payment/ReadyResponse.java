package kr.or.ddit.util.payment;

import lombok.Data;

@Data
public class ReadyResponse {
	private String tid;
	private String next_redirect_pc_url;
}
