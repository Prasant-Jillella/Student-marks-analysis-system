<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Mystyle.css">
</head>
<body background="images/brown.png">	
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@ page import="java.io.* "%>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:system/prasant@localhost:1521:xe");
	Statement st= con.createStatement();
	ResultSet rs = null;
	String g=null;
	request.getSession(true);
	String un=(String)session.getAttribute("username");	
	rs=st.executeQuery("select seats from courses where cname= 'Datamining'"); 
	if(rs.next())
%>
<div class="ihdiv1"><br>
			<img class="img2" src="images/professor1.png" width="10%">
           <pre>		            <label class="ilabel">Student Analysis Center</label>            	Welcome  <%=un%> <br></pre>
           <pre><label class="profileb"><a href="index.html"><button>Logout</button></a></label>     <a href="inlogin.html"><button>home</button></a></pre>
			<br>
</div>
<div class="profile">
<form action="pedited.jsp"><br><br>
			        <pre>	 	Edit Fields </pre>
			        
					<pre>       <label>Password   :</label><input type="text" name="password" height="4px" size="15px"></pre>
					<pre>       <label>Mail Id 	  :</label><input type="text" name="email" height="4px" size="15px"></pre>
				        <pre>			<input type="submit" value="edit"></pre>
</form>	
</div>


</body>
</html>