package kr.or.ddit.customer.facility.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.customer.facility.service.IFacilityInfoService;
import kr.or.ddit.partner.common.account.vo.PartnerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer/facility")
public class FacilityInfoController {

	@Inject
	private IFacilityInfoService facilityService;
	
	// 안내 및 서비스
	@GetMapping("/guide")
	public String guide(Model model) {
		log.info("guide()...! 실행");
		
		List<PartnerVO> guideList = facilityService.selectGuideList();
		model.addAttribute("guideList", guideList);
		
		return "customer/facility/guide";
	}
	
	// 식당
	@GetMapping("/restaurant")
	public String restaurant(Model model) {
		log.info("restaurant()...! 실행");
		
		List<PartnerVO> restaurantList = facilityService.selectRestaurantList();
		model.addAttribute("restaurantList", restaurantList);
		
		
		return "customer/facility/restaurant";
	}

	//쇼핑.면세점
	@GetMapping("/shopping")
	public String shopping(Model model) {
		log.info("shopping()...! 실행");
		List<PartnerVO> shoppingList = facilityService.selectShoppingList();
		model.addAttribute("shoppingList", shoppingList);
		return "customer/facility/shopping";
	}
	
	// 공항 최적 동선 안내
	@GetMapping("/distance")
	public String distance() {
		log.info("distance()...! 실행");
		return "customer/facility/distance";
	}

	
}
