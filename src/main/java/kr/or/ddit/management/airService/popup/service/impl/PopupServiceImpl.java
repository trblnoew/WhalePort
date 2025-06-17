package kr.or.ddit.management.airService.popup.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.management.airService.popup.mapper.IPopupMapper;
import kr.or.ddit.management.airService.popup.service.IPopupService;
import kr.or.ddit.management.airService.popup.vo.PopupVO;
import kr.or.ddit.util.vo.PaginationVO;

@Service
public class PopupServiceImpl implements IPopupService {
	
	@Inject
	private IPopupMapper popupMapper;
	
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;
	

	@Override
	public int selectPopupCount(PaginationVO<PopupVO> pagingVO) {
		return popupMapper.selectPopupCount(pagingVO);
	}

	@Override
	public List<PopupVO> selectPopupList(PaginationVO<PopupVO> pagingVO) {
		return popupMapper.selectPopupList(pagingVO);
	}

	@Override
	public int insert(PopupVO popupVO) {
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		resourcePath+="/popup/";
		
		File file = new File(resourcePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String popImg = "";
		
		try {
			MultipartFile eventImgFile = popupVO.getPopupImgFile();
			
			if(eventImgFile !=null && eventImgFile.getOriginalFilename()!=null && !eventImgFile.getOriginalFilename().equals("")) {
			String fileName = UUID.randomUUID().toString();
			fileName+="_"+eventImgFile.getOriginalFilename();
			resourcePath +=fileName;
			eventImgFile.transferTo(new File(resourcePath));
			popImg = "/upload/popup/"+fileName;
			}
			popupVO.setPopImg(popImg);
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		
		int result = popupMapper.insert(popupVO);
		
		return result;
		
	}
	
	@Override
	public PopupVO selectPopup(int popNo) {
		return popupMapper.selectPopup(popNo);
	}

	@Override
	public PopupVO selectPopupPosting() {
		
		return popupMapper.selectPopupPosting();
		
	}

	@Override
	public int update(PopupVO eventVO) {
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		
		File file = new File(resourcePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String popImg = "";
		
		try {
			MultipartFile eventImgFile = eventVO.getPopupImgFile();
			
			PopupVO eventVO2 = popupMapper.selectPopup(eventVO.getPopNo());

			if(eventImgFile !=null && eventImgFile.getOriginalFilename()!=null && !eventImgFile.getOriginalFilename().equals("")) {
				
				
				
				String alreayPath = resourcePath+eventVO2.getPopImg().substring(7);
				File file2 = new File(alreayPath);
				file2.delete();
				
				String fileName = UUID.randomUUID().toString();
				fileName+="_"+eventImgFile.getOriginalFilename();
				resourcePath+="/popup/"+fileName;
				eventImgFile.transferTo(new File(resourcePath));
				popImg = "/upload/popup/"+fileName;
			}else {
				popImg = eventVO2.getPopImg();
				
			}
			eventVO.setPopImg(popImg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int result = popupMapper.update(eventVO);
		
		return result;
	}

	@Override
	public int delete(int popNo) {
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
			
		PopupVO eventVO = popupMapper.selectPopup(popNo);
		String alreayPath = resourcePath+eventVO.getPopImg().substring(7);
		File file2 = new File(alreayPath);
		file2.delete();
		
		int result = popupMapper.delete(popNo);
		
		return result;
	}

	@Override
	public int rejectUpate(PopupVO popupVO) {
		return popupMapper.rejectUpate(popupVO);
	}

	@Override
	public int updateApproval(int popNo) {
		return popupMapper.updateApproval(popNo) ;
	}

	@Override
	public void endPopup() {
		popupMapper.endPopup();
		
	}
	
	
	

}
