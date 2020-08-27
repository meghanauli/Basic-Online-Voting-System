import java.io.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VoterLogin
 */

@WebServlet("/VoterLoginCheckServlet")
public class VoterLoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoterLoginCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String connUrl = "jdbc:mysql://localhost:3306/OVS";
		String user = "root";
		String pwd = "root@123";
		try {
			String vname = request.getParameter("vname");
			String vpassword = request.getParameter("vpassword");
			
			

			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection conn = DriverManager.getConnection(connUrl, user, pwd);
			System.out.println("PreparedStatement pst = conn.prepareStatement(\"select vname,vpassword from voters where vname=? and vpassword=?\");");
			PreparedStatement pst = conn.prepareStatement("select vname, vpassword from voters where vname=? and vpassword=?");
			System.out.println("pst.setString(1, vname);");
			pst.setString(1, vname);
			System.out.print(vname);
			System.out.println("pst.setString(2, vpassword)");
			pst.setString(2, vpassword);
			System.out.println("ResultSet rs = pst.executeQuery();");
			ResultSet rs = pst.executeQuery();
			
			if (rs.next()) {
				response.sendRedirect("VoterLoggedIn.jsp");
				request.setAttribute("vname", vname);
				RequestDispatcher dis = request.getRequestDispatcher("CastVote.jsp");
				dis.include(request, response);
			}
			else
				response.sendRedirect("error.jsp");
				return;
			
			
		} catch (Exception e) {
			System.out.println("VoterLoginCheckServlet");
			e.printStackTrace();
		}
		
		
		}

}
