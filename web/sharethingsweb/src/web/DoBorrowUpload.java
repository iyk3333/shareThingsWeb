package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DBUtil;

/**
 * Servlet implementation class DoBorrowUpload
 */
@WebServlet("/doBorrowUpload")
public class DoBorrowUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoBorrowUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession(false);
		if(session==null) session = request.getSession();
		
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));
		String month = String.valueOf(cal.get(Calendar.MONTH)+1);
		String date = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
		String hour = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
		String min = String.valueOf(cal.get(Calendar.MINUTE));
		String sec = String.valueOf(cal.get(Calendar.SECOND));
		String now = year+"/"+month+"/"+date+"/"+hour+"/"+min+"/"+sec;
		
		int custid = Integer.parseInt((String) session.getAttribute("customerNo"));
		
		String file = request.getParameter("file");
		
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		
		int maxSize = 10*1024*1024; 
        String encoding = "utf-8";
        
        ServletContext context = getServletContext(); //어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨. 
        String saveDir = context.getRealPath("Upload"); //절대경로를 가져옴

        MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
        
        Enumeration files = multi.getFileNames();
        String str = (String)files.nextElement();
        file=multi.getFilesystemName(str);
        
        String name = multi.getParameter("name");
		String category = multi.getParameter("category");
		String price = multi.getParameter("price");
		String day= multi.getParameter("lendingPeriod");
		String information = multi.getParameter("explanation");
        //file = saveDir+"\\"+file;
		
		try {
			DBUtil.addBorrowProduct(conn, custid, category, name, price, day, file, information,now);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		response.sendRedirect("borrowList.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
