package kr.or.ddit.common.login.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.etc.chat.service.IChatService;
import kr.or.ddit.common.login.vo.LoginCommonVO;
import kr.or.ddit.util.security.CustomLoginSuccessHandler;

@Controller
@RequestMapping
public class UserController {

	
	// active users, non-active users test
	@Inject
	private IChatService chatService;
	
    @GetMapping("/active-users")
    public String activeUsers(Model model) {
    	List<LoginCommonVO> commonVO = chatService.list();
    	model.addAttribute("commonVO", commonVO);
        model.addAttribute("activeUsers", CustomLoginSuccessHandler.getActiveUserIds());
        return "active-users"; // active-users.html 뷰로 리턴
    }
    
    
}
