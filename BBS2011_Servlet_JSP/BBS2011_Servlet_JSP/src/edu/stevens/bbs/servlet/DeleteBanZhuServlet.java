package edu.stevens.bbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.stevens.bbs.managementService.BanzhuManagement;
import edu.stevens.bbs.managementService.CategoryManagement;
import edu.stevens.bbs.managementService.UserManagement;

public class DeleteBanZhuServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteBanZhuServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int categoryid=Integer.parseInt(request.getParameter("categoryid"));
		String banzhuname=request.getParameter("banzhuname");
		
		BanzhuManagement bm=new BanzhuManagement();
		UserManagement um=new UserManagement();
		CategoryManagement cm=new CategoryManagement();
		
		bm.deleteBanzhu(bm.getBanzhu(um.getUser(banzhuname).getId()), cm.getCategory(categoryid));
		response.sendRedirect("admin.jsp");
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
