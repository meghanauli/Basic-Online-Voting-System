<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>

<% 
String cid = request.getParameter("cid");
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://Localhost:3306/OVS", "root","root@123");
			Statement st = conn.createStatement();
			int i = st.executeUpdate("delete from candidate where cid ="+ cid);
			System.out.println("Data Deleted Successfully!");
		}catch(Exception e) {
			
			System.out.print(e);
			e.printStackTrace();
		}
	%>