

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCandidateServlet
 */
@WebServlet("/AddCandidateServlet")
public class AddCandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCandidateServlet() {
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
			String fcname = request.getParameter("fcname");
			String lcname = request.getParameter("lcname");
			String city = request.getParameter("city");
			String cemail = request.getParameter("cemail");
			String cname = request.getParameter("cname");
			int count = 0;
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(connUrl, user, pwd);
			
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from candidate where cname='"+cname+"'");
			while(rs.next()) {
				count++;
			}
			if(count>0) { 
				
				System.out.println("<font color = red >Error : ID already exists</font>");
				
			}else {
				
			int i = st.executeUpdate("insert into candidate(cemail, lcname, fcname, cname, city) values('"+cemail+"','"+lcname+"','"+fcname+"','"+cname+"','"+city+"')");
		
			System.out.println("<font color = green>Data is successfully inserted!</font>");
			//using the getGenerateKeys() method to retrieve the key(s). In this case there is only one key column
			}
			/*ResultSet keyResultSet = st.getGeneratedKeys();
			int newcid = 0;
			if(keyResultSet.next()) {
				
				newcid = (int) keyResultSet.getInt(1);
				cid = String.valueOf(newcid);
				
			}*/
			
			
			System.out.println("You have successfully registered");
			st.close();
			st = null;
			conn.close();
			conn = null;
			
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
	}

}
}
	
