package kr.or.ddit.management.partner.warehouse.service;

import java.util.List;

import kr.or.ddit.partner.store.warehouse.vo.WarehouseVO;

public interface IMWarehouseService {

	public List<WarehouseVO> warehouseList();

	public void addReject(WarehouseVO warehouseVO);

	public void whApprove(WarehouseVO warehouseVO);

}
