package kr.or.ddit.management.airService.notice.mapper;

import java.util.List;

import kr.or.ddit.customer.notice.vo.UserFAQVO;
import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.customer.notice.vo.UserQnAVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;


public interface IUNManagingMapper {

	// FAQ
	
	public List<UserFAQVO> faqList();

	public void faqUpdate(UserFAQVO notice);

	public void faqDelete(int faqNo);

	public void faqAdd(UserFAQVO notice);
	
	
	// NOTICE

	public List<UserNoticeVO> noticeList();

	public Object register(UserNoticeVO userNoticeVO);

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

	public UserQnAVO qnaDetail(int qnaNo);
	
	public FileVO takeQnAFile(int qnaNo);
	
	
	
	//PAGING
	
	public int userNoticeCount(PaginationVO<UserNoticeVO> pagingVO);

	public List<UserNoticeVO> userNoticeList(PaginationVO<UserNoticeVO> pagingVO);

	
	//DOWNLOAD FILE
	public void saveFile(FileVO fileVO);

	public FileVO takeNoticeFile(int noNo);

	public void qnaDelete(int qnaNo);

	public void qnaUpdate(UserQnAVO userQnAVO);

	public void insertUserNoticeFile(FileVO fileVO);
	
	public void deleteNoticeFile(Integer integer);
	
	public FileVO selectNoticeFile(Integer integer);

	public void incrementUserNoticeFileDown(int fileNo);

	public FileVO UserNoticeDownload(int fileNo);

	
	


}
