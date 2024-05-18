package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.loaispbo;

/**
 * Servlet implementation class adminCNLoaiController
 */
@WebServlet("/adminCNLoaiController")
public class adminCNLoaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminCNLoaiController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			loaispbo lbo = new loaispbo();
			String tab = request.getParameter("tab");
			String maloai = request.getParameter("maloai");
			String tenloai = request.getParameter("tenloai");
			String btnLoai = request.getParameter("btnLoai");
			HttpSession session = request.getSession();
			int maloaiInt = Integer.parseInt(maloai);
			if (btnLoai != null) {
				lbo.SuaspLoai(maloaiInt, tenloai);
				boolean checkUpLoai= true;
				session.setAttribute("checkUpLoai", (boolean) checkUpLoai);
			}
			if (session.getAttribute("checkUpLoai") != null) {
				request.setAttribute("checkUpLoai", (boolean) session.getAttribute("checkUpLoai"));
				session.removeAttribute("checkUpLoai");
			}
			request.setAttribute("dsloai" , lbo.getloaisp());
			RequestDispatcher rd = 
					request.getRequestDispatcher("Adminsploai.jsp");
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
