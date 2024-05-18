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
import bo.DanhGiaBo;

/**
 * Servlet implementation class DanhGiaController
 */
@WebServlet("/DanhGiaController")
public class DanhGiaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhGiaController() {
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
			String sosao = request.getParameter("sosao");
			String masp = request.getParameter("masp");
			String nd = request.getParameter("nd");
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
				long makh = kh.getMaKhachHang();
				DanhGiaBo dg = new DanhGiaBo();
				int maspInt = Integer.parseInt(masp);
				int sosaoInt = Integer.parseInt(sosao);
				dg.DanhGiaSP(makh, maspInt, sosaoInt, nd, false);
				boolean checkDanhGia =true;
				session.setAttribute("checkDanhGia", (boolean) checkDanhGia);
				session.setAttribute("ctsp", masp);
				RequestDispatcher rd = 
						request.getRequestDispatcher("chitietsanphamcontroller");
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