<%@ page contentType="text/html;charset=utf-8" language="java"%>

<html>

	<head>

		<title>Please choose picture to upload</title>

	</head>

	<body>

		<table border="0" align="center" cellpadding="0" cellspacing="0">

			<tr>

				<td height="45" align="center" valign="middle">
					<form action="UserImageUploadServlet" method="post"
						enctype="multipart/form-data" name="form1">
						
						<input type="hidden" name="action" value="post">
						
						<input type="file" name="file">

						<input type="submit" name="Submit" value="上传">

					</form>
				</td>

			</tr>

		</table>

	</body>

</html>