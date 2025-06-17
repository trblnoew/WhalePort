package kr.or.ddit.management.info.notice.mapper;

import java.util.List;

import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;

public interface IEmpNoticeMapper {

	public int selectEmpNoticeCount(PaginationVO<UserNoticeVO> pagingVO);

	public List<UserNoticeVO> selectEmpNoticeList(PaginationVO<UserNoticeVO> pagingVO);

	public UserNoticeVO selectEmpNotice(UserNoticeVO noticeVO);

	public void incrementHit(int noNo);

	public int insertEmpNotice(UserNoticeVO noticeVO);

	public void insertEmpNoticeFile(FileVO fileVO);

	public FileVO empNoticeDownload(int fileNo);

	public void incrementEmpNoticeFileDown(int fileNo);

	public int updateEmpNotice(UserNoticeVO noticeVO);

	public FileVO selectNoticeFile(Integer integer);

	public void deleteNoticeFile(Integer integer);

	public int deleteEmpNotice(int noNo);

}
