package kr.or.ddit.partner.store.warehouse.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.partner.store.warehouse.mapper.IPWarehouseMapper;
import kr.or.ddit.partner.store.warehouse.service.IPWarehouseService;
import kr.or.ddit.partner.store.warehouse.vo.WarehouseStockVO;
import kr.or.ddit.partner.store.warehouse.vo.WarehouseVO;


@Service
public class PWarehouseServiceImpl implements IPWarehouseService {
	
	@Inject
	private IPWarehouseMapper mapper;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;

	@Override
	public List<WarehouseStockVO> list(String whNo) {
		return mapper.list(whNo);
	}

	@Override
	public WarehouseStockVO detail(String wsNo) {
		return mapper.detail(wsNo);
	}

	@Override
	public List<WarehouseVO> warehouseList() {
		return mapper.warehouseList();
	}

	@Override
	public void stockDelete(String wsNo) {
		mapper.stockDelete(wsNo);
	}

	@Override
	public int addStock(WarehouseStockVO stockVO) {
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		resourcePath+="/warehouseStock/";
		
		File file = new File(resourcePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String stockImg = "";
		
		try {
			MultipartFile stockImgFile = stockVO.getWsImgFile();
			
			if(stockImgFile !=null && stockImgFile.getOriginalFilename()!=null && !stockImgFile.getOriginalFilename().equals("")) {
			String fileName = UUID.randomUUID().toString();
			fileName+="_"+stockImgFile.getOriginalFilename();
			resourcePath +=fileName;
			stockImgFile.transferTo(new File(resourcePath));
			stockImg = "/upload/warehouseStock/"+fileName;
			}
			stockVO.setWsImage(stockImg);
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		
		return mapper.addStock(stockVO);
		
	}
	
	@Override
	public void editStock(WarehouseStockVO stockVO) {
		if(stockVO.getWsImgFile() != null) {
			String os = System.getProperty("os.name").toLowerCase();
			if(os.contains("win")) {
				resourcePath = winResourcePath;
			}
			if(os.contains("mac")) {
				resourcePath = macResourcePath;
			}
			
			resourcePath+="/warehouseStock/";
			
			File file = new File(resourcePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			String stockImg = "";
			
			try {
				MultipartFile stockImgFile = stockVO.getWsImgFile();
				
				if(stockImgFile !=null && stockImgFile.getOriginalFilename()!=null && !stockImgFile.getOriginalFilename().equals("")) {
					String fileName = UUID.randomUUID().toString();
					fileName+="_"+stockImgFile.getOriginalFilename();
					resourcePath +=fileName;
					stockImgFile.transferTo(new File(resourcePath));
					stockImg = "/upload/warehouseStock/"+fileName;
				}
				stockVO.setWsImage(stockImg);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			stockVO.setWsImage(null);
		}
		
		mapper.editStock(stockVO);
		
	}

	@Override
	public void subWarehouse(WarehouseVO warehouseVO) {
		mapper.subWarehouse(warehouseVO);
	}

}














