package edu.stevens.bbs.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import edu.stevens.bbs.pojo.Article;
import edu.stevens.bbs.pojo.FenyeResult;
import edu.stevens.bbs.pojo.User;



public class ArticleDAO {
	
	private SessionFactory sf=DB.getSessionFactory();
	
	public void save(Article article){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(article);
		article.setRootid(article.getId());
		User u=(User)session.createQuery("from User u where u.name='"+article.getUser().getName()+"'").uniqueResult();
		u.setTotalPost(u.getTotalPost()+1);
		
		session.getTransaction().commit();
	}
	
	
	public void save2(Article article){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(article);
		
		Article parentArticle=(Article)session.get(Article.class, article.getPid());
		parentArticle.setLeaf(false);
		
		Article rootArticle=(Article)session.get(Article.class, article.getRootid());
		rootArticle.setLastDate(new Date());
		rootArticle.setRelpys(rootArticle.getRelpys()+1);
		
		User u=(User)session.createQuery("from User u where u.name='"+article.getUser().getName()+"'").uniqueResult();
		u.setTotalPost(u.getTotalPost()+1);
		
		session.getTransaction().commit();
	}
	
	public Article getArticle(int id){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Article article=(Article)session.get(Article.class, id);
		session.getTransaction().commit();
		return article;
	}
	
	public List<Article> getChildrenArticles(int id){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<Article> list=(List<Article>)session.createQuery("from Article a where a.rootid="+id+" order by a.pdate asc").list();
		Article article=(Article)session.get(Article.class, id);
		article.setScans(article.getScans()+1);
		
		session.getTransaction().commit();
		return list;
	}
	
	public FenyeResult getArticles(int pageNo,int PAGE_SIZE,int categoryid){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Query q=session.createQuery("from Article a where a.pid=-1 and a.category.id="+categoryid+" order by zhiding desc,lastdate desc");
		List<Article> list=(List<Article>)q.list();
		int totalRecords = list.size();
		int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;

		if (pageNo > totalPages)
			pageNo = totalPages;
		
		if (pageNo <= 0)
			pageNo = 1;
		
		int startPos = (pageNo - 1) * PAGE_SIZE;
		q.setFirstResult(startPos);
		q.setMaxResults(PAGE_SIZE);
		
		List<Article> articles=(List<Article>)q.list();
		
		FenyeResult result=new FenyeResult();
		result.setArticles(articles);
		result.setPageNo(pageNo);
		result.setTotalPages(totalPages);
		session.getTransaction().commit();
		return result;
	}
	
	
	public void deleteRootArticle(Article article){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		
		List<Article> articles=(List<Article>)session.createQuery("from Article a where a.rootid="+article.getRootid()).list();
		for(Article a:articles){
			session.delete(a);
		}
		
		session.getTransaction().commit();
	}
		
	
	
	public void updateArticle(Article newArticle) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.update(newArticle);
		session.getTransaction().commit();
	}
	
	public FenyeResult uncertainQuery(String str,int model,int pageNo,int PAGE_SIZE){
			
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		String sqlStr="";
		if(1==model){
			sqlStr="from Article a where a.pid=-1 and a.title like :str order by zhiding desc,lastdate desc";
		}else
			sqlStr="from Article a where a.pid=-1 and (a.title like :str or a.content like :str) order by zhiding desc,lastdate desc";
		Query q=session.createQuery(sqlStr).setString("str", "%"+str+"%");
		List<Article> list=(List<Article>)q.list();
		int totalRecords = list.size();
		int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;

		if (pageNo > totalPages)
			pageNo = totalPages;
		
		if (pageNo <= 0)
			pageNo = 1;
		

		int startPos = (pageNo - 1) * PAGE_SIZE;
		
		q.setFirstResult(startPos);
		q.setMaxResults(PAGE_SIZE);
		
		List<Article> articles=(List<Article>)q.list();
		
		FenyeResult result=new FenyeResult();
		result.setArticles(articles);
		result.setPageNo(pageNo);
		result.setTotalPages(totalPages);
		session.getTransaction().commit();
		return result;
	}
}
