package kr.or.ddit.management.airService.popup.service;

import java.util.List;

import kr.or.ddit.management.airService.popup.vo.PopupVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IPopupService {

	public int selectPopupCount(PaginationVO<PopupVO> pagingVO);

	public List<PopupVO> selectPopupList(PaginationVO<PopupVO> pagingVO);

	public int insert(PopupVO eventVO);
	
	public PopupVO selectPopup(int popNo);

	public PopupVO selectPopupPosting();

	public int update(PopupVO eventVO);

	public int delete(int popNo);

	public int rejectUpate(PopupVO popupVO);

	public int updateApproval(int popNo);

	public void endPopup();

}
