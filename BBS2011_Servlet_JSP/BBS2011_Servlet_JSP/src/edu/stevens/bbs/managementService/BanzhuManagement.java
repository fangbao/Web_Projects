package edu.stevens.bbs.managementService;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

import edu.stevens.bbs.dao.Ban_Cat_DAO;
import edu.stevens.bbs.dao.BanzhuDAO;
import edu.stevens.bbs.dao.DB;
import edu.stevens.bbs.pojo.Banzhu;
import edu.stevens.bbs.pojo.Category;
import edu.stevens.bbs.pojo.User;

public class BanzhuManagement {

	BanzhuDAO bd = new BanzhuDAO();
	Ban_Cat_DAO bcd = new Ban_Cat_DAO();

	public void addBanzhu(User user, Category category,int level) {
		Connection conn=null;
		Banzhu banzhu=new Banzhu();
		banzhu.setUser(user);
		banzhu.setLevel(level);
		try {
			conn = DB.getConn();
			conn.setAutoCommit(false);
			if(bcd.getCategories(banzhu).size()==0)
				bd.save(banzhu, conn);
			bcd.save(banzhu, category, conn);
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(conn);
		}
	}
	
	public void deleteBanzhu(Banzhu banzhu, Category category){
		Connection conn=null;
		try {
			conn = DB.getConn();
			conn.setAutoCommit(false);
		
			bcd.delete(banzhu, category, conn);
			if(bcd.getCategories(banzhu).size()==1)
				bd.delete(banzhu, conn);
			
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(conn);
		}
	}

	public Set<Banzhu> getBanzhus(Category category){
		return bcd.getBanzhus(category);
	}
	
	public Banzhu getBanzhu(int id){
		return bd.getBanzhu(id);
	}
}
