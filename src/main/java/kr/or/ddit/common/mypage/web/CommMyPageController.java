package kr.or.ddit.common.mypage.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.common.mypage.service.CommMyPageService;
import kr.or.ddit.util.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 임효정, 최동재
 * 직원 마이페이지
 *
 */
@Slf4j
@Controller
@RequestMapping("/common")
public class CommMyPageController {
	
	@Inject
	private CommMyPageService commService;
	
	@GetMapping("/myPage")
	public String myPages() {
		return "common/myPage/commProfile";
	}
	
	// 직원 정보 화면
	@GetMapping("/profile")
	public String selectProfile(Model model) {
	    CustomUser auth = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    LoginCommonVO loginCommonVO = auth.getMember();

	    loginCommonVO = commService.selectProfile(loginCommonVO);
	    log.info("LoginCommonVO: " + loginCommonVO);
	    
	    // 조회된 정보를 모델에 추가
	    model.addAttribute("loginCommonVO", loginCommonVO);
	    
	    return "common/myPage/profile";
	}
	
	// 직원 정보 수정 화면 - POST
	@PostMapping("/profileUpdate")
	public String updateProfile(LoginCommonVO loginCommonVO, HttpServletRequest req, Model model, RedirectAttributes ra) {
	    String goPage = "";

	    CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    LoginCommonVO loggedInUser = user.getMember();
	    
	    ra.addFlashAttribute("msg", "수정");
		ra.addFlashAttribute("message", "수정이 완료되었습니다!");
	    
	    if (loggedInUser != null) {
	        loginCommonVO.setEmpId(loggedInUser.getEmpId());
	        ServiceResult result = commService.updateProfile(req, loginCommonVO);

	        if (result.equals(ServiceResult.OK)) {
	            user.setMember(loginCommonVO);
	            goPage = "redirect:/common/profile";
	        } else {
	            model.addAttribute("message", "서버에러, 다시 시도해주세요!");
	            goPage = "/common/profile";
	        }
	    }
	    return goPage;
	}
}
