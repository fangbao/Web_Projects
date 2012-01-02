package edu.stevens.bbs.dao;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class DB {

	private static SessionFactory sf;
	static
	{
		sf=new AnnotationConfiguration().configure().buildSessionFactory();
	}
	
	public static SessionFactory getSessionFactory(){
		return sf;
	}
	
}
