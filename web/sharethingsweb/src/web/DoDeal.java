package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class DoDeal
 */
@WebServlet("/doDeal")
public class DoDeal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoDeal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	     response.setCharacterEncoding("UTF-8");
		
		ServletContext sc = getServletContext();
	   	Connection conn = (Connection) sc.getAttribute("DBconnection");
	   	
	   	HttpSession session = request.getSession(false);
	   	if(session==null) session = request.getSession();
	   	int customerNo = Integer.parseInt((String)session.getAttribute("customerNo"));
	   	
	   	int productNo = Integer.parseInt(request.getParameter("productNo"));
	   	session.setAttribute("num", productNo);
	   	
	   	int value = DBUtil.checkBorrowExchange(conn, productNo);
	   	
	   	int custid=0;
	   	custid = DBUtil.customerOfProduct(conn, productNo);
	   	
	   	
	   	if(value==1) {
	   		if(custid==customerNo){
		   		try {
					DBUtil.completeDealBorrow(conn,productNo);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		   	}
	   		response.sendRedirect("borrowDetail.jsp");
	   	}
	   	else if(value==0) {
	   		if(custid==customerNo) {
		   		try {
					DBUtil.completeDealExchange(conn,productNo);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	   		} 	
		   	response.sendRedirect("exchangeDetail.jsp");
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
