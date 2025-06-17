package kr.or.ddit.management.human.management.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.login.vo.LoginCommonAuthVO;
import kr.or.ddit.management.human.management.mapper.ManagementMapper;
import kr.or.ddit.management.human.management.service.IManagementService;
import kr.or.ddit.management.human.management.vo.EmployeeVO;
import kr.or.ddit.util.vo.PaginationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManagementServiceImpl implements IManagementService {

	@Inject
	private PasswordEncoder pe;
	
	@Inject
	private ManagementMapper mapper;
	
	@Resource(name="winUploadPath")
	private String winResourcePath;
	
	@Resource(name = "macUploadPath")
	private String macResourcePath;
	
	private static String resourcePath;
	
	@Override
	public List<EmployeeVO> empList() {
		log.info("# ManagementServiceImpl list");
		return mapper.empList();
	}

	@Override
	public int empRegister(HttpServletRequest req, EmployeeVO employeeVO) {
		log.info("# ManagementServiceImpl register");
		
		String os = System.getProperty("os.name").toLowerCase();
		if(os.contains("win")) {
			resourcePath = winResourcePath;
		}
		if(os.contains("mac")) {
			resourcePath = macResourcePath;
		}
		
		resourcePath+="/empProfile/";
		
		File file = new File(resourcePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		employeeVO.setEmpPw(pe.encode(employeeVO.getEmpDepw()));
		
		String empImage = "";
		
		try {
			MultipartFile profileImgFile = employeeVO.getImgFile();
			
			if(profileImgFile !=null && profileImgFile.getOriginalFilename()!=null && !profileImgFile.getOriginalFilename().equals("")) {
			String fileName = UUID.randomUUID().toString();
			fileName+="_"+profileImgFile.getOriginalFilename();
			resourcePath +=fileName;
			profileImgFile.transferTo(new File(resourcePath));
			empImage = "/upload/empProfile/"+fileName;
			}
			employeeVO.setEmpImage(empImage);
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		
		return mapper.empRegister(employeeVO);
	}

	@Override
	public EmployeeVO empDetail(String empId) {
		log.info("# ManagementServiceImpl detail");
		return mapper.empDetail(empId);
	}

	@Override
	public void empUpdate(EmployeeVO employeeVO) {
		log.info("# ManagementServiceImpl update");
		mapper.empUpdate(employeeVO);
		
		 LoginCommonAuthVO authVO = new LoginCommonAuthVO();
		 authVO.setEmpNo(employeeVO.getEmpNo());
		 if(employeeVO.getEmpDept().equals("인사부")) {
			authVO.setAuthName("ROLE_HUMAN");
		 }
		 if(employeeVO.getEmpDept().equals("전산부")) {
			 authVO.setAuthName("ROLE_INFO");
		 }
		 if(employeeVO.getEmpDept().equals("협력업체 관리부")) {
			 authVO.setAuthName("ROLE_PARTNER");
		 }
		 if(employeeVO.getEmpDept().equals("공항서비스 관리부")) {
			 authVO.setAuthName("ROLE_SERVICE");
		 }
		
		
		mapper.authUpdate(authVO);
	}

	@Override
	public void empDelete(String empId) {
		mapper.empDelete(empId);
	}

	@Override
	public int selectEmpCount(PaginationVO<EmployeeVO> pagingVO) {
		return mapper.selectEmpCount(pagingVO);
	}

	@Override
	public List<EmployeeVO> selectEmpList(PaginationVO<EmployeeVO> pagingVO) {
		return mapper.selectEmpList(pagingVO);
	}

	@Override
	public EmployeeVO count() {
		return mapper.count();
	}

	// 직원 리스트 엑셀 다운로드
//	@Override
//	public List<EmployeeVO> selectEmployeeList(String searchWord, String searchType) {
//		return mapper.selectEmployeeList(searchWord,searchType );
//	}

	@Override
	public List<EmployeeVO> selectEmployeeList() {
		// TODO Auto-generated method stub
		return mapper.selectEmployeeList();
	}


}
