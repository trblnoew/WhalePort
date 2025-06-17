package kr.or.ddit.management.airService.notice.service;

import java.util.List;

import kr.or.ddit.customer.notice.vo.UserFAQVO;
import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.customer.notice.vo.UserQnAVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;


public interface IUNManagingService {

	// FAQ
	
	public List<UserFAQVO> faqList();

	public void faqUpdate(UserFAQVO notice);

	public void faqDelete(int faqNo);

	public void faqAdd(UserFAQVO notice);
	
	// Notice

	public List<UserNoticeVO> noticeList();

	public void noticeAdd(UserNoticeVO userNoticeVO);

	public UserNoticeVO noticeDetail(int noNo);

	public void noticeDelete(int noNo);

	public void noticeUpdate(UserNoticeVO userNoticeVO);
	
	public int insertUserNotice(UserNoticeVO noticeVO);
	
	public int updateUserNotice(UserNoticeVO userNoticeVO);

	public UserNoticeVO selectUserNotice(UserNoticeVO noticeVO);
	
	
	
	
	// QNA
	
	public int userQnACount(PaginationVO<UserQnAVO> pagingVO);
	
	public List<UserQnAVO> userQnAList(PaginationVO<UserQnAVO> pagingVO);
	
	
	
	//PAGING

	public int userNoticeCount(PaginationVO<UserNoticeVO> pagingVO);

	public List<UserNoticeVO> userNoticeList(PaginationVO<UserNoticeVO> pagingVO);
	
	
	// DOWNLOAD FILE

	public void saveFile(FileVO fileVO);

	public FileVO takeNoticeFile(int noNo);

	public UserQnAVO qnaDetail(int qnaNo);

	public FileVO takeQnAFile(int qnaNo);

	public void qnaDelete(int qnaNo);

	public void qnaUpdate(UserQnAVO userQnAVO);

	public FileVO USerNoticeDownload(int fileNo);

	
}
