package kr.or.ddit.management.human.etc.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.management.human.etc.mapper.EtcManagementMapper;
import kr.or.ddit.management.human.etc.service.IEtcManagementService;
import kr.or.ddit.management.human.etc.vo.EtcManagementVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EtcManagementServiceImpl implements IEtcManagementService{
	
	@Inject
	private EtcManagementMapper mapper;

	@Override
	public List<EtcManagementVO> totalInfoWorkHours(EtcManagementVO etcVO) {
		return mapper.totalInfoWorkHours(etcVO);
	}
	
	

}
