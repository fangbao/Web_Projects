package edu.stevens.bbs.managementService;


import java.util.List;
import edu.stevens.bbs.dao.CategoryDAO;
import edu.stevens.bbs.pojo.Banzhu;
import edu.stevens.bbs.pojo.Category;

public class CategoryManagement {
	private CategoryDAO categoryDAO=new CategoryDAO();
	
	
	public void addCategory(Category category){
		categoryDAO.save(category);
	}
	
	public void deleteCategory(Category category){
		categoryDAO.delete(category);
	}
	
	public List<Category> getCategories() {
		return categoryDAO.getCategories();
	}
	
	public Category getCategory(int id){
		return categoryDAO.getCategory(id); 
	}
	
	public void updateCategory(Category newCategory) {
		categoryDAO.update(newCategory);
	}
	
	public List<Category> getCategories(Banzhu banzhu){
		return categoryDAO.getCategories(banzhu);
	}
	
	public int getScanCount(int categoryid){
		return categoryDAO.getScanCount(categoryid);
	}
	
	public int getArticleCount(int categoryid){
		return categoryDAO.getArticles(categoryid).size();
	}
	
	public int getRootArticleCount(int categoryid){
		return categoryDAO.getRootArticles(categoryid).size();
	}
}
