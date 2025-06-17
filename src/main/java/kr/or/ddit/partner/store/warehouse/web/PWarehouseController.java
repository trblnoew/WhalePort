package kr.or.ddit.partner.store.warehouse.web;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.partner.store.warehouse.service.IPWarehouseService;
import kr.or.ddit.partner.store.warehouse.vo.WarehouseStockVO;
import kr.or.ddit.partner.store.warehouse.vo.WarehouseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner")
public class PWarehouseController {
	
	@Inject
	private IPWarehouseService stockService;

//	// 창고 관리 최초 화면
//	@GetMapping("/warehouse")
//	public String warehouseMain() {
//		log.info("warehouseMain() 실행...!");
//		return "partner/warehouse/warehouse";
//	}

	@GetMapping("/warehouse")
	public String getDataTable(Model model) {
		List<WarehouseVO> warehouseVO = stockService.warehouseList();
		model.addAttribute("warehouseVO", warehouseVO);
		return "partner/warehouse/warehouse";
	}
	
	// 창고 선택 시 재고 리스트 출력(ajax)
	@ResponseBody
	@PostMapping("/warehouse/stock")
	public ResponseEntity<List<WarehouseStockVO>> warehouseStock(@RequestBody Map<String, String> requestData) throws Exception {
	    log.info("warehouseStock() 실행...!");
	    String whNo = requestData.get("whNo"); // JSON 데이터에서 whNo 값 추출
	    List<WarehouseStockVO> data = stockService.list(whNo);
	    return new ResponseEntity<List<WarehouseStockVO>>(data, HttpStatus.OK);
	}
	
	// 재고 선택 시 재고 detail 출력(ajax)
	@ResponseBody
	@PostMapping("/warehouse/stockDetail")
	public ResponseEntity<WarehouseStockVO> warehouseStockDetail(@RequestBody Map<String, String> requestData) {
	    log.info("warehouseStock() 실행...!");
	    String wsNo = requestData.get("wsNo"); // JSON 데이터에서 whNo 값 추출
	    WarehouseStockVO stockDetail = stockService.detail(wsNo);
	    return new ResponseEntity<WarehouseStockVO>(stockDetail, HttpStatus.OK);
	}	
	
	// 재고 삭제 =>  제고 리스트 재출력
	@ResponseBody
	@PostMapping("/warehouse/deleteStock")
	public ResponseEntity<List<WarehouseStockVO>> deleteStock(@RequestBody Map<String, String> requestData) {
		log.info("deleteStock() 실행..!");
		String wsNo = requestData.get("wsNo");
		stockService.stockDelete(wsNo);
		String whNo = requestData.get("whNo");
	    List<WarehouseStockVO> data = stockService.list(whNo);
	    return new ResponseEntity<List<WarehouseStockVO>>(data, HttpStatus.OK);
	}
	
	// 재고 추가
	@ResponseBody
	@PostMapping("/warehouse/addStock")
	public ResponseEntity<List<WarehouseStockVO>> addStock(
			WarehouseStockVO stockVO
			) {
		log.info("addStock() 실행...!");
		int result = stockService.addStock(stockVO);
		String whNo = stockVO.getWhNo();
		List<WarehouseStockVO> data = stockService.list(whNo);
		return new ResponseEntity<List<WarehouseStockVO>>(data, HttpStatus.OK);
	}
	
	// 재고 수정
	@ResponseBody
	@PostMapping("/warehouse/editStock")
	public ResponseEntity<List<WarehouseStockVO>> editStock(
			WarehouseStockVO stockVO
			) {
		log.info("addStock() 실행...!");
		stockService.editStock(stockVO);
		String whNo = stockVO.getWhNo();
		List<WarehouseStockVO> data = stockService.list(whNo);
		return new ResponseEntity<List<WarehouseStockVO>>(data, HttpStatus.OK);
	}
	
}














