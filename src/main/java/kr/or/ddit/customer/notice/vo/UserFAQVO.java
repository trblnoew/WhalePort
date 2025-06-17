package kr.or.ddit.customer.notice.vo;

import lombok.Data;

@Data
public class UserFAQVO {
	private int faqNo;
	private String faqCategory;
	private String faqTitle;
	private String faqAns;
	private int empNo;

}