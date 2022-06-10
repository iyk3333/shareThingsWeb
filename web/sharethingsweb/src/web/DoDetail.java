package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

/**
 * Servlet implementation class DoDetail
 */
@WebServlet("/doDetail")
public class DoDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	     response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(false);
		if(session==null) response.sendRedirect("login.html");
		
		
		int value=0;
		if(request.getParameter("nv")==null) value = 1;
		else value = Integer.parseInt((String) request.getParameter("nv"));
		
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		int check = DBUtil.checkBorrowExchange(conn, value);
	
		
		if(value==0) {
			session.setAttribute("num", 0);	
			response.sendRedirect("notice.jsp");
		}
		else {
			session.setAttribute("num", value);
			if(check==1)response.sendRedirect("borrowDetail.jsp");
			else response.sendRedirect("exchangeDetail.jsp");
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
