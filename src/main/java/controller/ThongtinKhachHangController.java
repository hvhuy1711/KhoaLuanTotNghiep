package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangthibean;
import bo.khachhangbo;

/**
 * Servlet implementation class ThongtinKhachHangController
 */
@WebServlet("/ThongtinKhachHangController")
public class ThongtinKhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThongtinKhachHangController() {
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
			khachhangbo khbo = new khachhangbo();
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			session.setAttribute("dn", (khachhangthibean) kh);
			if(session.getAttribute("checkMKSQL") != null) {
				request.setAttribute("checkMKSQL", (boolean)session.getAttribute("checkMKSQL"));
				session.removeAttribute("checkMKSQL");
			}
			if(session.getAttribute("checkTMK") != null) {
				request.setAttribute("checkTMK", (boolean)session.getAttribute("checkTMK"));
				session.removeAttribute("checkTMK");
			}
			if(session.getAttribute("checkDoiTC") != null) {
				request.setAttribute("checkDoiTC", (boolean)session.getAttribute("checkDoiTC"));
				session.removeAttribute("checkDoiTC");
			}
			if(session.getAttribute("checkUpdate") != null) {
				request.setAttribute("checkUpdate", (boolean)session.getAttribute("checkUpdate"));
				session.removeAttribute("checkUpdate");
			}
			
			if(session.getAttribute("checkHoten") != null) {
				request.setAttribute("checkHoten", (boolean)session.getAttribute("checkHoten"));
				session.removeAttribute("checkHoten");
			}
			if(session.getAttribute("checkDiaChi") != null) {
				request.setAttribute("checkDiaChi", (boolean)session.getAttribute("checkDiaChi"));
				session.removeAttribute("checkDiaChi");
			}

			if (session.getAttribute("checkEmail") != null) {
				request.setAttribute("checkEmail", (boolean) session.getAttribute("checkEmail"));
				session.removeAttribute("checkEmail");
			}
			
			if (session.getAttribute("checkSoDt") != null) {
				request.setAttribute("checkSoDt", (boolean) session.getAttribute("checkSoDt"));
				session.removeAttribute("checkSoDt");
			}
			RequestDispatcher rd = request.getRequestDispatcher("ThongTinCaNhan.jsp");
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
