package edu.stevens.bbs.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "t_user")
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
	
	private Set<Banzhu> banzhus=new HashSet<Banzhu>();


	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(unique=true,nullable=false,length=20)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(nullable=false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(nullable=false,length=20)
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

	@OneToMany(mappedBy="user",fetch=FetchType.EAGER)
	public Set<Banzhu> getBanzhus() {
		return banzhus;
	}

	public void setBanzhus(Set<Banzhu> banzhus) {
		this.banzhus = banzhus;
	}

}
