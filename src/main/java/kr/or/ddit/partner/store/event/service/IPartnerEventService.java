package kr.or.ddit.partner.store.event.service;

import java.util.List;

import kr.or.ddit.management.airService.popup.vo.PopupVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IPartnerEventService {

	public int selectStoreEventCount(PaginationVO<PopupVO> pagingVO);

	public List<PopupVO> selectStoreEventList(PaginationVO<PopupVO> pagingVO);

	public int insert(PopupVO eventVO);

	public PopupVO selectStoreEvent(int popNo);

	public int update(PopupVO eventVO);

	public int delete(int popNo);

	
}
