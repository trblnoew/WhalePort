package kr.or.ddit.customer.map.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.customer.map.service.IMapService;
import kr.or.ddit.customer.map.vo.PartnerVO;
import kr.or.ddit.customer.map.vo.PointVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/customer/map")
public class MapController {
	
	@Inject
	private IMapService mapService;
	
	@GetMapping("/coordinate")
	public String partnerCoordinate(
			@RequestParam(value = "xCoor", required = false) String xCoor,
			@RequestParam(value = "yCoor", required = false) String yCoor,
			Model model
			) {
		log.info("partnercoordinate() 실행...!");
		List<PartnerVO> partnerList = mapService.partnerList();
		List<PointVO> pointList = mapService.pointList();
		model.addAttribute("xCoor", xCoor);
		model.addAttribute("yCoor", yCoor);
		model.addAttribute("partnerList", partnerList);
		model.addAttribute("pointList", pointList);
		return "customer/etc/map";
	}
	
	@PostMapping("/count")
	@ResponseBody
	public void searchCount(@RequestParam("ptNo") String ptNo) {
		log.info("searchCount() 실행...!");
		mapService.countUp(ptNo);
	}

}
