<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//session.removeAttribute("user_login_data");
		session.invalidate();
		response.sendRedirect("http://192.168.87.89:8080/cas/logout?service=http://192.168.87.89:8082/casTest1/login.jsp&method=POST");
	%>
</body>
</html>