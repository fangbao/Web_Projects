package edu.stevens.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import edu.stevens.bbs.pojo.Article;
import edu.stevens.bbs.pojo.Banzhu;
import edu.stevens.bbs.pojo.Category;
import edu.stevens.bbs.pojo.User;

public class DAOutil {
	public static void initialUser(ResultSet rs,User user) throws SQLException{
		user.setId(rs.getInt("id"));
		user.setName(rs.getString("name"));
		user.setEmail(rs.getString("email"));
		user.setPassword(rs.getString("password"));
		user.setAddress(rs.getString("address"));
		user.setJob(rs.getString("job"));
		user.setWebsite(rs.getString("website"));
		user.setDescription(rs.getString("description"));
		user.setSignature(rs.getString("signature"));
		user.setAutoLogin(rs.getBoolean("autoLogin"));
		user.setDatetime(rs.getTimestamp("rdate"));
		user.setTotalPost(rs.getInt("totalPost"));
		user.setHasUserImg(rs.getBoolean("hasUserImg"));
		user.setHasSignatureImg(rs.getBoolean("hasSignatureImg"));
	}
	
	public static void initialBanzhu(ResultSet rs, Banzhu banzhu) throws SQLException{
		banzhu.setUser(UserDAO.getUser(rs.getInt("id")));
		banzhu.setLevel(rs.getInt("level"));
		
		Set<Category> categories=Ban_Cat_DAO.getCategories(banzhu);
		banzhu.setCategories(categories);
	}
	
	public static void initialCategory(ResultSet rs,Category category) throws SQLException{
		category.setId(rs.getInt("id"));
		category.setName(rs.getString("name"));
		category.setDescription(rs.getString("description"));
	}
	
	public static void initFromRs(Article article,ResultSet rs){
		try {
			article.setId(rs.getInt("id"));
			article.setPid(rs.getInt("pid"));
			article.setRootid(rs.getInt("rootid"));
			article.setTitle(rs.getString("title"));
			article.setContent(rs.getString("cont"));
			article.setPdate(rs.getTimestamp("pdate"));
			article.setScans(rs.getInt("scan"));
			article.setLeaf(rs.getInt("isleaf") == 0 ? true : false);
			
			article.setUser(UserDAO.getUser(rs.getString("author")));
			article.setJinghua(rs.getBoolean("jinghua"));
			article.setZhiding(rs.getBoolean("zhiding"));
			article.setCategory(CategoryDAO.getCategory(rs.getInt("cid")));
			article.setLastDate(rs.getTimestamp("lastdate"));
			article.setGrade(0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
