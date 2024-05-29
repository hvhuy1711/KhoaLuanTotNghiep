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
import bo.ChiTietHoaDonBo;
import bo.DonHangDaDatBo;
import bo.HoaDonBo;
import bo.LichSuBo;
import bo.lichsuspbo;
import bo.sanphambo;

/**
 * Servlet implementation class HuyDonController
 */
@WebServlet("/HuyDonController")
public class HuyDonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HuyDonController() {
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
			String maLS = request.getParameter("maLS");
			String maCT = request.getParameter("maCT");
			String maHoaDon = request.getParameter("maHoaDon");
			int maLSInt = Integer.parseInt(maLS);
			int maCTInt = Integer.parseInt(maCT);
			int maHoaDonInt = Integer.parseInt(maHoaDon);
			LichSuBo lsbo = new LichSuBo();
			ChiTietHoaDonBo ctbo = new ChiTietHoaDonBo();
			HoaDonBo hdbo = new HoaDonBo();
			lsbo.DeleteLichSu(maLSInt);
			ctbo.DeleteChiTiet(maCTInt);
			hdbo.DeleteHoaDon(maHoaDonInt);
			HttpSession session = request.getSession();
			session.setAttribute("checkHuyDon", true);
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			sanphambo sbo = new sanphambo();
			ArrayList<String> dsHang = sbo.getHang();
			request.setAttribute("dsHang", dsHang);
			DonHangDaDatBo dhbo = new DonHangDaDatBo();
			ArrayList<DonHangDaDatBean> dsdonhang = dhbo.getDHDD(makh);
			request.setAttribute("dsdonhang", dsdonhang);
			if (session.getAttribute("checkDH") != null) {
				request.setAttribute("checkDH", (boolean) session.getAttribute("checkDH"));
				session.removeAttribute("checkDH");
			}
			if (session.getAttribute("checkHuyDon") != null) {
				request.setAttribute("checkHuyDon", (boolean) session.getAttribute("checkHuyDon"));
				session.removeAttribute("checkHuyDon");
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
