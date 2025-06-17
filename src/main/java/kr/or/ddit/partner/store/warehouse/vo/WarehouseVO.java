package kr.or.ddit.partner.store.warehouse.vo;

import lombok.Data;

@Data
public class WarehouseVO {
	private String whNo;
	private int ptNo;
	private String ptName;
	private String ptId;
	private String whPlacename;
	private String whStartdate;
	private String whEnddate;
	private String whDelyn;
	private String whYn;
	private String whReject;
	private int whXCoord;
	private int whYCoord;

}
