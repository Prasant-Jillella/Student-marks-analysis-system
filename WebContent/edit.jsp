<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@ page import="java.io.* "%>
<%! int a=0; %>
 <% 
  String i = request.getParameter("id");
  String ex = request.getParameter("exam");
  String ma = request.getParameter("marks");
  try
  {
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con=DriverManager.getConnection("jdbc:oracle:thin:system/prasant@localhost:1521:xe");
	  Statement st= con.createStatement();
	  ResultSet rs = null;
	  request.getSession(true);
	  String ss=(String)session.getAttribute("subject");
	  if(!(i==""&&ex==""&&ma==""))
	  {
		  out.println(i);
		 st.executeQuery("update "+ex+" set marks='"+ma+"' where id='"+i+"' AND subject='"+ss+"'");
		 out.println(i);
		 response.sendRedirect("edited.html");
	  }
	  else
		 response.sendRedirect("no.html");
 }
    catch(SQLException se){se.printStackTrace();}
	catch(Exception e1){e1.printStackTrace();}
  %>
</body>
</html>