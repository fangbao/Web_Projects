package edu.stevens.bbs.managementService;

import edu.stevens.bbs.bbsException.UserNameExistException;
import edu.stevens.bbs.dao.UserDAO;
import edu.stevens.bbs.pojo.User;

public class UserManagement {
	
	public static final int USERNOTEXSIT=-1;
	public static final int PWDNOTCORRECT=-2;
	public static final int LOGINSUCCESS=1;

	public UserDAO userDAO=new UserDAO();
	
	public void add(User user) throws UserNameExistException{
		
		if(userDAO.isUserNameExist(user.getName()))
			throw new UserNameExistException("your username has existed!") ;
		userDAO.save(user);
	}
	
	public int isLoginSuccess(String username,String password){
		if(!userDAO.isUserNameExist(username))
			return USERNOTEXSIT;
		if(!userDAO.isPwdCorrect(username, password))
			return PWDNOTCORRECT;
		
		return LOGINSUCCESS;
		
	}
	
	public User getUser(int id){
		return userDAO.getUser(id);
	}
	
	public User getUser(String username){
		return userDAO.getUser(username);
	}
	
	public void delete(User user){
		userDAO.delete(user);
	}
	
	public void update(User newUser){
		userDAO.updateUser(newUser);
	}
	
	
	public User getLastUser(){
		return userDAO.getLastUser();
	}
	
	public int getTotalUsersCount(){
		return userDAO.getTotalUsersCount();
	}
}
