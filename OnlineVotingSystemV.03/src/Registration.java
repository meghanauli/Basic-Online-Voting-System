
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
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
			String vid = null;
			String vname = request.getParameter("vname");
			String vpassword = request.getParameter("vpassword");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String sql = "insert into voters(vid, vname, fname, lname, vpassword) values(null, ?, ?, ?, ?)";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(connUrl, user, pwd);
			PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setString(1, vname);
			ps.setString(2, fname);
			ps.setString(3, lname);
			ps.setString(4, vpassword);
			ps.executeUpdate();
			//using the getGenerateKeys() method to retrieve the key(s). In this case there is only one key column
			
			ResultSet keyResultSet = ps.getGeneratedKeys();
			int newvid = 0;
			if(keyResultSet.next()) {
				
				newvid = (int) keyResultSet.getInt(1);
				vid = String.valueOf(newvid);
				
			}
			
			
			System.out.println("You have successfully registered");
			ps.close();
			ps = null;
			conn.close();
			conn = null;
			
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

}
