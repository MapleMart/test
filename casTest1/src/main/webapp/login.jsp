<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.jasig.cas.client.authentication.AttributePrincipal" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>远程CAS客户端登陆页面</title>
    <script type="text/javascript">
    function getParam(name) {
        var queryString = window.location.search;
        var param = queryString.substr(1, query.length - 1).split("&");
        for (var i = 0; i < param.length; i++) {
            var keyValue = param[i].split("=");
            if (keyValue[0] == name) return keyValue[1];
        }
        return null;
    }
    function init() {
        // 显示异常信息
        var error = getParam("errorMessage");
        if (error) {
            document.getElementById("errorMessage").innerHTML = decodeURIComponent(error);
        }
        // 注入service
        var service = getParam("service");
        if (service)
            document.getElementById("service").value = decodeURIComponent(service);
        else
            document.getElementById("service").value = location.href;
    }
    </script>
</head>
<body>
    <h1>远程CAS客户端1登陆页面</h1>
    <% 
    	String loginTicket = request.getParameter("loginTicket");
    	String flowExecutionKey = request.getParameter("flowExecutionKey");
    	//通过这个类获取登录后的返回信息
    	AttributePrincipal principal = (AttributePrincipal) request.getUserPrincipal();
    	String username = "i am username";
    	if (principal == null)
    	{
    %>
        <div id="errorMessage"></div>
        <form id="myLoginForm" action="http://192.168.87.89:8080/cas/login" method="post">
        	<!--  
            -->
            <input type="hidden" id="service" name="service" value="">
            <input type="hidden" name="submit" value="true" />
            <input type="hidden" name="redirectUrl" value="http://192.168.87.89:8082/masgetweb/login.jsp">
            
            loginTicket=<%=loginTicket %></br>
            flowExecutionKey=<%=flowExecutionKey %></br>
            loginTicket=${loginTicket}</br>
            flowExecutionKey=${flowExecutionKey}</br>
            <input type="hidden" name="lt" value="<%=loginTicket %>" />
      		<input type="hidden" name="execution" value="<%=flowExecutionKey %>" />
            <!--  
      		<input type="hidden" name="lt" value="${loginTicket}" />
      		<input type="hidden" name="execution" value="${flowExecutionKey}" />
      		-->
      		<input type="hidden" name="_eventId" value="submit" />
            <table>
                <tr>
                    <td>用户名:</td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td>密&nbsp;&nbsp;码:</td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="登陆" /></td>
                </tr>
            </table>
        </form>
        <!--  
        -->
        <script type="text/javascript">init()</script>
    <% } else { 
    	username = principal.getName();
    %>
        <div class="welcome">您好：<%=username%></div>
        <div id="logout">
        	<!--  
            <a href="http://localhost:8080/cas/remoteLogout?service=http://localhost:8082/casTest1/login.jsp">单点登出</a>
            -->
			<a href="http://192.168.87.89:8082/casTest1/logout.jsp" >单点登出</a>
        </div>
    <% } %>
</body>
</html>