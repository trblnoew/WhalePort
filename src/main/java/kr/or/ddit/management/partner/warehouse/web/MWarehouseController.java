package kr.or.ddit.management.partner.warehouse.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.management.partner.warehouse.service.IMWarehouseService;
import kr.or.ddit.partner.store.warehouse.vo.WarehouseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management/partner/warehouse")
public class MWarehouseController {
	
	@Inject
	private IMWarehouseService whservice;
	
	@GetMapping("/list")
	public String MWarehouseList(Model model) {
		log.info("MWarehouseList() 실행...!");
		List<WarehouseVO> warehouseListVO = whservice.warehouseList();
		model.addAttribute("warehouseVO", warehouseListVO);
		
		model.addAttribute("partnerActive", "active");
		model.addAttribute("storeActive", "active");
		model.addAttribute("warehouseActive", "active");
		return "management/partner/warehouseManagement";
	}
	
	@ResponseBody
	@PostMapping("/addReject")
	public ResponseEntity<String> warehouseAddReject(@RequestBody WarehouseVO warehouseVO){
		log.info("warehouseAddReject() 실행...!");
		whservice.addReject(warehouseVO);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("/approve")
	public ResponseEntity<String> warehouseApprove(@RequestBody WarehouseVO warehouseVO){
		log.info("warehouseApprove() 실행...!");
		whservice.whApprove(warehouseVO);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}

}
