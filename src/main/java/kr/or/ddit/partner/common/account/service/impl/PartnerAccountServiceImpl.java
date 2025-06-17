package kr.or.ddit.partner.common.account.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.partner.common.account.mapper.PartnerAccountMapper;
import kr.or.ddit.partner.common.account.service.IPartnerAccountService;
import kr.or.ddit.partner.common.account.vo.PartnerVO;
import kr.or.ddit.util.vo.FileVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PartnerAccountServiceImpl implements IPartnerAccountService {
	
	@Inject
	private PartnerAccountMapper mapper;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;

	@Override
	public int register(PartnerVO partnerVO) {
	    log.info("# PartnerAccountServiceImpl register");

	    if (partnerVO.getPtFile()[0].getSize() != 0) {
	        partnerVO.setPtFilecode("10");
	    } else {
	        partnerVO.setPtFilecode("00");
	    }

	    // ptImageUpload 호출
	    ptImageUpload(partnerVO); // 이미지 업로드를 수행하고 partnerVO에 설정

	    int result = mapper.register(partnerVO);

	    if (result > 0) {
	        List<FileVO> ptFileList = partnerVO.getPtFileList();
	        ptFileUpload(ptFileList, partnerVO.getPtNo());


	        result = 1; // 성공적으로 등록 및 이미지 업로드
	    } else {
	        result = 0;
	    }
	    return result;
	}
	
	
	private void ptFileUpload(List<FileVO> ptFileList, int ptNo) {
		
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		resourcePath += "/partnerAccount/";

		for(FileVO fileVO : ptFileList) {
			String fileSavename = UUID.randomUUID().toString();		// UUID의 랜덤 파일명 생성
			fileSavename += "_" + fileVO.getFileRealname();
			
			String fileSavepath = resourcePath + ptNo;
			File file = new File(fileSavepath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			fileSavepath += "/" + fileSavename;
			
			// 첨부파일 테이블 - 첨부파일소유자 (협력업체계정신청 10)
			fileVO.setFileOwner("10" + ptNo);
			fileVO.setFileSavepath(fileSavepath);
			fileVO.setFileSavename(fileSavename);
			mapper.insertPtFile(fileVO);
			
			File saveFile = new File(fileSavepath);
			
			try {
				fileVO.getItem().transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	public void ptImageUpload(PartnerVO partnerVO) {
	    String os = System.getProperty("os.name").toLowerCase();
	    if (os.contains("win")) {
	        resourcePath = winResourcePath;
	    } else if (os.contains("mac")) {
	        resourcePath = macResourcePath;
	    }

	    resourcePath += "/partnerAccount/";

	    File file = new File(resourcePath);
	    if (!file.exists()) {
	        file.mkdirs();
	    }

	    String ptImage = "";

	    try {
	        MultipartFile ptImgFile = partnerVO.getImgFile();

	        if (ptImgFile != null && ptImgFile.getOriginalFilename() != null && !ptImgFile.getOriginalFilename().equals("")) {
	            String fileName = UUID.randomUUID().toString();
	            fileName += "_" + ptImgFile.getOriginalFilename();
	            String fullPath = resourcePath + fileName; // 전체 경로를 저장

	            ptImgFile.transferTo(new File(fullPath));
	            ptImage = "/upload/partnerAccount/" + fileName; // 이미지 경로 설정
	        }
	        partnerVO.setPtImage(ptImage); // partnerVO에 이미지 경로 설정
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


	@Override
	public int accountCount(PaginationVO<PartnerVO> pagingVO) {
		log.info("# PartnerAccountServiceImpl accountCount");
		return mapper.accountCount(pagingVO);
	}

	@Override
	public List<PartnerVO> list(PaginationVO<PartnerVO> pagingVO) {
		log.info("# PartnerAccountServiceImpl list");
		return mapper.list(pagingVO);
	}

	@Override
	public PartnerVO detail(PartnerVO partnerVO) {
		log.info("# PartnerAccountServiceImpl detail");
		return mapper.detail(partnerVO);
	}

	@Override
	public int update(PartnerVO partnerVO) {

		log.info("# PartnerAccountServiceImpl update");
		
		/*
		ptFile=null 이므로 get 하면 null인데 거기서 index 0을 가져온다고 하면 오류 발생
		 */
		if(partnerVO.getPtFile() != null) {//파일 있음
			partnerVO.setPtFilecode("10");
		}else {//파일없음
			partnerVO.setPtFilecode("00");
		}
		
		// ptImageUpload 호출
	    ptImageUpload(partnerVO); // 이미지 업로드를 수행하고 partnerVO에 설정
		
		int result = mapper.update(partnerVO);

		if(result > 0) {
			List<FileVO> ptFileList = partnerVO.getPtFileList();
			
			//변경할 파일이 있을때만 실행
			if(ptFileList!=null) {
				ptFileUpload(ptFileList, partnerVO.getPtNo());
			}
			
			//변경인데 파일을 삭제하는 변경이 있을때만 실행
			if(partnerVO.getDelPtNo()!=null) {
				Integer [] delPtNo = partnerVO.getDelPtNo();
				
				if(delPtNo != null) {
					for (int i = 0; i < delPtNo.length; i++) {
						FileVO ptFileVO = mapper.selectPtFile(delPtNo[i]);
						mapper.deletePtFile(delPtNo[i]);
						File file = new File(ptFileVO.getFileSavepath());
						file.delete();
					}
				}
			}
			 result = 1;
			
		}else {
			result = 0;
		}
		return result;
	}
	
	@Override
	public void approve(PartnerVO partnerVO) {
		log.info("# PartnerAccountServiceImpl approve");
		mapper.approve(partnerVO);
	}

	@Override
	public PartnerVO count() {
		log.info("# PartnerAccountServiceImpl count");
		return mapper.count();
	}

	@Override
	public void idIssue(PartnerVO partnerVO) {
		log.info("# PartnerAccountServiceImpl idIssue");
		mapper.idIssue(partnerVO);
	}

	@Override
	public FileVO ptDownload(int fileNo) {
		log.info("# PartnerAccountServiceImpl ptDownload");
		FileVO ptFileVO = mapper.ptDownload(fileNo);
		if(ptFileVO == null) {
			throw new RuntimeException();
		}
		
		mapper.incrementPtFileDown(fileNo);
		
		return ptFileVO;
	}
	
	// 협력업체 로그인 
	@Override
	public PartnerVO partnerLogin(PartnerVO partner) {
		return mapper.partnerLogin(partner);
	}
	
	@Override
	public PartnerVO pieChart() {
		log.info("# PartnerAccountServiceImpl pieChart");
		return mapper.pieChart();
	}
	

	@Override
	public List<Integer> thisBarChart() {
		return mapper.thisBarChart();
	}

	@Override
	public List<Integer> preBarChart() {
		return mapper.preBarChart();
	}


	@Override
	public List<PartnerVO> list2() {
		return mapper.list2();
	}
}
