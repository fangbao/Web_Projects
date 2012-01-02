package edu.stevens.bbs.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import edu.stevens.bbs.pojo.Banzhu;
import edu.stevens.bbs.pojo.Category;


public class BanzhuDAO {
	
	private SessionFactory sf=DB.getSessionFactory();
	public void save(Banzhu banzhu) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(banzhu);
		session.getTransaction().commit();
	}
	
	public void delete(Banzhu banzhu) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Banzhu b=(Banzhu)session.get(Banzhu.class, banzhu.getId());
		session.delete(b);
		session.getTransaction().commit();
	}
	
	

	public List<Banzhu> getBanzhus() {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<Banzhu> list=(List<Banzhu>)session.createQuery("from Banzhu b").list();
		session.getTransaction().commit();
		return list;
	}
	
	public Banzhu getBanzhu(int id) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Banzhu banzhu=(Banzhu)session.get(Banzhu.class,id);
		session.getTransaction().commit();
		return banzhu;
	}
	
	public Banzhu getBanzhuThoughUid(int uid) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Banzhu banzhu=(Banzhu)session.createQuery("from Banzhu b where b.user.id="+uid).uniqueResult();
		session.getTransaction().commit();
		return banzhu;
	}
}
