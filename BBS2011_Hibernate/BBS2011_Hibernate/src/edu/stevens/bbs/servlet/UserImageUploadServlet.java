package edu.stevens.bbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;

import edu.stevens.bbs.managementService.UserManagement;
import edu.stevens.bbs.pojo.User;

public class UserImageUploadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserImageUploadServlet() {
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		User user = (User) request.getSession().getAttribute("user");
		String username = user.getName();
		SmartUpload mySmartUpload = new SmartUpload();

		long file_size_max = 4000000;

		String ext = "";

		String url = "upload/userImage/"; //应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹）

		//初始化

		mySmartUpload.initialize(this.getServletConfig(),request,response);

		//只允许上载此类文件

		try {

			mySmartUpload.setAllowedFilesList("jpg,gif,JPG");//此处的文件格式可以根据需要自己修改

			//上载文件

			mySmartUpload.upload();

		} catch (Exception e) {
			out.println("Please choose jpg and gif file to upload!");
			out.println("<a href='userImage.jsp'>return</a>");
			return;
		}

		try {

			com.jspsmart.upload.File myFile = mySmartUpload.getFiles()
			.getFile(0);

			if (myFile.isMissing()) {
				out.println("Please choose one file you want to upload!");
				out.println("<a href='userImage.jsp'>return</a>");
				return;
			}

			else {

				ext = myFile.getFileExt(); //取得后缀名

				int file_size = myFile.getSize(); //取得文件的大小

				String saveurl = "";

				if (file_size < file_size_max) {

			saveurl = request.getSession().getServletContext().getRealPath("/") + url;

			saveurl += username + "." + ext; //保存路径

			myFile.saveAs(saveurl, SmartUpload.SAVE_PHYSICAL);

				}

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		UserManagement um = new UserManagement();
		user.setHasUserImg(true);
		um.update(user);

		response.sendRedirect("index.jsp");
		
		
		
		
		
		
		out.flush();
		out.close();
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

		doGet(request, response);
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
