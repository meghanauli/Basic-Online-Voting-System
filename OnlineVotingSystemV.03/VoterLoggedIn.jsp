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
<title>Welcome!</title>
</head>
<body>
	<div class="header">
		<h1>Online Voting System</h1>
		<p>
			A <b>responsive </b>website created by me.
		</p>
	</div>
	<div class="container">
		<div class="navbar">
			<a href="http://localhost:8081/OnlineVotingSystemV.03/Website.jsp">Home</a>
			<a href="http://localhost:8081/OnlineVotingSystemV.03/AdminLogin.jsp">Admin</a>

			<a href="http://localhost:8081/OnlineVotingSystemV.03/VoterLogin.jsp"
				class="active">Voter login</a>

		</div>
		<FORM method="post" action="CastVote.jsp">
			<select name="cname" id="dropdown">
				<%
try{
	String vname = request.getParameter("vname");
	//String cname;
	System.out.println(vname);
	conn = DriverManager.getConnection(connUrl, user, pwd);
	st = conn.createStatement();
	//String sql = "select * from candidate";
	rs = st.executeQuery("select * from candidate;");
	int i = 0;
	while(rs.next()){

%>

				<Option><%=rs.getString("cname")%></Option>
				<%
}
i++;
%>
			</select> <input type="submit" value="Vote">

		</form>
		<%
	//request.setAttribute("cname",cname);
	request.setAttribute("vname", vname);
	RequestDispatcher dis = request.getRequestDispatcher("CastVote.jsp");
	dis.include(request, response);	
conn.close();
}catch(Exception e){
	System.out.println("VoterLoggedIn");
	e.printStackTrace();
}
%>

	</div>

	</div>
	<div class="footer">
		<h3>Copyright © 2019 - 2020. Online Voting System. All rights
			reserved.</h3>
	</div>
</body>
</html>