package edu.stevens.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;

import edu.stevens.bbs.pojo.Banzhu;
import edu.stevens.bbs.pojo.Category;


public class Ban_Cat_DAO {
	public void save(Banzhu banzhu,Category category,Connection conn){
		String sql = "insert into banzhu_category values(?,?)";
		PreparedStatement pstmt = DB.prepareStmt(conn, sql);
		try {
			pstmt.setInt(1, banzhu.getUser().getId());
			pstmt.setInt(2, category.getId());	
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
		}
	}
	
	
	public void delete(Banzhu banzhu,Category category,Connection conn){
		String sql = "delete from banzhu_category where bid=" + banzhu.getUser().getId()
					+" and cid="+category.getId();
		DB.executeUpdate(conn, sql);
	}
	
	public static Set<Category> getCategories(Banzhu banzhu){
		Set<Category> set=new HashSet<Category>();
		Connection conn = DB.getConn();
		String sql = "select * from banzhu_category where bid="+banzhu.getUser().getId();
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			while (rs.next()) {
				Category category = CategoryDAO.getCategory(rs.getInt("cid"));
				set.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}

		return set;
	}
	
	public static Set<Banzhu> getBanzhus(Category category){
		Set<Banzhu> set=new HashSet<Banzhu>();
		Connection conn = DB.getConn();
		String sql = "select * from banzhu_category where cid="+category.getId();
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			while (rs.next()) {
				Banzhu banzhu=BanzhuDAO.getBanzhu(rs.getInt("bid"));
				set.add(banzhu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}

		return set;
	}
}
