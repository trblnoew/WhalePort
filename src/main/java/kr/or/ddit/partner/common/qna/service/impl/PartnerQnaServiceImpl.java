package kr.or.ddit.partner.common.qna.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import kr.or.ddit.customer.notice.vo.UserFAQVO;
import kr.or.ddit.partner.common.qna.mapper.PartnerQnaMapper;
import kr.or.ddit.partner.common.qna.service.IPartnerQnaService;
import kr.or.ddit.partner.common.qna.vo.PartnerFaqVO;
import kr.or.ddit.partner.common.qna.vo.PartnerQnaVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PartnerQnaServiceImpl implements IPartnerQnaService{

	@Inject
	private PartnerQnaMapper mapper;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;

	@Override
	public int register(PartnerQnaVO partnerQnaVO) {
		
		if (partnerQnaVO.getQnaFile()[0].getSize() !=0) {
			partnerQnaVO.setQueFilecode("03");
		}else {
			partnerQnaVO.setQueFilecode("00");
		}
		
		int result = mapper.register(partnerQnaVO);
		
		if(result > 0) { // 등록 성공
			// 문의사항 게시글 등록 시 업로드 한 파일 목록을 가져온다.
			List<FileVO> qnaFileList = partnerQnaVO.getQnaFileList();
			
			// 문의사항 파일 업로드 처리
			qnaFileUpload(qnaFileList, partnerQnaVO.getQnaNo());
			result = 1;
	    } else { // 등록 실패
	        result = 0;
	    }
	    return result;
	}
	
	private void qnaFileUpload(List<FileVO> qnaFileList, int qnaNo) {
		
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		resourcePath += "/partnerQna/";

		for(FileVO fileVO : qnaFileList) {
			String fileSavename = UUID.randomUUID().toString();		// UUID의 랜덤 파일명 생성
			fileSavename += "_" + fileVO.getFileRealname();
			
			// '/resources/partnerQna/2/'와 같은 폴더 구조를 생성
			String fileSavepath = resourcePath + qnaNo;
			File file = new File(fileSavepath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			fileSavepath += "/" + fileSavename;
			
			// 첨부파일 테이블 - 첨부파일소유자 (협력업체문의사항 03)
			fileVO.setFileOwner("03" + qnaNo);
			fileVO.setFileSavepath(fileSavepath);
			fileVO.setFileSavename(fileSavename);
			mapper.insertQnaFile(fileVO);
			
			File saveFile = new File(fileSavepath);
			
			try {
				fileVO.getItem().transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	@Override
	public int update(PartnerQnaVO partnerQnaVO) {
		log.info("# PartnerQnaServiceImpl update");
		
		if (partnerQnaVO.getQnaFile()[0].getSize() !=0) {
			partnerQnaVO.setQueFilecode("03");
		}else {
			partnerQnaVO.setQueFilecode("00");
		}
		
		int result = mapper.update(partnerQnaVO);

		if(result > 0) {
			List<FileVO> qnaFileList = partnerQnaVO.getQnaFileList();
			
			qnaFileUpload(qnaFileList, partnerQnaVO.getQnaNo());
			
			Integer [] delQnaNo = partnerQnaVO.getDelQnaNo();
			
			if(delQnaNo != null) {
				for (int i = 0; i < delQnaNo.length; i++) {
					FileVO qnaFileVO = mapper.selectQnaFile(delQnaNo[i]);
					mapper.deleteQnaFile(delQnaNo[i]);
					File file = new File(qnaFileVO.getFileSavepath());
					file.delete();
				}
			}
			 result = 1;
			
		}else {
			result = 0;
		}
		return result;
	}
		
	@Override
	public int qnaCount(PaginationVO<PartnerQnaVO> pagingVO) {
		log.info("# PartnerQnaServiceImpl qnaCount");
		return mapper.qnaCount(pagingVO);
	}

	@Override
	public List<PartnerQnaVO> qnaList(PaginationVO<PartnerQnaVO> pagingVO) {
		log.info("# PartnerQnaServiceImpl qnaList");
		return mapper.qnaList(pagingVO);
	}

	@Override
	public List<PartnerQnaVO> qnaList2(PaginationVO<PartnerQnaVO> pagingVO) {
		log.info("# PartnerQnaServiceImpl qnaList2");
		return mapper.qnaList2(pagingVO);
	}

	@Override
	public PartnerQnaVO detail(PartnerQnaVO partnerQnaVO) {
		log.info("# PartnerQnaServiceImpl detail");
		String fileOwner = "03"+ partnerQnaVO.getQnaNo();
		partnerQnaVO.setFileOwner(fileOwner);
		return mapper.detail(partnerQnaVO);
	}
	
	@Override
	public PartnerQnaVO detail2(PartnerQnaVO partnerQnaVO) {
		log.info("# PartnerQnaServiceImpl detail");
		String fileOwner = "03"+ partnerQnaVO.getQnaNo();
		partnerQnaVO.setFileOwner(fileOwner);
		return mapper.detail2(partnerQnaVO);
	}

	@Override
	public int delete(int qnaNo) {
		return mapper.delete(qnaNo);
	}

	@Override
	public FileVO qnaDownload(int fileNo) {
		log.info("# PartnerQnaServiceImpl qnaDownload");
		FileVO qnaFileVO = mapper.qnaDownload(fileNo);
		if(qnaFileVO == null) {
			throw new RuntimeException();
		}
		
		mapper.incrementQnaFileDown(fileNo);
		
		return qnaFileVO;
	}

	@Override
	public int answer(PartnerQnaVO partnerQnaVO) {
	    log.info("# PartnerQnaServiceImpl answer");
	    
	    // 답변 처리
	    int result = mapper.answer(partnerQnaVO);
	    
	    if(result > 0) {
	        result = 1;
	    } else {
	        result = 0;
	    }
	    return result;
	}

	@Override
	public List<PartnerFaqVO> faqList() {
		return mapper.faqList();
	}

	@Override
	public int register(PartnerFaqVO partnerFaqVO) {
		
		int result = mapper.faqRegister(partnerFaqVO);
		
		if(result > 0) { // 등록 성공
			result = 1;
	    } else { // 등록 실패
	        result = 0;
	    }
	    return result;
	}
	
	@Override
	public int faqDelete(int faqNo) {
		
		int result = mapper.faqDelete(faqNo);
		
		if(result > 0) { 
			result = 1;
		} else { 
			result = 0;
		}
		return result;
	}
	
	@Override
	public int faqUpdate(PartnerFaqVO partnerFaqVO) {
		
		int result = mapper.faqUpdate(partnerFaqVO);
		
		if(result > 0) { 
			result = 1;
	    } else { 
	        result = 0;
	    }
	    return result;
	}

}