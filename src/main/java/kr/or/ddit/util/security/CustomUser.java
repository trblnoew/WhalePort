package kr.or.ddit.util.security;


import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.common.login.vo.LoginCommonVO;



public class CustomUser extends User{
	private LoginCommonVO member;
	
	// 첫번째 생성자는 User 객체로 부모에게 전달
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(LoginCommonVO member) {
		super(member.getEmpId(), member.getEmpPw(), 
				member.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuthName())).
				collect(Collectors.toList()));
		
		this.member = member;
	}

	public LoginCommonVO getMember() {
		return member;
	}

	public void setMember(LoginCommonVO member) {
		this.member = member;
	}
	
    public String getEmpName() {
        return member.getEmpName();
    }
    
    public String getEmpDept() {
        return member.getEmpDept();
    }

    public String getEmpEmail() {
        return member.getEmpEmail();
    }
    
    public String getImgFile() {
        return (member.getEmpImage() != null && !member.getEmpImage().isEmpty()) ? member.getEmpImage() 
        		: "/resources/assets/images/logos/customerMainProfile.png";
    }
}

