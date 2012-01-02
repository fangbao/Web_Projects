package edu.stevens.bbs.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_article")
public class Article {
	private int id;
	private User user;
	private int pid; // private Article parent;
	private int rootid;
	private String title;
	private String content;
	private Date pdate;
	private int scans;
	private int relpys; // do not save into db;
	private boolean leaf;
	private int grade;
	private boolean jinghua;
	private boolean zhiding;
	private Date lastDate;
	private Category category;

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(nullable=false)
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	@Column(nullable=false)
	public int getRootid() {
		return rootid;
	}

	public void setRootid(int rootid) {
		this.rootid = rootid;
	}

	@Column(nullable=false)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(nullable=false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(nullable=false)
	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	@Column(nullable=false)
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

	@ManyToOne
	@JoinColumn(name="cid")
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@ManyToOne
	@JoinColumn(name="userid")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	

}
