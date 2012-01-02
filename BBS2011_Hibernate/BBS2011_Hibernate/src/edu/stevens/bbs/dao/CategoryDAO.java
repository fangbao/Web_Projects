package edu.stevens.bbs.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import edu.stevens.bbs.pojo.Article;
import edu.stevens.bbs.pojo.Banzhu;
import edu.stevens.bbs.pojo.Category;




public class CategoryDAO {
	
	private SessionFactory sf=DB.getSessionFactory();
	
	public void save(Category category){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(category);
		session.getTransaction().commit();
	}
	
	public void delete(Category category) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Category c=(Category)session.get(Category.class, category.getId());
		session.delete(c);
		session.getTransaction().commit();
	}
	
	public List<Category> getCategories(Banzhu banzhu) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<Category> list=(List<Category>)session.createQuery("from Category c where c.banzhus="+banzhu.getId()).list();
		session.getTransaction().commit();
		return list;
	}
	
	public List<Category> getCategories() {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<Category> list=(List<Category>)session.createQuery("from Category c").list();
		session.getTransaction().commit();
		return list;
	}
	
	public void update(Category newCategory) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.update(newCategory);
		session.getTransaction().commit();
	}
	
	public Category getCategory(int id){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Category category=(Category)session.get(Category.class,id);
		session.getTransaction().commit();
		return category;
	}
	
	public int getScanCount(int categoryid){
		
		List<Article> list=getArticles(categoryid);
		int count=0;
		for(Article a :list){
			count+=a.getScans();
		}
		
		return count;
	}
	
	public List<Article> getArticles(int categoryid){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<Article> list=(List<Article>)session.createQuery("from Article a where a.category.id="+categoryid).list();
		session.getTransaction().commit();
		return list;
	}
	
	public List<Article> getRootArticles(int categoryid){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<Article> list=(List<Article>)session.createQuery("from Article a where a.pid=-1 and a.category.id="+categoryid).list();
		session.getTransaction().commit();
		return list;
	}
	
}
