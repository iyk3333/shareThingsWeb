package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

/**
 * Servlet implementation class DoSearch
 */
@WebServlet("/doSearch")
public class DoSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoSearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String name = request.getParameter("searchword");
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		ResultSet rs = null;
		rs = DBUtil.searhWord(conn, name);
		ArrayList<String> url = new ArrayList<String>();
		ArrayList<String> productName = new ArrayList<String>();
		ArrayList<String> productNo = new ArrayList<String>();

		if (rs != null) {

			try {
				while (rs.next()) {
					url.add(rs.getString("productImgURL"));
					productName.add(rs.getString("productName"));
					productNo.add(rs.getString("productNo"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		HttpSession session = request.getSession(false);
		if (session == null)
			response.sendRedirect("login.html");
		session.setAttribute("searchword", name);
		session.setAttribute("product", url);
		session.setAttribute("productName", productName);
		session.setAttribute("productNo", productNo);
		response.sendRedirect("searchResult.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
