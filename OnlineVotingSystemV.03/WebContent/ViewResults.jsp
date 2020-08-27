<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="java.sql.*"%>
<head>
<link rel="stylesheet" href="styles.css">
</head>
<body>

	<br>
	<br>
	<form method="post" name="form">

		<table id="tables" border="1">

			<tr>
				<th>Candidate's name</th>
				<th>Votes</th>
			</tr>
			<%
				Connection con = null;
				String url = "jdbc:mysql://localhost:3306/";
				String db = "OVS";
				String driver = "com.mysql.jdbc.Driver";
				String userName = "root";
				String password = "root@123";

				int sumcount = 0;
				Statement st;
				try {
					Class.forName(driver).newInstance();
					con = DriverManager.getConnection(url + db, userName, password);
					String query = "SELECT cname,COUNT(*) FROM votes where cname is not null GROUP BY cname ";
					st = con.createStatement();
					ResultSet rs = st.executeQuery(query);
			%>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>

			</tr>
			<%
				}
			%>
			<%
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</table>

	</form>
</body>
</html>