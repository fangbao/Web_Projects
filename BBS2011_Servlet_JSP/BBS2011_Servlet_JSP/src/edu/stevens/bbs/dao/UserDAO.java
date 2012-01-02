package edu.stevens.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.stevens.bbs.pojo.User;

public class UserDAO {

	public void save(User user) {
		Connection conn = DB.getConn();
		String sql = "insert into user values(null,?,?,?,?,?,?,?,?,?,now(),0,false,false)";
		PreparedStatement pstmt = DB.prepareStmt(conn, sql);
		try {
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getJob());
			pstmt.setString(6, user.getWebsite());
			pstmt.setString(7, user.getDescription());
			pstmt.setString(8, user.getSignature());
			pstmt.setBoolean(9, user.isAutoLogin());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}

	}

	public void delete(User user) {
		Connection conn = DB.getConn();
		String sql = "delete from user where id=" + user.getId();

		DB.executeUpdate(conn, sql);

		DB.close(conn);
	}

	public List<User> getUsers() {
		List<User> list = new ArrayList<User>();

		Connection conn = DB.getConn();
		String sql = "select * from user";
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			while (rs.next()) {
				User user = new User();
				DAOutil.initialUser(rs, user);
				list.add(user);
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

	public static User getUser(int id) {
		User user = null;
		Connection conn = DB.getConn();
		String sql = "select * from user where id=" + id;
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			if (rs.next()) {
				user = new User();
				DAOutil.initialUser(rs, user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return user;
	}

	public static User getUser(String username) {
		User user = null;
		Connection conn = DB.getConn();
		String sql = "select * from user where name='" + username + "'";
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			if (rs.next()) {
				user = new User();
				DAOutil.initialUser(rs, user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return user;
	}

	public boolean isUserNameExist(String name) {
		Connection conn = DB.getConn();
		String sql = "select count(*) from user where name='" + name + "'";
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		int result = -1;
		try {
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}

		if (0 == result)
			return false;
		return true;
	}

	public boolean isPwdCorrect(String name, String password) {
		Connection conn = DB.getConn();
		String sql = "select password from user where name='" + name + "'";
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		String pwd = "";
		try {
			rs.next();
			pwd = rs.getString("password");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}

		if (pwd.equals(password))
			return true;
		return false;

	}

	public void updateUser(User newUser) {
		Connection conn = DB.getConn();
		String sql = "update user set email=?,password=?,address=?,job=?,website=?,description=?,signature=?,autoLogin=? where id="
				+ newUser.getId();
		PreparedStatement pstmt = DB.prepareStmt(conn, sql);
		try {
			pstmt.setString(1, newUser.getEmail());
			pstmt.setString(2, newUser.getPassword());
			pstmt.setString(3, newUser.getAddress());
			pstmt.setString(4, newUser.getJob());
			pstmt.setString(5, newUser.getWebsite());
			pstmt.setString(6, newUser.getDescription());
			pstmt.setString(7, newUser.getSignature());
			pstmt.setBoolean(8, newUser.isAutoLogin());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	public int getTotalUsersCount(){
		Connection conn = DB.getConn();
		String sql = "select count(*) from user";
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		int count=0;
		try {
			if (rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		
		return count;
	}
	
	public User getLastUser(){
		User user=null;
		Connection conn = DB.getConn();
		String sql = "select * from user order by rdate desc limit 1";
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			if (rs.next()) {
				user = new User();
				DAOutil.initialUser(rs, user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		
		return user;
	}

}
