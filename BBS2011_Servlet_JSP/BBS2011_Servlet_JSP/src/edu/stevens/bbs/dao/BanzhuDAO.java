package edu.stevens.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.stevens.bbs.pojo.Banzhu;

public class BanzhuDAO {
	
	public void save(Banzhu banzhu,Connection conn) {
		String sql = "insert into banzhu values(?,?)";
		PreparedStatement pstmt = DB.prepareStmt(conn, sql);
		try {
			pstmt.setInt(1, banzhu.getUser().getId());
			pstmt.setInt(2, banzhu.getLevel());	
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
		}
	}
	
	public void delete(Banzhu banzhu,Connection conn) {
		String sql = "delete from banzhu where id=" + banzhu.getUser().getId();
		DB.executeUpdate(conn, sql);
	}
	
	public List<Banzhu> getBanzhus() {
		List<Banzhu> list = new ArrayList<Banzhu>();

		Connection conn = DB.getConn();
		String sql = "select * from banzhu";
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			while (rs.next()) {
				Banzhu banzhu=new Banzhu();
				DAOutil.initialBanzhu(rs, banzhu);
				list.add(banzhu);
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
	
	public static Banzhu getBanzhu(int id) {
		Banzhu banzhu = null;
		Connection conn = DB.getConn();
		String sql = "select * from banzhu where id=" + id;
		Statement stmt = DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			if (rs.next()) {
				banzhu = new Banzhu();
				DAOutil.initialBanzhu(rs, banzhu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return banzhu;
	}
}
