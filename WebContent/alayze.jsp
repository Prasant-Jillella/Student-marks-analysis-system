<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="Mystyle.css">
	<title>Analyze</title>
</head>
<body background="images/brown.png" class="graphs">
<div class="graphs">
	<%@ page import = "java.sql.*" %>
	<%@ page import = "javax.sql.*" %>
	<%@ page import="ChartDirector.*" %>
	<%! String subject, name; %>
	<%! int x, p,co=0; %>
	<%! double mid1; %>
	<%! double mid2; %>
	<%! double mid3; %>
	<%! double sem; %>
	<%! double data[] = new double[4]; %>
	
	<%
	String i = request.getParameter("id");
	String ss = request.getParameter("subject");
	Connection conn = null;
	Statement stmt = null;
	ResultSet c1 = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	try
	{
		x = 0;
		request.getSession(true);
		subject = (String)session.getAttribute("Subject");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:system/prasant@localhost:1521:xe");
		stmt = conn.createStatement();
		c1=stmt.executeQuery("select * from mid1");
		while(c1.next())
		{
			if(c1.getString("id").equals(i))
			{
				co=1;
				break;
			}
		}
		if(co==1)
		{
		rs= stmt.executeQuery("select marks from mid1 where id='"+i+"' AND subject='"+ss+"'");
		if(rs.next());
		mid1= rs.getDouble("marks");
		rs1= stmt.executeQuery("select marks from mid2 where id='"+i+"' AND subject='"+ss+"'");
		if(rs1.next());
		mid2= rs1.getDouble("marks");
		rs2= stmt.executeQuery("select marks from mid3 where id='"+i+"' AND subject='"+ss+"'");
		if(rs2.next());
		mid3= rs2.getDouble("marks");
		rs3= stmt.executeQuery("select marks from sem where id='"+i+"' AND subject='"+ss+"'");
		if(rs3.next());
		sem= rs3.getDouble("marks");
			data[0] = mid1;	// The data for the bar chart
			data[1] = mid2;
			data[2] = mid3;
			data[3] = sem;
		String[] labels = {"Mid-1", "Mid-2", "Mid-3", "Sem"};	// The labels for the bar chart
		
		XYChart c = new XYChart(250, 250);	// Create a XYChart object of size 250 x 250 pixels
		
		c.setPlotArea(30, 20, 200, 200);	// Set the plotarea at (30, 20) and of size 200 x 200 pixels
		
			//c.addTitle("Analysis of " + name);
		c.yAxis().setLinearScale(0, 100, 10);
		
		c.addBarLayer(data);	// Add a bar chart layer using the given data
		
		c.xAxis().setLabels(labels);	// Set the labels on the x axis.
		
		String chart1URL = c.makeSession(request, "chart1");	// Output the chart
		
		String imageMap1 = c.getHTMLImageMap("", "", "title='{xLabel}: {value} GBytes'");	// Include tool tip for the chart
	%>
	<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>' usemap="#map1" border="0">
	<map name="map1"><%=imageMap1%></map>
	<pre><label class="legendg"><a href="inlogin.html">Make analysis again</a>   <a href="edit.html">Edit student marks</a><br>  <a href="index.html">logout</a></label></pre>	
	<%
		}
		else 
		 response.sendRedirect("anid.html");
	}
	catch(ClassNotFoundException ce){ce.printStackTrace();}
	catch(SQLException se){se.printStackTrace();}
	catch(Exception e){e.printStackTrace();}
	finally
	{
		try
		{
			stmt.close();
			rs.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		catch(Exception e){e.printStackTrace();}
	}
	
	%>
	</div>
</body>
</html>