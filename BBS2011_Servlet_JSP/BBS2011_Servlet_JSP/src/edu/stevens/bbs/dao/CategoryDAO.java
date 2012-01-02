package edu.stevens.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.stevens.bbs.pojo.Category;




public class CategoryDAO {
	public void save(Category category){
		Connection conn = DB.getConn();
		String sql = "insert into category values(null,?,?)";
		PreparedStatement pstmt = DB.prepareStmt(conn, sql);
		try {
			pstmt.setString(1, category.getName());
			pstmt.setString(2, category.getDescription());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	public void delete(Category category) throws SQLException {
		Connection conn = DB.getConn();
		conn.setAutoCommit(false);
		String sql="delete from article where cid="+category.getId();
		DB.executeUpdate(conn, sql);
		sql = "delete from category where id=" + category.getId();
		DB.executeUpdate(conn, sql);
		conn.commit();
		conn.setAutoCommit(true);
		DB.close(conn);
	}
	
	
	public List<Category> getCategories() {
		List<Category> list = new ArrayList<Category>();

		Connection conn = DB.getConn();
		String sql = "select * from category";
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			while (rs.next()) {
				Category category=new Category();
				DAOutil.initialCategory(rs, category);
				list.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}

		return list;
	}
	
	public void update(Category newCategory) {
		Connection conn = DB.getConn();
		String sql = "update category set name=?,description=? where id="
				+ newCategory.getId();
		PreparedStatement pstmt = DB.prepareStmt(conn, sql);
		try {
			pstmt.setString(1, newCategory.getName());
			pstmt.setString(2, newCategory.getDescription());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	public static Category getCategory(int id){
		Category category = null;
		Connection conn = DB.getConn();
		String sql = "select * from category where id=" + id;
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			if (rs.next()) {
				category = new Category();
				DAOutil.initialCategory(rs, category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return category;
	}
	
	public int getScans(int categoryid) throws SQLException{
		Connection conn = DB.getConn();
		String sql = "select scan from article where cid=" + categoryid;
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		int scans=0;
		while(rs.next()){
			scans+=rs.getInt(1);
		}
		
		return scans;
	}
	
	public int getArticles(int categoryid) throws SQLException{
		Connection conn = DB.getConn();
		String sql = "select count(*) from article where cid=" + categoryid;
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		int count=0;
		if(rs.next()){
			count=rs.getInt(1);
		}
		
		return count;
	}
	
	public int getRootArticles(int categoryid) throws SQLException{
		Connection conn = DB.getConn();
		String sql = "select count(*) from article where pid=0 and cid=" + categoryid;
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		int count=0;
		if(rs.next()){
			count=rs.getInt(1);
		}
		
		return count;
	}
}
