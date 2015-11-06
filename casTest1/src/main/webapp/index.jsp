<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.jasig.cas.client.authentication.AttributePrincipal,java.util.*" %>
<%
	//通过这个类获取登录后的返回信息
	AttributePrincipal principal = (AttributePrincipal) request.getUserPrincipal();
	String username = "i am username";
	if (principal != null)
	{
		username = principal.getName();
		//获取查询返回的数据
		Map<String,Object> attributes = principal.getAttributes();
		String mobilephone = attributes .get("mobilephone") + "";
		String staffid = attributes .get("staffid") + "";
%>
<h1>登录成功，这是客户端1啊</h1>
<br />
用户名：<%=username%><br />
电话：<%=mobilephone%><br />
ID：<%=staffid%><br />
<a href="http://localhost:8082/casTest2/index.jsp">进入客户端2</a>
<br />

<a href="http://192.168.87.89:8082/casTest1/logout.jsp">退出</a>
<br />
   <%
   	}
	else
	{
		String strRedirecturl = request.getParameter("redirectUrl");
		if(strRedirecturl != null && strRedirecturl.length() > 0) {
			response.sendRedirect(strRedirecturl);
		}else{
			response.sendRedirect("http://localhost:8082/casTest1/login.jsp");
		}
		response.sendRedirect("http://localhost:8082/casTest1/login.jsp");
		return;
	}
   %>