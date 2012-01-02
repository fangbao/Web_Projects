package edu.stevens.bbs.pojo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "t_category")
public class Category {

	private int id;
	private String name;
	private String description;
	private List<Article> articles=new ArrayList<Article>();
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(mappedBy="category",fetch=FetchType.EAGER)
	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

	public void setBanzhus(Set<Banzhu> banzhus) {
		this.banzhus = banzhus;
	}

	@OneToMany(mappedBy="category",fetch=FetchType.EAGER)
	public Set<Banzhu> getBanzhus() {
		return banzhus;
	}

	

}
