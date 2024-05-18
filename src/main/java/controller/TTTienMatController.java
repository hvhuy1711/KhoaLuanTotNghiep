package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giospbean;
import bean.khachhangthibean;
import bo.giospbo;
import bo.sanphambo;

/**
 * Servlet implementation class TTTienMatController
 */
@WebServlet("/TTTienMatController")
public class TTTienMatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TTTienMatController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			sanphambo sbo = new sanphambo();
			HttpSession session = request.getSession();
			ArrayList<String> dsHang = sbo.getHang();
			ArrayList<giospbean> dstt = (ArrayList<giospbean>)session.getAttribute("dstt");
			System.out.println(dstt);
			if (dstt != null) {
				request.setAttribute("dstt", (ArrayList<giospbean>) dstt);
			}
//			HttpSession session = request.getSession();
//			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
////			khachhangthibean khdn = (khachhangthibean)request.getAttribute("dn");
//			long makh = kh.getMaKhachHang();
////			System.out.println(makh);
//			giospbo gh = new giospbo();
//			
//			ArrayList<giospbean> dsgiott = gh.getdsgio(makh);
//			if (dsgiott != null) {
////				System.out.println(dsgiott);
//				request.setAttribute("dstt", (ArrayList<giospbean>) dsgiott);
//			}
			request.setAttribute("dsHang", dsHang);

			RequestDispatcher rd = request.getRequestDispatcher("thanhtoanTM.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
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
