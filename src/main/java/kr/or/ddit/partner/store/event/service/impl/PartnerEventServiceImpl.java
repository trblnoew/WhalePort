package kr.or.ddit.partner.store.event.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.management.airService.popup.vo.PopupVO;
import kr.or.ddit.partner.store.event.mapper.IPartnerEventMapper;
import kr.or.ddit.partner.store.event.service.IPartnerEventService;
import kr.or.ddit.util.vo.PaginationVO;

@Service
public class PartnerEventServiceImpl implements IPartnerEventService {

	@Inject
	private IPartnerEventMapper eventMapper;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;
	
	
	
	@Override
	public int selectStoreEventCount(PaginationVO<PopupVO> pagingVO) {
		return eventMapper.selectStoreEventCount(pagingVO);
	}
	
	

	@Override
	public List<PopupVO> selectStoreEventList(PaginationVO<PopupVO> pagingVO) {
		return eventMapper.selectStoreEventList(pagingVO);
	}

	@Override
	public PopupVO selectStoreEvent(int popNo) {
		return eventMapper.selectStoreEvent(popNo);
	}

	@Override
	public int insert(PopupVO eventVO) {
		
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		resourcePath+="/event/";
		
		File file = new File(resourcePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String popImg = "";
		
		try {
			MultipartFile eventImgFile = eventVO.getPopupImgFile();
			
			if(eventImgFile !=null && eventImgFile.getOriginalFilename()!=null && !eventImgFile.getOriginalFilename().equals("")) {
			String fileName = UUID.randomUUID().toString();
			fileName+="_"+eventImgFile.getOriginalFilename();
			resourcePath +=fileName;
			eventImgFile.transferTo(new File(resourcePath));
			popImg = "/upload/event/"+fileName;
			}
			eventVO.setPopImg(popImg);
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		
		int result = eventMapper.insert(eventVO);
		
		return result;
		
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
			
			PopupVO eventVO2 = eventMapper.selectStoreEvent(eventVO.getPopNo());

			if(eventImgFile !=null && eventImgFile.getOriginalFilename()!=null && !eventImgFile.getOriginalFilename().equals("")) {
				
				
				
				String alreayPath = resourcePath+eventVO2.getPopImg().substring(7);
				File file2 = new File(alreayPath);
				file2.delete();
				
				String fileName = UUID.randomUUID().toString();
				fileName+="_"+eventImgFile.getOriginalFilename();
				resourcePath+="/event/"+fileName;
				eventImgFile.transferTo(new File(resourcePath));
				popImg = "/upload/event/"+fileName;
			}else {
				popImg = eventVO2.getPopImg();
				
			}
			eventVO.setPopImg(popImg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int result = eventMapper.update(eventVO);
		
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
			
		PopupVO eventVO = eventMapper.selectStoreEvent(popNo);
		String alreayPath = resourcePath+eventVO.getPopImg().substring(7);
		File file2 = new File(alreayPath);
		file2.delete();
		
		int result = eventMapper.delete(popNo);
		
		return result;
	}

}
