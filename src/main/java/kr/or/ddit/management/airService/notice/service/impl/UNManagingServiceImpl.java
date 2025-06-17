package kr.or.ddit.management.airService.notice.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.notice.vo.UserFAQVO;
import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.customer.notice.vo.UserQnAVO;
import kr.or.ddit.management.airService.notice.mapper.IUNManagingMapper;
import kr.or.ddit.management.airService.notice.service.IUNManagingService;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UNManagingServiceImpl implements IUNManagingService {

	@Inject
	private IUNManagingMapper unmapper;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;
	
	
	// FAQ
	
	@Override
	public List<UserFAQVO> faqList() {
		return unmapper.faqList();
	}

	@Override
	public void faqUpdate(UserFAQVO notice) {
		unmapper.faqUpdate(notice);
	}

	@Override
	public void faqDelete(int faqNo) {
		unmapper.faqDelete(faqNo);
	}

	@Override
	public void faqAdd(UserFAQVO notice) {
		unmapper.faqAdd(notice);
	}
	
	
	// NOTICE

	@Override
	public List<UserNoticeVO> noticeList() {
		return unmapper.noticeList();
	}

	@Override
	public void noticeAdd(UserNoticeVO userNoticeVO) {
		unmapper.noticeAdd(userNoticeVO);
	}

	@Override
	public UserNoticeVO noticeDetail(int noNo) {
		return unmapper.noticeDetail(noNo);
	}

	@Override
	public void noticeDelete(int noNo) {
		unmapper.noticeDelete(noNo);
	}

	@Override
	public void noticeUpdate(UserNoticeVO userNoticeVO) {
		unmapper.noticeUpdate(userNoticeVO);
	}

	@Override
	public int insertUserNotice(UserNoticeVO noticeVO) {

		if (noticeVO.getNoFile()[0].getSize() !=0) {
			noticeVO.setNoFilecode("02");
		}else {
			noticeVO.setNoFilecode("00");
			
		}
		
		int result = unmapper.insertUserNotice(noticeVO);
		if(result > 0) {
			List<FileVO> noticeFileList = noticeVO.getNoticeFileList();
			
			noticeFileUpload(noticeFileList, noticeVO.getNoNo());
			result = 2;
		}else {
			result = 0;
		}
		return result;
	}
	
	@Override
	public int updateUserNotice(UserNoticeVO userNoticeVO) {
		if (userNoticeVO.getNoFile()[0].getSize() !=0) {
			userNoticeVO.setNoFilecode("02");
		}else {
			userNoticeVO.setNoFilecode("00");
		}
		int result = unmapper.updateUserNotice(userNoticeVO);
		if(result > 0) {
			List<FileVO> noticeFileList = userNoticeVO.getNoticeFileList();
			
			noticeFileUpload(noticeFileList, userNoticeVO.getNoNo());
			
			Integer [] delNoticeNo = userNoticeVO.getDelNoticeNo();
			if(delNoticeNo != null) {
				for (int i = 0; i < delNoticeNo.length; i++) {
					FileVO noticeFileVO = unmapper.selectNoticeFile(delNoticeNo[i]);
					unmapper.deleteNoticeFile(delNoticeNo[i]);
					File file = new File(noticeFileVO.getFileSavepath());
					file.delete();
				}
			}
			 result = 2;
			
		}else {
			result = 0;
		}
		
		
		return result;
		
	}
	
	@Override
	public UserNoticeVO selectUserNotice(UserNoticeVO noticeVO) {
//		noticeMapper.incrementHit(noNo);
		//selectEmpNotice->noNo : 46
		log.info("selectEmpNotice->noNo : " + noticeVO.getNoNo());
		String fileOwner = "02"+ noticeVO.getNoNo();
		noticeVO.setFileOwner(fileOwner);
		/* 샵{fileOwner}
		 UserNoticeVO(noNo=46, noTitle=null, noCategory=null, noContent=null, noCode=null, noFilecode=null, 
		 empNo=0, noCount=0, noDelyn=null, noDate=null, empName=null, fileOwner=0246, delNoticeNo=null, noFile=null, 
		 noticeFileList=null)
		 
		 private String fileOwner;
		 */
		log.info("selectEmpNotice->noticeVO : " + noticeVO);
		return unmapper.selectUserNotice(noticeVO);
	}
	

	
	// QNA
	
	@Override
	public int userQnACount(PaginationVO<UserQnAVO> pagingVO) {
		return unmapper.userQnACount(pagingVO);
	}
	
	@Override
	public List<UserQnAVO> userQnAList(PaginationVO<UserQnAVO> pagingVO) {
		return unmapper.userQnAList(pagingVO);
	}
	
	@Override
	public UserQnAVO qnaDetail(int qnaNo) {
		return unmapper.qnaDetail(qnaNo);
	}
	
	@Override
	public FileVO takeQnAFile(int qnaNo) {
		return unmapper.takeQnAFile(qnaNo);
	}
	
	@Override
	public void qnaDelete(int qnaNo) {
		unmapper.qnaDelete(qnaNo);
	}

	@Override
	public void qnaUpdate(UserQnAVO userQnAVO) {
		unmapper.qnaUpdate(userQnAVO);
	}

	
	
	// PAGING
	
	@Override
	public int userNoticeCount(PaginationVO<UserNoticeVO> pagingVO) {
		return unmapper.userNoticeCount(pagingVO);
	}
	
	@Override
	public List<UserNoticeVO> userNoticeList(PaginationVO<UserNoticeVO> pagingVO) {
		return unmapper.userNoticeList(pagingVO);
	}

	
	// DOWNLOAD FILE
	@Override
	public void saveFile(FileVO fileVO) {
		unmapper.saveFile(fileVO);
	}

	@Override
	public FileVO takeNoticeFile(int noNo) {
		return unmapper.takeNoticeFile(noNo);
	}

	private void noticeFileUpload(List<FileVO> noticeFileList, int noNo) {

		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		resourcePath+="/UserNotice/";
		
		for (FileVO fileVO : noticeFileList) {
			String fileSavename = UUID.randomUUID().toString();
			fileSavename+="_"+fileVO.getFileRealname();
			
			String fileSavepath = resourcePath+noNo;
			File file = new File(fileSavepath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			fileSavepath += "/"+fileSavename;
			
			// 공지첨부파일 02
			fileVO.setFileOwner("02"+noNo);
			fileVO.setFileSavepath(fileSavepath);
			fileVO.setFileSavename(fileSavename);
			unmapper.insertUserNoticeFile(fileVO);
			
			File saveFile = new File(fileSavepath);
			
			try {
				fileVO.getItem().transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	@Override
	public FileVO USerNoticeDownload(int fileNo) {
		FileVO noticeFileVO = unmapper.UserNoticeDownload(fileNo);
		if(noticeFileVO == null) {
			throw new RuntimeException();
		}
		
		unmapper.incrementUserNoticeFileDown(fileNo);
		
		
		return noticeFileVO;
	}





	
	
}
