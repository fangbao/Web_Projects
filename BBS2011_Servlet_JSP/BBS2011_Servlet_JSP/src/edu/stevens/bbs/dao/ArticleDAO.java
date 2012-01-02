package edu.stevens.bbs.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.stevens.bbs.pojo.Article;
import edu.stevens.bbs.pojo.FenyeResult;



public class ArticleDAO {
	
	public void save(Article article) throws SQLException{
		Connection conn = DB.getConn();

		boolean autoCommit = conn.getAutoCommit();
		conn.setAutoCommit(false);
		
		int rootId = -1;
		
		String sql = "insert into article values (null, ?, ?, ?, ?, now(),0, ?,?,false,false,?,now())";
		PreparedStatement pstmt = DB.prepareStmt(conn, sql, Statement.RETURN_GENERATED_KEYS);
		pstmt.setInt(1, 0);
		pstmt.setInt(2, rootId);
		pstmt.setString(3, article.getTitle());
		pstmt.setString(4, article.getContent());
		pstmt.setInt(5, 0);
		pstmt.setString(6,article.getUser().getName());
		pstmt.setInt(7, article.getCategory().getId());
		pstmt.executeUpdate();
		
		ResultSet rsKey = pstmt.getGeneratedKeys();
		rsKey.next();
		rootId = rsKey.getInt(1);
	
		Statement stmt = DB.createStmt(conn);
		stmt.executeUpdate("update article set rootid = " + rootId + " where id = "	+ rootId);
		
		stmt.executeUpdate("update user set totalPost=totalPost+1 where name='"+article.getUser().getName()+"'");

		conn.commit();
		conn.setAutoCommit(autoCommit);
		DB.close(pstmt);
		DB.close(stmt);
		DB.close(conn);
	}
	
	
	public void save2(Article article) throws SQLException{
		Connection conn = DB.getConn();

		boolean autoCommit = conn.getAutoCommit();
		conn.setAutoCommit(false);

		String sql = "insert into article values (null, ?, ?, ?, ?, now(),0,?,?,false,false,?,now())";
		PreparedStatement pstmt = DB.prepareStmt(conn, sql);
		pstmt.setInt(1, article.getPid());
		pstmt.setInt(2, article.getRootid());
		pstmt.setString(3, article.getTitle());
		pstmt.setString(4, article.getContent());
		pstmt.setInt(5, 0);
		pstmt.setString(6, article.getUser().getName());
		pstmt.setInt(7, article.getCategory().getId());
		pstmt.executeUpdate();

		Statement stmt = DB.createStmt(conn);
		stmt.executeUpdate("update article set isleaf = 1, lastdate=now() where id = "
				+ article.getPid());
				
		stmt.executeUpdate("update user set totalPost=totalPost+1 where name='"+article.getUser().getName()+"'");

		conn.commit();
		conn.setAutoCommit(autoCommit);
		DB.close(pstmt);
		DB.close(stmt);
		DB.close(conn);
	}
	
