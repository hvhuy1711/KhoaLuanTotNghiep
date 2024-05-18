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
 * Servlet implementation class CNTTKhachHangController
 */
@WebServlet("/CNTTKhachHangController")
public class CNTTKhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CNTTKhachHangController() {
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
			String ht = request.getParameter("hoten");
			String soDt = request.getParameter("sodt");
			String Diachi = request.getParameter("diachi");
			String btnCapNhap = request.getParameter("btncn");
			String masp = request.getParameter("masp");
			String kichthuoc = request.getParameter("kichthuoc");
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			khachhangbo khbo = new khachhangbo();
			if (btnCapNhap != null) {
				khbo.UpdateTTKH(makh, ht, soDt, Diachi);
				boolean checkUpdateTT = true;
				session.setAttribute("checkUpdateTT", (boolean)checkUpdateTT);
				session.removeAttribute("dn");
				khachhangthibean khnew = khbo.get1KhachHang(makh);
				session.setAttribute("dn", (khachhangthibean) khnew);
//				int maspInt = Integer.parseInt(masp);
				session.setAttribute("maSPMUA", masp);
				session.setAttribute("KichThuoc", kichthuoc);
				response.sendRedirect("kiemTraTTKHController");
				return;
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("thanhtoansp.jsp");
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