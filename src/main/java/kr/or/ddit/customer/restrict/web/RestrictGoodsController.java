package kr.or.ddit.customer.restrict.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/customer")
public class RestrictGoodsController {
	
	@GetMapping("/restrictgoods")
	public String RestrictGoods() {
		log.info("RestrictGoods() 실행...! ");
		return "customer/etc/restrictGoods";
	}
	
	

}
