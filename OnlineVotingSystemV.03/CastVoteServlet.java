
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 Servlet implementation class CastVote
 */
@WebServlet("/CastVoteServlet")
public class CastVoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CastVoteServlet() {
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
	
		
		try{String connUrl = "jdbc:mysql://localhost:3306/OVS";
		String user = "root";
		String pwd = "root@123";
		System.out.println("String connUrl = \"jdbc:mysql://localhost:3306/OVS\"");
		String cid = request.getParameter("cid");
		String vname = request.getParameter("vname");
		String cname = request.getParameter("cname");
		System.out.print(vname);
		System.out.print(cname);
		
		System.out.println("String cname = request.getParameter(\"cname\");");
		String sql = "insert into votes(vname, cname) values('"+vname+"','"+cname+"');";
		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		System.out.println("Class.forName(\"com.mysql.jdbc.Driver\"); // MySQL database connection\n" + 
				"");

		Connection conn = DriverManager.getConnection(connUrl, user, pwd);
		System.out.println("Connection conn = DriverManager.getConnection(connUrl, user, pwd);\n" + "");
		PreparedStatement pst = conn.prepareStatement(sql);
		System.out.println("PreparedStatement pst = conn.prepareStatement(sql);");
		pst.executeUpdate();
		System.out.println("pst.executeUpdate();");
		 
			response.sendRedirect("VThankyou.jsp");
		System.out.println("response.sendRedirect(\"VThankyou.jsp\");");

//			response.sendRedirect("Verror.jsp");
	} catch (Exception e) {
		System.out.println("Something went wrong !! Please try again");
		e.printStackTrace();
	}

		
		}
	}