	public Article getArticle(int id){
		Article article = null;
		Connection conn = DB.getConn();
		String sql = "select * from article where id=" + id;
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			if (rs.next()) {
				article = new Article();
				DAOutil.initFromRs(article, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return article;
	}
	
	public List<Article> getChildrenArticles(int id) throws SQLException{
		List<Article> articles = new ArrayList<Article>();
		Connection conn = DB.getConn();
		String sql = "select * from article where rootid = " + id + " order by pdate asc";
		Statement stmt = DB.createStmt(conn);

		//add scans into db;
		stmt.executeUpdate("update article set scan=scan+1 where id="+id);

		ResultSet rs = DB.executeQuery(stmt, sql);

		while(rs.next()) {
			Article a = new Article();
			DAOutil.initFromRs(a,rs);
			articles.add(a);
		}

		DB.close(rs);
		DB.close(stmt);
		DB.close(conn);
		
		return articles;
	}
	
	public FenyeResult getArticles(int pageNo,int PAGE_SIZE,int categoryid) throws SQLException{
		int totalPages = 0;

		List<Article> articles = new ArrayList<Article>();
		Connection conn = DB.getConn();

		Statement stmtCount = DB.createStmt(conn);
		ResultSet rsCount = DB.executeQuery(stmtCount,
				"select count(*) from article where pid = 0 and cid="+categoryid);
		rsCount.next();
		int totalRecords = rsCount.getInt(1);

		totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;
		
		DB.close(rsCount);
		DB.close(stmtCount);

		if (pageNo > totalPages)
			pageNo = totalPages;
		
		if (pageNo <= 0)
			pageNo = 1;
		

		Statement stmt = DB.createStmt(conn);
		int startPos = (pageNo - 1) * PAGE_SIZE;
		String sql = "select * from article where pid = 0 and cid="+categoryid+" order by zhiding desc,lastdate desc limit "
				+ startPos + "," + PAGE_SIZE;
		// System.out.println(sql);
		ResultSet rs = DB.executeQuery(stmt, sql);
		while (rs.next()) {
			Article a = new Article();
			DAOutil.initFromRs(a, rs);

			Statement stmt2 = DB.createStmt(conn);
			ResultSet rs2 = DB.executeQuery(stmt2,
			"select count(*) from article where rootid="
					+ a.getId());
			rs2.next();
			int replys = rs2.getInt(1) - 1;
			DB.close(rs2);
			DB.close(stmt2);
			a.setRelpys(replys);

			articles.add(a);
		}

		DB.close(rs);
		DB.close(stmt);
		DB.close(conn);
		
		
		FenyeResult result=new FenyeResult();
		result.setArticles(articles);
		result.setPageNo(pageNo);
		result.setTotalPages(totalPages);
		return result;
	}
	
	private void delete(Connection conn, int id, boolean isLeaf) {
		// delete all the children
		// delete(conn, chids's id)
		
		if(!isLeaf) { 
			String sql = "select * from article where pid = " + id;
			Statement stmt = DB.createStmt(conn);
			ResultSet rs = DB.executeQuery(stmt, sql); 
			try {
				while(rs.next()) {
					delete(conn, rs.getInt("id"), rs.getInt("isleaf") == 0);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DB.close(rs);
				DB.close(stmt);
			}
		}
		
		
		// delete self
		DB.executeUpdate(conn, "delete from article where id = " + id);
	}
	
	public void delete(Article article,boolean isLeaf) throws SQLException{
		Connection conn = null;
		boolean autoCommit = true;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DB.getConn();
			autoCommit = conn.getAutoCommit();
			conn.setAutoCommit(false);
			
			delete(conn, article.getId(), isLeaf);
			
			stmt = DB.createStmt(conn);
			rs = DB.executeQuery(stmt, "select count(*) from article where pid = " + article.getPid());
			rs.next();
			int count = rs.getInt(1);
			
			if(count <= 0) {
				DB.executeUpdate(conn, "update article set isleaf = 0 where id = " + article.getPid());
			}
			
			conn.commit();
		} finally {
			conn.setAutoCommit(autoCommit);
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		
	}
		
	
	
	public void updateArticle(Article newArticle) {
		Connection conn = DB.getConn();
		String sql = "update article set title=?,cont=?,scan=?,isleaf=?,jinghua=?,zhiding=?,lastdate=? where id="
				+ newArticle.getId();
		PreparedStatement pstmt = DB.prepareStmt(conn, sql);
		try {
			pstmt.setString(1,newArticle.getTitle());
			pstmt.setString(2, newArticle.getContent());
			pstmt.setInt(3, newArticle.getScans());
			pstmt.setBoolean(4, newArticle.isLeaf());
			pstmt.setBoolean(5, newArticle.isJinghua());
			pstmt.setBoolean(6, newArticle.isZhiding());
			pstmt.setTimestamp(7, newArticle.getLastDate());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
}
