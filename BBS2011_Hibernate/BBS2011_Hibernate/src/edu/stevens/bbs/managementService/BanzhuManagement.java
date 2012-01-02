package edu.stevens.bbs.managementService;

import edu.stevens.bbs.dao.BanzhuDAO;
import edu.stevens.bbs.dao.CategoryDAO;
import edu.stevens.bbs.pojo.Banzhu;
import edu.stevens.bbs.pojo.Category;
import edu.stevens.bbs.pojo.User;

public class BanzhuManagement {

	BanzhuDAO banzhuDAO = new BanzhuDAO();
	CategoryDAO categoryDAO=new CategoryDAO();

	public void addBanzhu(User user, Category category,int level) {
		Banzhu banzhu=new Banzhu();
		banzhu.setUser(user);
		banzhu.setLevel(level);
		banzhu.setCategory(category);
		banzhuDAO.save(banzhu);
	}
	
	public void deleteBanzhu(Banzhu banzhu, Category category){
		banzhuDAO.delete(banzhu);
	}

	
	public Banzhu getBanzhu(int id){
		return  banzhuDAO.getBanzhu(id);
	}
	
	public Banzhu getBanzhuThoughUid(int uid){
		return banzhuDAO.getBanzhuThoughUid(uid);
	}
}
