package com.zz.myblog.config;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import com.zz.myblog.domain.User;
import com.zz.myblog.service.UserService;
import com.zz.myblog.util.Md5PasswordEncoder;



@Component
public class MyAuthenticationProvider implements AuthenticationProvider{
	@Autowired
	private UserService userDetailService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username=authentication.getName();		//获取表单输入中返回的用户名
		String password=(String)authentication.getCredentials();     //获取表单中的密码
		
		User userInfo=userDetailService.loadUserByUsername(username);
		
		if(userInfo == null) {
			throw new BadCredentialsException("用户名不存在");
		}
		
		//System.out.println(org.springframework.util.DigestUtils.md5DigestAsHex("123456".getBytes()));
		//这里我们还要判断密码是否正确，实际应用中，我们的密码一般都会加密，以Md5加密为例
         Md5PasswordEncoder md5PasswordEncoder=new Md5PasswordEncoder();
         String encodePwd = md5PasswordEncoder.encode(password);
        //这里判断密码正确与否
         if(!userInfo.getPassword().equals(encodePwd)) {
        	 throw new BadCredentialsException("密码不正确");
         }
        //这里还可以加一些其他信息的判断，比如用户账号已停用等判断，这里为了方便我接下去的判断，我就不用加密了。
		
		
		Collection<? extends GrantedAuthority> authorities = userInfo.getAuthorities();
		
		return new UsernamePasswordAuthenticationToken(userInfo, encodePwd,authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// 这里直接改成retrun true;表示是支持这个执行
		return true;
	}

}
