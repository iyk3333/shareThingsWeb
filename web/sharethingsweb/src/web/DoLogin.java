package web;

import java.io.IOException;
 

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/doLogin")
public class DoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	      response.setCharacterEncoding("UTF-8");
		
		String mid = request.getParameter("mid");
		String passwd = request.getParameter("passwd");
		
		HttpSession session = request.getSession(false);
		if(session==null)
			session = request.getSession();
		
		
		//Date now = new Date();
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));
		String month = String.valueOf(cal.get(Calendar.MONTH)+1);
		String day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
		String hour = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
		String min = String.valueOf(cal.get(Calendar.MINUTE));
		String sec = String.valueOf(cal.get(Calendar.SECOND));
		String now = year+"/"+month+"/"+day+"/"+hour+"/"+min+"/"+sec;
		
		
		PrintWriter out = response.getWriter();
	
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		ResultSet rs = DBUtil.findUser(conn, mid);
		

		if(rs != null) {
			try {
				if(rs.next()) { // existing user
					String checkpw = rs.getString("passwd");
					
					if(checkpw.equals(passwd)) {
						// valid user and passwd
						int custid = Integer.parseInt(rs.getString("customerNo"));
						String s = rs.getString("customerNo");
						String s2 = rs.getString("name");
						session.setAttribute("customerNo", s);
						session.setAttribute("customerName", s2);
						DBUtil.storeTime(conn, custid, now);
										
						
						out.println("alert('Login Success!!')");
						response.sendRedirect("mainPageAfterLogin.jsp"); //main page
						
						
					} else {
						// wrong passwd
						out.println("Wrong Passwd!!");
						response.sendRedirect("login.html");
					}
				}
				else { // invalid user
					out.println("Invalid User Name!!");
					response.sendRedirect("login.html");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} //try end
		} // if end
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
