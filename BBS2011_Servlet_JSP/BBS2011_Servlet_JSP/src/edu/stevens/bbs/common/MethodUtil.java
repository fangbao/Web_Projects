package edu.stevens.bbs.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import edu.stevens.bbs.pojo.User;

public class MethodUtil {
	
	public static  int validateId(String strId,JspWriter out) throws IOException{
		if(strId == null || strId.trim().equals("")) {
			out.println("Error ID!");
			return -1;
		}
		int id = 0;
		try {
			id = Integer.parseInt(strId);
		} catch (NumberFormatException e) {
			out.println("Error ID Again!");
			return -1;
		}
		
		return id;
	}
	
	public static User initUser(HttpServletRequest request){
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		//------------
		String passwordConfirm=request.getParameter("passwordConfirm");
		
		String address=request.getParameter("location");
		String job=request.getParameter("occupation");
		String website=request.getParameter("homepage");
		String description=request.getParameter("biography");
		String signature=request.getParameter("signature");
		boolean autoLogin=Boolean.parseBoolean(request.getParameter("autoLogin"));
		
		User user=new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAddress(address);
		user.setJob(job);
		user.setWebsite(website);
		user.setDescription(description);
		user.setSignature(signature);
		user.setAutoLogin(autoLogin);
		
		return user;
	}
}
