package kr.or.ddit.common.mypage.service.impl;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.common.mypage.mapper.CommMyPageMapper;
import kr.or.ddit.common.mypage.service.CommMyPageService;
import kr.or.ddit.common.mypage.web.ServiceResult;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class CommMyPageServiceImpl implements CommMyPageService {
	
	@Inject
	private CommMyPageMapper commMapper;
	
	@Inject
	private PasswordEncoder pe;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;
	
	// 직원 정보 조회
	@Override
	public LoginCommonVO selectProfile(LoginCommonVO loginCommonVO) {
		return commMapper.selectProfile(loginCommonVO);
	}
	
	
	// 직원 정보 수정
	@Override
	public ServiceResult updateProfile(HttpServletRequest req, LoginCommonVO loginCommonVO) {

	    ServiceResult result = null;

	    String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		resourcePath+="/profile/";
		
		File file = new File(resourcePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		loginCommonVO.setEmpPw(pe.encode(loginCommonVO.getEmpDepw()));
		log.info("loginCommonVO" + loginCommonVO);

	    String profileImg = "";

	    try {
	        MultipartFile profileImgFile = loginCommonVO.getImgFile();
	        
	        if (profileImgFile != null && profileImgFile.getOriginalFilename() != null && !profileImgFile.getOriginalFilename().equals("")) {
	            String fileName = UUID.randomUUID().toString();
	            fileName += "_" + profileImgFile.getOriginalFilename();
	            resourcePath += "/" + fileName;
	            profileImgFile.transferTo(new File(resourcePath));
	            profileImg = "/upload/profile/" + fileName;
	        }
	        loginCommonVO.setEmpImage(profileImg);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // 프로필 업데이트 쿼리 실행
	    int status = commMapper.updateProfile(loginCommonVO);
	    if (status > 0) {
	        result = ServiceResult.OK;
	    } else {
	        result = ServiceResult.FAILED;
	    }
	    return result;
	}
}
