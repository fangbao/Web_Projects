package edu.stevens.bbs.pojo;
import java.sql.Timestamp;
import java.util.Date;


public class Article {
	private int id;
	private User user;
	private int pid; //private Article parent;
	private int rootid;
	private String title;
	private String content;
	private Date pdate;
	private int scans;
	private int relpys;  //do not save into db;
	private boolean leaf;
	private int grade;
	private boolean jinghua;
	private boolean zhiding;
	private Timestamp lastDate;
	private Category category;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getRootid() {
		return rootid;
	}
	public void setRootid(int rootid) {
		this.rootid = rootid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public int getScans() {
		return scans;
	}
	public void setScans(int scans) {
		this.scans = scans;
	}
	
	
	public int getRelpys() {
		return relpys;
	}
	public void setRelpys(int relpys) {
		this.relpys = relpys;
	}
	public boolean isJinghua() {
		return jinghua;
	}
	public void setJinghua(boolean jinghua) {
		this.jinghua = jinghua;
	}
	public boolean isZhiding() {
		return zhiding;
	}
	public void setZhiding(boolean zhiding) {
		this.zhiding = zhiding;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Timestamp getLastDate() {
		return lastDate;
	}
	public void setLastDate(Timestamp lastDate) {
		this.lastDate = lastDate;
	}
	
	
	
}
