package kr.or.ddit.management.info.notice.service;

import java.util.List;

import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IEmpNoticeService {

	public int selectEmpNoticeCount(PaginationVO<UserNoticeVO> pagingVO);

	public List<UserNoticeVO> selectEmpNoticeList(PaginationVO<UserNoticeVO> pagingVO);

	public UserNoticeVO selectEmpNotice(UserNoticeVO noticeVO);

	public int insertEmpNotice(UserNoticeVO noticeVO);

	public FileVO empNoticeDownload(int fileNo);

	public int updateEmpNotice(UserNoticeVO noticeVO);

	public int deleteEmpNotice(int noNo);

}
