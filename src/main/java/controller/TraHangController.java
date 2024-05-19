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

import bean.DonHangDaDatBean;
import bean.khachhangthibean;
import bo.DonHangDaDatBo;
import bo.sanphambo;

/**
 * Servlet implementation class TraHangController
 */
@WebServlet("/TraHangController")
public class TraHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraHangController() {
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
			String ndtra = request.getParameter("ndtra");
			String sptra = request.getParameter("sptra");
			int matraInt = Integer.parseInt(sptra);
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			DonHangDaDatBo dh = new DonHangDaDatBo();
			dh.UpdateTrangThaiTra(matraInt, ndtra);
			session.setAttribute("checkTraHang", true);
			sanphambo sbo = new sanphambo();
			ArrayList<String> dsHang = sbo.getHang();
			request.setAttribute("dsHang", dsHang);
			DonHangDaDatBo dhbo = new DonHangDaDatBo();
			ArrayList<DonHangDaDatBean> dsdonhang = dhbo.getDHDD(makh);
			request.setAttribute("dsdonhang", dsdonhang);
			if (session.getAttribute("checkTraHang") != null) {
				request.setAttribute("checkTraHang", (boolean) session.getAttribute("checkTraHang"));
				session.removeAttribute("checkTraHang");
			}
			RequestDispatcher rd = 
					request.getRequestDispatcher("LichSuMua.jsp");
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
