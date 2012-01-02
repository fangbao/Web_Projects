package edu.stevens.bbs.pojo;

import java.util.List;
import java.util.Set;

public class Category {
	
	private int id;
	private String name;
	private String description;
	private List<Article> articles;
	private Set<Banzhu> banzhus;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Article> getArticles() {
		return articles;
	}
	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	public Set<Banzhu> getBanzhus() {
		return banzhus;
	}
	public void setBanzhus(Set<Banzhu> banzhus) {
		this.banzhus = banzhus;
	}
	
	
}
