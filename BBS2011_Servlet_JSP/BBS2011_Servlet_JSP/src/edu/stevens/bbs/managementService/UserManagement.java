package edu.stevens.bbs.managementService;

import edu.stevens.bbs.bbsException.UserNameExistException;
import edu.stevens.bbs.dao.UserDAO;
import edu.stevens.bbs.pojo.User;

public class UserManagement {
	
	public static final int USERNOTEXSIT=-1;
	public static final int PWDNOTCORRECT=-2;
	public static final int LOGINSUCCESS=1;

	public UserDAO dao=new UserDAO();
	
	public void add(User user) throws UserNameExistException{
		
		if(dao.isUserNameExist(user.getName()))
			throw new UserNameExistException("your username has existed!") ;
		dao.save(user);
	}
	
	public int isLoginSuccess(String username,String password){
		if(!dao.isUserNameExist(username))
			return USERNOTEXSIT;
		if(!dao.isPwdCorrect(username, password))
			return PWDNOTCORRECT;
		
		return LOGINSUCCESS;
		
	}
	
	public User getUser(String username){
		User user=dao.getUser(username);
		return user;
	}
	
	public void delete(User user){
		dao.delete(user);
	}
	
	public void update(User newUser){
		dao.updateUser(newUser);
	}
	
	public User copyUser(User oldUser){
		User newUser=new User();
		newUser.setId(oldUser.getId());
		newUser.setName(oldUser.getName());
		newUser.setPassword(oldUser.getPassword());
		newUser.setEmail(oldUser.getEmail());
		newUser.setAddress(oldUser.getAddress());
		newUser.setAutoLogin(oldUser.isAutoLogin());
		newUser.setDatetime(oldUser.getDatetime());
		newUser.setDescription(oldUser.getDescription());
		newUser.setHasSignatureImg(oldUser.isHasSignatureImg());
		newUser.setHasUserImg(oldUser.isHasUserImg());
		newUser.setJob(oldUser.getJob());
		newUser.setSignature(oldUser.getSignature());
		newUser.setTotalPost(oldUser.getTotalPost());
		newUser.setWebsite(oldUser.getWebsite());
		
		return newUser;
		
	}
	
	public User getLastUser(){
		return dao.getLastUser();
	}
	
	public int getTotalUsersCount(){
		return dao.getTotalUsersCount();
	}
}
