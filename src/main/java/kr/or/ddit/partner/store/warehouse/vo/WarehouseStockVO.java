package kr.or.ddit.partner.store.warehouse.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class WarehouseStockVO {
	private int wsNo;
	private String whNo;
	private String wsName;
	private String wsUnit;
	private int wsQty;
	private String wsDate;
	private LocalDate whEnddate;
	private String wsDetail;
	private String wsImage;
	private String wsDelyn;
	
	private MultipartFile wsImgFile; // 이밴트 이미지 받을 때 사용

}
