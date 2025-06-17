package kr.or.ddit.management.info.notice.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.customer.notice.vo.UserNoticeVO;
import kr.or.ddit.management.info.notice.mapper.IEmpNoticeMapper;
import kr.or.ddit.management.info.notice.service.IEmpNoticeService;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpNoticeServiceImpl implements IEmpNoticeService {
	
	@Inject
	private IEmpNoticeMapper noticeMapper;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;
	

	@Override
	public int selectEmpNoticeCount(PaginationVO<UserNoticeVO> pagingVO) {
		return noticeMapper.selectEmpNoticeCount(pagingVO);
	}

	@Override
	public List<UserNoticeVO> selectEmpNoticeList(PaginationVO<UserNoticeVO> pagingVO) {
		return noticeMapper.selectEmpNoticeList(pagingVO);
	}

	@Override
	public UserNoticeVO selectEmpNotice(UserNoticeVO noticeVO) {
		
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
		return noticeMapper.selectEmpNotice(noticeVO);
	}

	@Override
	public int insertEmpNotice(UserNoticeVO noticeVO) {
		
		
		if (noticeVO.getNoFile()[0].getSize() !=0) {
			noticeVO.setNoFilecode("02");
		}else {
			noticeVO.setNoFilecode("00");
			
		}
		
		int result = noticeMapper.insertEmpNotice(noticeVO);
		if(result > 0) {
			List<FileVO> noticeFileList = noticeVO.getNoticeFileList();
			
			noticeFileUpload(noticeFileList, noticeVO.getNoNo());
			result = 2;
		}else {
			result = 0;
		}
		return result;
	}

	private void noticeFileUpload(List<FileVO> noticeFileList, int noNo) {

		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		resourcePath+="/empNotice/";
		
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
			noticeMapper.insertEmpNoticeFile(fileVO);
			
			File saveFile = new File(fileSavepath);
			
			try {
				fileVO.getItem().transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	@Override
	public FileVO empNoticeDownload(int fileNo) {
		FileVO noticeFileVO = noticeMapper.empNoticeDownload(fileNo);
		if(noticeFileVO == null) {
			throw new RuntimeException();
		}
		
		noticeMapper.incrementEmpNoticeFileDown(fileNo);
		
		
		return noticeFileVO;
	}

	@Override
	public int updateEmpNotice(UserNoticeVO noticeVO) {
		
		if (noticeVO.getNoFile()[0].getSize() !=0) {
			noticeVO.setNoFilecode("02");
			log.info("길이 : ", noticeVO.getNoFile().length );
			log.info("길이2 : ", noticeVO.getNoFile()[0].getSize());
		}else {
			noticeVO.setNoFilecode("00");
			
		}
		
		
		
		int result = noticeMapper.updateEmpNotice(noticeVO);
		if(result > 0) {
			List<FileVO> noticeFileList = noticeVO.getNoticeFileList();
			
			noticeFileUpload(noticeFileList, noticeVO.getNoNo());
			
			Integer [] delNoticeNo = noticeVO.getDelNoticeNo();
			if(delNoticeNo != null) {
				for (int i = 0; i < delNoticeNo.length; i++) {
					FileVO noticeFileVO = noticeMapper.selectNoticeFile(delNoticeNo[i]);
					noticeMapper.deleteNoticeFile(delNoticeNo[i]);
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
	public int deleteEmpNotice(int noNo) {
		return noticeMapper.deleteEmpNotice(noNo);
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
