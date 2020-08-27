<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String connUrl = "jdbc:mysql://localhost:3306/OVS";
	String user = "root";
	String pwd = "root@123";
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		
		e.printStackTrace();
	}
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="UTF-8">
<title>Delete Candidate</title>
</head>
<body>
	<div class="header">
		<h1>Online Voting System</h1>
		<p>
			A <b>responsive </b>website created by me.
		</p>
	</div>

	<div class="navbar">
		<a href="http://localhost:8081/OnlineVotingSystemV.03/Website.jsp">Home</a>
		<a href="http://localhost:8081/OnlineVotingSystemV.03/AdminLogin.jsp">Admin</a>
		<a href="http://localhost:8081/OnlineVotingSystemV.03/VoterLogin.jsp"
			class="active">Voter login</a> <a
			href="http://localhost:8081/OnlineVotingSystemV.03/Registration"
			class="right">Register</a>


	</div>
	<div>
		<h1>Retrive data from database</h1>
		<div>
			<table border="1">
				<tr>
					<td>First Name</td>
					<td>Last Name</td>
					<td>Candidate Name</td>
					<td>Email</td>
					<td>City</td>
				</tr>
				<%
try{
	conn = DriverManager.getConnection(connUrl, user, pwd);		
	st = conn.createStatement();
	String sql = "select * from candidate";
	rs = st.executeQuery(sql);
	int i = 0;
	while(rs.next()){
%>
				<tr>
					<td><%=rs.getString("fcname")%></td>
					<td><%= rs.getString("lcname") %></td>
					<td><%= rs.getString("cname") %></td>
					<td><%=rs.getString("cemail")%></td>
					<td><%=rs.getString("city")%></td>
					<td><a
						href="DeleteCandidateServlet.jsp?cid=<%=rs.getString("cid") %>">
							<button type="delete" class="delete">Delete</button>
					</a></td>
				</tr>
				<%
	i++;
	}
	conn.close();
}catch(Exception e){
	e.printStackTrace();
}
%>

				</div>
			</table>
		</div>
</body>
</html>