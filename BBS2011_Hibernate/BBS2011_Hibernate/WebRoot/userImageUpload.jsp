<%@ page contentType="text/html;charset=utf-8" language="java"
	import="edu.stevens.bbs.pojo.*,edu.stevens.bbs.managementService.*,com.jspsmart.upload.*"%>
<%
	User user = (User) session.getAttribute("user");
	String username = user.getName();
	SmartUpload mySmartUpload = new SmartUpload();

	long file_size_max = 4000000;

	String ext = "";

	String url = "upload/userImage/"; //应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹）

	//初始化

	mySmartUpload.initialize(pageContext);

	//只允许上载此类文件

	try {

		mySmartUpload.setAllowedFilesList("jpg,gif");//此处的文件格式可以根据需要自己修改

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

		saveurl = application.getRealPath("/") + url;

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
%>


