package com.zz.myblog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.zz.myblog.dao.UserMapper;
import com.zz.myblog.domain.User;
import com.zz.myblog.domain.UserDomain;




@Component
public class UserService implements UserDetailsService {
	
	@Autowired
	private UserMapper userMapper;
	
	
	@Override
	public User loadUserByUsername(String username) throws UsernameNotFoundException {
		 UserDomain tmpUser = userMapper.getUserByName(username);		
		 User userDetails = new User();
		 
		 List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		 		 
		 if(tmpUser!=null) {
			 userDetails.setUid(tmpUser.getUid());
			 userDetails.setUsername(tmpUser.getUsername());
			 userDetails.setPassword(tmpUser.getPassword());
			 System.out.println(tmpUser.getRole());
			 if(tmpUser.getRole().contains(",")) {
				 String[] roles_arr = tmpUser.getRole().split(",");
				 if(roles_arr!=null) {
					 for(short i=0;i<roles_arr.length;i++) {
						authList.add(new SimpleGrantedAuthority(roles_arr[i]));
					 }
					 
					
				 }
			 }else {
				 authList.add(new SimpleGrantedAuthority( tmpUser.getRole()));
			 }
			 
			 if(authList.size()>0) {
				userDetails.setAuthorities(authList);
			}			
			 
		 }
		
		return userDetails;
		
	}

}
