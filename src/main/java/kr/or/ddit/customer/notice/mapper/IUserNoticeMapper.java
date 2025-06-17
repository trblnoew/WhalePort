package kr.or.ddit.customer.notice.mapper;

import java.util.List;

import kr.or.ddit.customer.notice.vo.UserFAQVO;
import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.customer.notice.vo.UserQnAVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;


public interface IUserNoticeMapper {

	// FAQ
	public List<UserFAQVO> faqList();

	// NOTICE
	public List<UserNoticeVO> noticeList();

	public int userNoticeCount(PaginationVO<UserNoticeVO> pagingVO);

	public List<UserNoticeVO> userNoticeList(PaginationVO<UserNoticeVO> pagingVO);

	public UserNoticeVO noticeDetail(int noNo);

	public FileVO takeNoticeFile(int noNo);

	
	// QNA
	public void qnaRegister(UserQnAVO userQnAVO);

	public void saveFile(FileVO fileVO);

	public int userQnACount(PaginationVO<UserQnAVO> pagingVO);

	public List<UserQnAVO> userQnAList(PaginationVO<UserQnAVO> pagingVO);

	public UserQnAVO qnaDetail(int qnaNo);

	public FileVO takeQnAFile(int qnaNo);

	public void qnaUpdate(UserQnAVO userQnAVO);

	public void qnaDelete(int qnaNo);

	public UserNoticeVO selectUserNotice(UserNoticeVO noticeVO);

	public String selectCusId(int cusNo);

	public void userNoticeCounting(int noNo);


}
