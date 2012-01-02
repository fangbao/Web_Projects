package edu.stevens.bbs.managementService;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import edu.stevens.bbs.dao.Ban_Cat_DAO;
import edu.stevens.bbs.dao.CategoryDAO;
import edu.stevens.bbs.pojo.Banzhu;
import edu.stevens.bbs.pojo.Category;

public class CategoryManagement {
	private CategoryDAO cd=new CategoryDAO();
	Ban_Cat_DAO bcd = new Ban_Cat_DAO();
	
	public void addCategory(Category category){
		cd.save(category);
	}
	
	public void deleteCategory(Category category){
		try {
			cd.delete(category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Category> getCategories() {
		return cd.getCategories();
	}
	
	public Category getCategory(int id){
		return cd.getCategory(id); 
	}
	
	public void updateCategory(Category newCategory) {
		cd.update(newCategory);
	}
	
	public Set<Category> getCategories(Banzhu banzhu){
		return bcd.getCategories(banzhu);
	}
	
	public int getScans(int categoryid){
		try {
			return cd.getScans(categoryid);
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int getArticles(int categoryid){
		try {
			return cd.getArticles(categoryid);
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int getRootArticles(int categoryid){
		try {
			return cd.getRootArticles(categoryid);
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
}
