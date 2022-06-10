package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

/**
 * Servlet implementation class FindPW
 */
@WebServlet("/findPW")
public class FindPW extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPW() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mid = request.getParameter("mid");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		HttpSession session = request.getSession(false);
		if(session==null) session = request.getSession();
		
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		ResultSet rs = DBUtil.findIDPW(conn, email);
		
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
	
		if(rs != null) {
			try {
				if(rs.next()) { // existing user
					String checkid = rs.getString("id");
					String checkname = rs.getString("name");
					String checkphone = rs.getString("phone");
					if(checkid.equals(mid) && checkname.equals(name) 
							&& checkphone.equals(phone)) {
						String pw = rs.getString("passwd");
						out.println("<script language='javascript'>");
						out.println("alert('"+pw+"');");
						out.println("</script>");
						session.setAttribute("type", "4");
						session.setAttribute("pw", pw);
						//response.sendRedirect("login.html");
					} else {
						// wrong other user info
						out.println("<script language='javascript'>");
						out.println("alert('회원 정보가 일치하지 않습니다.');");
						out.println("</script>");
						session.setAttribute("type", "5");
						//response.sendRedirect("findPW.html");
					}
				}
				else { // invalid user
					out.println("<script language='javascript'>");
					out.println("alert('회원 정보가 존재하지 않습니다.');");
					out.println("</script>");
					session.setAttribute("type", "3");
					//response.sendRedirect("join.html");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect("findResult.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
