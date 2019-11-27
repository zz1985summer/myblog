package com.zz.myblog.dao;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.zz.myblog.domain.UserDomain;


public interface UserMapper {
	@Select("SELECT * FROM blog_user WHERE username = #{username}")
	@Results({
		@Result(property="uid",column="uid"),
		@Result(property="role",column="user_role"),
		@Result(property="password",column="password")
		
	})
		
	UserDomain getUserByName(String username); 
}
