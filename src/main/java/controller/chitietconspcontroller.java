package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class chitietconspcontroller
 */
@WebServlet("/chitietconspcontroller")
public class chitietconspcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chitietconspcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String ms = request.getParameter("ms");
			String ts = request.getParameter("ts");
			String anh = request.getParameter("anh");
			String giamoi = request.getParameter("giamoi");
			String chieckhau = request.getParameter("chieckhau");
			
			request.setAttribute("masach", ms);
			request.setAttribute("tensach", ts);
			request.setAttribute("anh", anh);
			request.setAttribute("giamoi", giamoi);
			request.setAttribute("giacu", chieckhau);
			
			RequestDispatcher rd = 
					request.getRequestDispatcher("Chitietsp.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
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
