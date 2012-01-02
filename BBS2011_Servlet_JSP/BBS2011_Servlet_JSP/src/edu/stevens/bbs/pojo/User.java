package edu.stevens.bbs.pojo;

import java.util.Date;

public class User {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String address;
	private String job;
	private String website;
	private String description;
	private String signature;
	private boolean autoLogin;
	private Date datetime;
	private int totalPost;
	private boolean hasUserImg;
	private boolean hasSignatureImg;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public boolean isAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(boolean autoLogin) {
		this.autoLogin = autoLogin;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public int getTotalPost() {
		return totalPost;
	}
	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
	}
	public boolean isHasUserImg() {
		return hasUserImg;
	}
	public void setHasUserImg(boolean hasUserImg) {
		this.hasUserImg = hasUserImg;
	}
	public boolean isHasSignatureImg() {
		return hasSignatureImg;
	}
	public void setHasSignatureImg(boolean hasSignatureImg) {
		this.hasSignatureImg = hasSignatureImg;
	}
	
		
	
}
