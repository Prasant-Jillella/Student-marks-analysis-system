<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="images/brown.png">
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@ page import="java.io.* "%>

<%
	String p= request.getParameter("password");
	String em= request.getParameter("email");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:system/prasant@localhost:1521:xe");
	Statement st= con.createStatement();
	request.getSession(true);
	String un=(String)session.getAttribute("username");
	out.println(p);
	try
	{
		if(p!=""||em!="")
		{
			if(p!="")
				st.executeQuery("update loginl set password='"+p+"' where username='"+un+"'");
			if(em!="")
				st.executeQuery("update loginl set email='"+em+"' where username='"+un+"'");
			response.sendRedirect("edited1.html");
		}
		else
			response.sendRedirect("blank.html");
	}
	//catch(ClassNotFoundException ce){ce.printStackTrace();}
	catch(SQLException se){se.printStackTrace();}
	catch(Exception e1){e1.printStackTrace();}
%>
</body>
</html>