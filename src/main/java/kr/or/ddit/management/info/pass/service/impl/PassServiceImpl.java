package kr.or.ddit.management.info.pass.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.management.human.management.vo.EmployeeVO;
import kr.or.ddit.management.info.pass.mapper.PassMapper;
import kr.or.ddit.management.info.pass.service.IPassService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PassServiceImpl implements IPassService {

	@Inject
	private PassMapper mapper;
	
	@Override
	public EmployeeVO accessDetail(String empId) {
		log.info("# PassServiceImpl accessDeatil");
		return mapper.accessDetail(empId);
	}

}
