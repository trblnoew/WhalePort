package kr.or.ddit.util.error;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ErrorController {
    
    
    @GetMapping("/error400")
    public String error400(Model model) {
    	log.info("========== ERROR 400 PAGE ==========");
        model.addAttribute("code", "ERROR_404");
        return "error/400";
    }
    
    @GetMapping("/error404")
    public String error404(Model model) {
    	log.info("========== ERROR 404 PAGE ==========");
    	model.addAttribute("code", "ERROR_404");
    	return "error/404";
    }
    
    @GetMapping("/error405")
    public String error405(Model model) {
    	log.info("========== ERROR 405 PAGE ==========");
    	model.addAttribute("code", "ERROR_405");
    	return "error/405";
    }
    
    @GetMapping("/error415")
    public String error415(Model model) {
    	log.info("========== ERROR 415 PAGE ==========");
    	model.addAttribute("code", "ERROR_415");
    	return "error/415";
    }
    
    @GetMapping("/error500")
    public String error500(Model model) {
    	log.info("========== ERROR 500 PAGE ==========");
    	model.addAttribute("code", "ERROR_500");
    	return "error/500";
    }
    
  
}
