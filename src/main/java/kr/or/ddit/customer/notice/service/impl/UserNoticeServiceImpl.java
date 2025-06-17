package kr.or.ddit.customer.notice.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.notice.mapper.IUserNoticeMapper;
import kr.or.ddit.customer.notice.service.IUserNoticeService;
import kr.or.ddit.customer.notice.vo.UserFAQVO;
import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.customer.notice.vo.UserQnAVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;


@Service
public class UserNoticeServiceImpl implements IUserNoticeService {
	
	@Inject
	private IUserNoticeMapper mapper;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;

	// FAQ
	@Override
	public List<UserFAQVO> faqList() {
		return mapper.faqList();
	}

	
	// NOTICE
	@Override
	public List<UserNoticeVO> noticeList() {
		return mapper.noticeList();
	}

	@Override
	public int userNoticeCount(PaginationVO<UserNoticeVO> pagingVO) {
		return mapper.userNoticeCount(pagingVO);
	}

	@Override
	public List<UserNoticeVO> userNoticeList(PaginationVO<UserNoticeVO> pagingVO) {
		return mapper.userNoticeList(pagingVO);
	}


	@Override
	public UserNoticeVO noticeDetail(int noNo) {
		mapper.userNoticeCounting(noNo);
		return mapper.noticeDetail(noNo);
	}


	@Override
	public FileVO takeNoticeFile(int noNo) {
		return mapper.takeNoticeFile(noNo);
	}

	@Override
	public UserNoticeVO selectUserNotice(UserNoticeVO noticeVO) {
		String fileOwner = "02"+ noticeVO.getNoNo();
		noticeVO.setFileOwner(fileOwner);
		return mapper.selectUserNotice(noticeVO);
	}




	// QNA
	@Override
	public void qnaRegister(UserQnAVO userQnAVO) {
		mapper.qnaRegister(userQnAVO);
	}


	@Override
	public void saveFile(FileVO fileVO) {
		mapper.saveFile(fileVO);
	}


	@Override
	public int userQnACount(PaginationVO<UserQnAVO> pagingVO) {
		return mapper.userQnACount(pagingVO);
	}


	@Override
	public List<UserQnAVO> userQnAList(PaginationVO<UserQnAVO> pagingVO) {
		return mapper.userQnAList(pagingVO);
	}


	@Override
	public UserQnAVO qnaDetail(int qnaNo) {
		mapper.userNoticeCounting(qnaNo);
		return mapper.qnaDetail(qnaNo);
	}


	@Override
	public FileVO takeQnAFile(int qnaNo) {
		return mapper.takeQnAFile(qnaNo);
	}


	@Override
	public void qnaUpdate(UserQnAVO userQnAVO) {
		mapper.qnaUpdate(userQnAVO);
	}


	@Override
	public void qnaDelete(int qnaNo) {
		mapper.qnaDelete(qnaNo);
	}


	@Override
	public FileVO userNoticeDownload(int fileNo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String selectCusId(int cusNo) {
		return mapper.selectCusId(cusNo);
	}








}
