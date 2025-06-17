package kr.or.ddit.partner.store.warehouse.web;

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

import kr.or.ddit.partner.store.warehouse.service.IPWarehouseService;
import kr.or.ddit.partner.store.warehouse.vo.WarehouseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner/warehouse")
public class PWSubscirbeController {
	
	@Inject
	private IPWarehouseService stockService;
	
	@GetMapping("/list")
	public String warehouseSubList(Model model) {
		log.info("warehouseSubList() 실행...!");
		List<WarehouseVO> warehouseVO = stockService.warehouseList();
		model.addAttribute("warehouseVO", warehouseVO);
		return "partner/warehouse/subscribe";
	}

	
	@ResponseBody
	@PostMapping("/list")
	public ResponseEntity<List<WarehouseVO>> warehouseSubscribe(@RequestBody WarehouseVO warehouseVO, Model model) {
		log.info("warehouseSubscribe() 실행...!");
		stockService.subWarehouse(warehouseVO);
		List<WarehouseVO> warehouseListVO = stockService.warehouseList();
		model.addAttribute("warehouseVO", warehouseListVO);
		return new ResponseEntity<List<WarehouseVO>>(warehouseListVO, HttpStatus.OK);
	}
}
