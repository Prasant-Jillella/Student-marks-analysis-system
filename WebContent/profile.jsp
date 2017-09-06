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
			<form name="reg"   action="pedit.jsp"><br>
			        <pre>	    <label class="legend"></label></pre>
			        <% rs=st.executeQuery("select * from loginl");%>
			        <%	while(rs.next())
			           {
			        	if(rs.getString("username").equals(un))
			        		break;
			           }
			        %>
					<pre>       <label>Name	  : <%=rs.getString("username") %></label></pre>
					<pre>       <label>Password   : <%=rs.getString("password") %></label></pre>
					<pre>       <label>Mail Id 	  : <%=rs.getString("email")%></label></pre>
					<pre>       <label>Subjects   : <%=rs.getString("subject")%></label></pre>
				    <pre>		<a href="pedit.jsp"><button>Edit profile</button></a>	</pre>
			</form>
		</div>


</body>
</html>