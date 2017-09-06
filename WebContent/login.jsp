<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 <%@ page import="java.sql.*" %>
	 <%@ page import="javax.sql.*" %>
	 <%@ page import="javax.servlet.*" %>
	 <%@ page import="java.io.*" %>
	 <%! int a= 1; %>
	 <%
	 	String s;
	    String u = request.getParameter("username");
		String p = request.getParameter("password");
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:system/prasant@localhost:1521:XE");
		Statement st=con.createStatement();
		ResultSet rs = null;
		if(!(u == null || p == null))
		{
			 rs=st.executeQuery("select * from loginl");
			 out.println(u);
			 while(rs.next())
			  {
				  if(rs.getString("username").equals(u) && rs.getString("password").equals(p))
					{
					   s=rs.getString("subject");
					   request.getSession(true);
					   session.setAttribute("subject",s);
					   session.setAttribute("username",u);
					   response.sendRedirect("inlogin.html");
					   break;
					}
			  }
			 	response.sendRedirect("nologin.html");
		}
		else
			response.sendRedirect("nologin.html");
		}
		catch(ClassNotFoundException ce){ce.printStackTrace();}
		catch(SQLException se){se.printStackTrace();}
		catch(Exception e1){e1.printStackTrace();}
	 %>
</body>
</html>