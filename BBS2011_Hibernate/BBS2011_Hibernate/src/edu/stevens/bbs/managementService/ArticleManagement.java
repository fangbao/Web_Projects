package edu.stevens.bbs.managementService;

import java.util.List;

import edu.stevens.bbs.dao.ArticleDAO;
import edu.stevens.bbs.pojo.Article;
import edu.stevens.bbs.pojo.FenyeResult;

public class ArticleManagement {
	
	private ArticleDAO articleDAO=new ArticleDAO();
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
		articleDAO.save(article);
	}
	
	public void replyArticle(Article article){
		articleDAO.save2(article);
	}
	
	public Article getArticle(int id){
		return articleDAO.getArticle(id);
	}
	
	public FenyeResult getArticles(int pageNo,int categoryid){
		
		FenyeResult result=null;
		
		result=articleDAO.getArticles(pageNo, PAGE_SIZE,categoryid);
		
		return result;

	}
	
	public List<Article> getChildrenArticles(int id){
		List<Article> articles=null;
		
		articles=articleDAO.getChildrenArticles(id);
		
		return articles;
	}
	
	
	public void deleteRootArticle(Article article){
		articleDAO.deleteRootArticle(article);		
	}
	
	public void update(Article newArticle) {
		articleDAO.updateArticle(newArticle);
	}
	
	public FenyeResult uncertainQuery(String str,int model,int pageNo){
		return articleDAO.uncertainQuery(str, model, pageNo, PAGE_SIZE);
	}
}
