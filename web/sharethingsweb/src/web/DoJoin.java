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

import model.DBUtil;

/**
 * Servlet implementation class DoJoin
 */
@WebServlet("/doJoin")
public class DoJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoJoin() {
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
	      String name = request.getParameter("name");
	      String phone = request.getParameter("phone");
	      String email = request.getParameter("email");
	      String address = request.getParameter("address");
	      
	      ServletContext sc = getServletContext();
	      Connection conn = (Connection) sc.getAttribute("DBconnection");
	      
	      ResultSet rs = DBUtil.findUser(conn, mid);
	      
	      PrintWriter out = response.getWriter();
	      
	      if(rs != null) {
	         try {
	            if(rs.next()) {
	               out.println("Already Joined");
	            }
	            else { 
	               DBUtil.addMember(conn, mid, passwd, name, phone, email, address);   
	            }
	            response.sendRedirect("login.html");
	         }
	         catch (SQLException e) {
	               e.printStackTrace();
	         }
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
