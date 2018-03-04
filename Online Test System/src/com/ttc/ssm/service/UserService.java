package com.ttc.ssm.service;

import java.util.List;

import com.ttc.ssm.po.User;

public interface UserService {
	
	public void insert(User user) throws Exception;
	
	public User selectByNameAndPasswd(String name,String passwd) throws Exception;
	
	public User selectByName(String name) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public List<User> selectAllUser() throws Exception;
	
	public void deleteUser(int userid) throws Exception;
	
	public void updateUserRole(User user) throws Exception;
	
	public List<User> selectAllIssuer() throws Exception;
	
	public List<User> selectUserByKeywords(String keywords) throws Exception;
}
