package kr.or.ddit.partner.store.warehouse.service;

import java.util.List;

import kr.or.ddit.partner.store.warehouse.vo.WarehouseStockVO;
import kr.or.ddit.partner.store.warehouse.vo.WarehouseVO;


public interface IPWarehouseService {

	public List<WarehouseStockVO> list(String whNo);

	public WarehouseStockVO detail(String wsNo);

	public List<WarehouseVO> warehouseList();

	public void stockDelete(String wsNo);

	public int addStock(WarehouseStockVO stockVO);

	public void editStock(WarehouseStockVO stockVO);

	public void subWarehouse(WarehouseVO warehouseVO);

//	public int editStock(WarehouseStockVO stockVO);
	

}
