<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="brown.png">	
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@ page import="java.io.* "%>
<%! int a=0; %>
<%! String j; %>
<%! String h; %>
<%! int b=0; %>
<%! int i1=1; %>
<%! int i2=1; %>
<% 
  String i = request.getParameter("id");
  String ex = request.getParameter("exam");
  String ma = request.getParameter("marks");
  out.println(i);
  try
  {
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con=DriverManager.getConnection("jdbc:oracle:thin:system/prasant@localhost:1521:xe");
	  Statement st= con.createStatement();
	  ResultSet rs = null;
	  String g=null;
	  request.getSession(true);
	  String ss=(String)session.getAttribute("subject");
	  rs=st.executeQuery("select * from "+ex);
	  while(rs.next())
	  { 
		 if(rs.getString("id").equals(i))
		 {
			  i1=0;
		      if(rs.getString("subject").equals(ss))
			  {
		    		i2=0;
		    	   	if(rs.getString("marks")==null)
		    	   	{
		    		   	h=rs.getString("id");
		    		   	j=rs.getString("subject");
		    		   	a=1;
		    		   	break;
		    	   	}
			  }
		 }
	  }
	  if(i1==1)
		  response.sendRedirect("noid.html");
	  if(i2==1)
		  response.sendRedirect("nosubject.html");
	  if(a==1)
	  {
		  st.executeQuery("update "+ex+" set marks='"+ma+"' where id='"+h+"' AND subject='"+j+"'");
		  response.sendRedirect("entered.html");
	  }
	  else
	  {
	  //st.executeQuery("insert into "+e+" values('"+n+"','"+i+"','"+s+"','"+m+"')");
	  response.sendRedirect("present.html");
	  }
  }
  //catch/(ClassNotFoundException ce){ce.printStackTrace();}
	catch(SQLException se){se.printStackTrace();}
	catch(Exception e1){e1.printStackTrace();}
		%>
</body>
</html>