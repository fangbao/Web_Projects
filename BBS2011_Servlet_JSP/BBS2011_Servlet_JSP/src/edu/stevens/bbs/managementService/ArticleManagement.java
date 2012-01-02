package edu.stevens.bbs.managementService;

import java.sql.SQLException;
import java.util.List;

import edu.stevens.bbs.dao.ArticleDAO;
import edu.stevens.bbs.pojo.Article;
import edu.stevens.bbs.pojo.FenyeResult;

public class ArticleManagement {
	
	private ArticleDAO ad=new ArticleDAO();
	private static final int PAGE_SIZE=4;
	
	public static int getLouNo(List<Article> list,int pid){
		int i=0;
		for(Article a:list){
			i++;
			if(pid==a.getId()){
				return i;
			}
		}
		return -1;
	}
	
	public void addArticle(Article article){
		try {
			ad.save(article);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void replyArticle(Article article){
		try {
			ad.save2(article);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Article getArticle(int id){
		return ad.getArticle(id);
	}
	
	public FenyeResult getArticles(int pageNo,int categoryid){
		
		FenyeResult result=null;
		try {
			result=ad.getArticles(pageNo, PAGE_SIZE,categoryid);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return result;

	}
	
	public List<Article> getChildrenArticles(int id){
		List<Article> articles=null;
		
		try {
			articles=ad.getChildrenArticles(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return articles;
	}
	
	
	public void deleteArticle(Article article,boolean isLeaf){
		try {
			ad.delete(article, isLeaf);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Article newArticle) {
		ad.updateArticle(newArticle);
	}
	
	
}
