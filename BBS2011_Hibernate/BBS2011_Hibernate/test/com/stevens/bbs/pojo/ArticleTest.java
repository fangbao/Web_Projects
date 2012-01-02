package com.stevens.bbs.pojo;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.junit.Test;


public class ArticleTest {

	private static SessionFactory sf;
	
	
	

	@Test
	public void testSchemaExport() {
		try{
		new SchemaExport(new AnnotationConfiguration().configure()).create(false, true);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
}
