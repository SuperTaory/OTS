package com.ttc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;










import com.ttc.ssm.mapper.UserMapper;
import com.ttc.ssm.po.User;
import com.ttc.ssm.service.UserService;

public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;
	
	public void insert(User user) throws Exception{
		userMapper.insertuser(user);
	}
	
	public User selectByNameAndPasswd(String name,String passwd) throws Exception{
		return userMapper.selectByNameAndPasswd(name, passwd);
	}
	
	public User selectByName(String name) throws Exception{
		return userMapper.selectByName(name);
	}
	
	public  void updateUser(User user) {
		userMapper.updateUser(user);
	}

	public List<User> selectAllUser() throws Exception{
		return userMapper.selectAllUser();
	}
	
	public void deleteUser(int userid) {
		userMapper.deleteUser(userid);
	}
	
	public void updateUserRole(User user) throws Exception{
		userMapper.updateUserRole(user);
	}
	
	public List<User> selectAllIssuer() throws Exception{
		return userMapper.selectAllIssuer();
	}
	public List<User> selectUserByKeywords(String keywords) throws Exception{
		return userMapper.selectUserByKeywords(keywords);
	}
}
