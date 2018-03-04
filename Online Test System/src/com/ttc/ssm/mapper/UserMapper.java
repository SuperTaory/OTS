package com.ttc.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ttc.ssm.po.User;

public interface UserMapper {
	
	void insertuser(User user);
	
	User selectByNameAndPasswd(@Param("name")String name, @Param("passwd")String passwd);
	
	User selectByName(@Param("name")String name);
	
	void updateUser(User user);
	
	List<User> selectAllUser();
	
	List<User> selectAllIssuer();
	
	void deleteUser(int userid);
	
	void updateUserRole(User user);
	
	List<User> selectUserByKeywords(@Param("keywords")String keywords);
}
