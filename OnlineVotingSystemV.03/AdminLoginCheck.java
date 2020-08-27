
import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/AdminLoginCheck")
public class AdminLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLoginCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String connUrl = "jdbc:mysql://localhost:3306/OVS";
		String user = "root";
		String pwd = "root@123";
		try {
			String admin = request.getParameter("admin");
			String apassword = request.getParameter("apassword");
			
			

			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection conn = DriverManager.getConnection(connUrl, user, pwd);
			PreparedStatement pst = conn.prepareStatement("select admin, apassword from admin where admin=? and apassword=?");
			pst.setString(1, admin);
			pst.setString(2, apassword);
			ResultSet rs = pst.executeQuery();
			if (rs.next())
				response.sendRedirect("AdminLoggedIn.jsp");
			else
				response.sendRedirect("error.jsp");
		} catch (Exception e) {
			System.out.println("Something went wrong !! Please try again");
			e.printStackTrace();
		}

	}

}
