package edu.stevens.bbs.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import edu.stevens.bbs.pojo.User;

public class UserDAO {

	private SessionFactory sf=DB.getSessionFactory();
		
	public void save(User user) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
	}

	public void delete(User user) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		User u=(User)session.get(User.class, user.getId());
		session.delete(u);
		session.getTransaction().commit();
	}

	public List<User> getUsers() {		
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<User> list=(List<User>)session.createQuery("from User u").list();
		session.getTransaction().commit();
		return list;
	}

	public User getUser(int id) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		User user=(User)session.get(User.class,id);
		session.getTransaction().commit();
		return user;
	}
	
	public User getUser(String name){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		User user=(User)session.createQuery("from User u where u.name='"+name+"'").uniqueResult();
		session.getTransaction().commit();
		return user;
	}


	public boolean isUserNameExist(String name) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<User> list=(List<User>)session.createQuery("from User u where u.name='"+name+"'").list();
		if(list.size()>0)
			return true;
		session.getTransaction().commit();
		return false;
	}

	public boolean isPwdCorrect(String name, String password) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<User> list=(List<User>)session.createQuery("from User u where u.name='"+name+"'").list();
		String pwd=list.get(0).getPassword();
		if (pwd.equals(password))
			return true;
		session.getTransaction().commit();
		return false;

	}

	public void updateUser(User newUser) {
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.update(newUser);
		session.getTransaction().commit();
	}
	
	public int getTotalUsersCount(){
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<User> list=(List<User>)session.createQuery("from User u").list();
		session.getTransaction().commit();
		return list.size();
	}
	
	public User getLastUser(){
		User u=new User();
		u.setName("nobody");
		
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		List<User> list=(List<User>)session.createQuery("from User u").list();
		session.getTransaction().commit();
		if(list.size()==0)
			return u;
		return list.get(list.size()-1);
	}

}
