package kr.or.ddit.management.partner.warehouse.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.management.partner.warehouse.mapper.IMWarehouseMapper;
import kr.or.ddit.management.partner.warehouse.service.IMWarehouseService;
import kr.or.ddit.partner.store.warehouse.mapper.IPWarehouseMapper;
import kr.or.ddit.partner.store.warehouse.vo.WarehouseVO;

@Service
public class MWarehouseServiceImpl implements IMWarehouseService {
	
	@Inject
	private IMWarehouseMapper mapper;

	@Override
	public List<WarehouseVO> warehouseList() {
		return mapper.warehouseList();
	}

	@Override
	public void addReject(WarehouseVO warehouseVO) {
		mapper.addReject(warehouseVO);
	}

	@Override
	public void whApprove(WarehouseVO warehouseVO) {
		mapper.whApprove(warehouseVO);
	}

}
