<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>

<% 
String cname = request.getParameter("cname");
request.getParameterValues("cname");
String vname = request.getParameter("vname");
System.out.println(cname);
System.out.println(vname);
try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://Localhost:3306/OVS", "root","root@123");
			Statement st = conn.createStatement();
			int i = st.executeUpdate("insert into votes(vname, cname) values('"+vname+"','"+cname+"')");
			System.out.println("Voted Successfully!");
		}catch(Exception e) {
			
			System.out.println("CastVote.jsp");
			e.printStackTrace();
		}
	%>