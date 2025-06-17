package kr.or.ddit.management.airService.customerManagement.service;

import java.util.List;

import kr.or.ddit.customer.login.login.vo.LoginCustomerVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface ICustomerService {

	public int selectCusCount(PaginationVO<LoginCustomerVO> pagingVO);

	public List<LoginCustomerVO> selectCusList(PaginationVO<LoginCustomerVO> pagingVO);

	public LoginCustomerVO selectCustomer(int cusNo);

	public int cusUpdate(LoginCustomerVO cusVO);

	public int cusDelete(int cusNo);

//	public List<LoginCustomerVO> selectCustomerList(String searchWord, String searchType);
	public List<LoginCustomerVO> selectCustomerList();

	public int currentCount();

	public int totalCount();

	public int maleCount();

	public int femaleCount();
	
	// 라인 차트
	public List<Integer> lineChart();
	
	// 바 차트
	public List<Integer> barChart();


}
