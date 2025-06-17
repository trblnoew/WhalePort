package kr.or.ddit.partner.store.event.mapper;

import java.util.List;

import kr.or.ddit.management.airService.popup.vo.PopupVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IPartnerEventMapper {

	public int selectStoreEventCount(PaginationVO<PopupVO> pagingVO);

	public List<PopupVO> selectStoreEventList(PaginationVO<PopupVO> pagingVO);

	public PopupVO selectStoreEvent(int popNo);

	public int insert(PopupVO eventVO);

	public int update(PopupVO eventVO);

	public int delete(int popNo);

}
