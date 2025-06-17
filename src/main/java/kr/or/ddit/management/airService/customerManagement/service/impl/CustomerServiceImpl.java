package kr.or.ddit.management.airService.customerManagement.service.impl;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.management.airService.customerManagement.mapper.ICustomerMapper;
import kr.or.ddit.management.airService.customerManagement.service.ICustomerService;
import kr.or.ddit.util.vo.PaginationVO;

@Service
public class CustomerServiceImpl implements ICustomerService {
	
	@Inject
	private ICustomerMapper cusMapper;

	@Override
	public int selectCusCount(PaginationVO<LoginCustomerVO> pagingVO) {
		return cusMapper.selectCusCount(pagingVO) ;
	}

	@Override
	public List<LoginCustomerVO> selectCusList(PaginationVO<LoginCustomerVO> pagingVO) {
		return cusMapper.selectCusList(pagingVO);
	}

	@Override
	public LoginCustomerVO selectCustomer(int cusNo) {
		return cusMapper.selectCustomer(cusNo);
	}

	@Override
	public int cusUpdate(LoginCustomerVO cusVO) {
		return cusMapper.cusUpdate(cusVO);
	}

	@Override
	public int cusDelete(int cusNo) {
		return cusMapper.cusDelete(cusNo);
	}

//	@Override
//	public List<LoginCustomerVO> selectCustomerList(String searchWord, String searchType) {
//		return cusMapper.selectCustomerList(searchWord, searchType);
//	}
	@Override
	public List<LoginCustomerVO> selectCustomerList() {
		return cusMapper.selectCustomerList();
	}

	@Override
	public int currentCount() {
		return cusMapper.currentCount();
	}

	@Override
	public int totalCount() {
		return cusMapper.totalCount();
	}

	@Override
	public int maleCount() {
		return cusMapper.maleCount();
	}

	@Override
	public int femaleCount() {
		return cusMapper.femaleCount();
	}

	// 라인 차트
	@Override
	public List<Integer> lineChart() {
		return cusMapper.lineChart();
	}
	
	// 바 차트
	@Override
	public List<Integer> barChart() {
		return cusMapper.barChart();
	}
}
