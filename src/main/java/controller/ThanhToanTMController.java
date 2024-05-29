package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.HoaDonBean;
import bean.giospbean;
import bean.khachhangthibean;
import bo.ChiTietHoaDonBo;
import bo.HoaDonBo;
import bo.LichSuBo;
import bo.giospbo;
import dao.LichSuDao;
import dao.giospdao;

/**
 * Servlet implementation class ThanhToanTMController
 */
@WebServlet("/ThanhToanTMController")
public class ThanhToanTMController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanTMController() {
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
			String btnXacNhan = request.getParameter("btnXacNhan");
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			giospbo gh = new giospbo();
			ArrayList<giospbean> dsxacnhan = gh.getdsgio(makh);
			if(btnXacNhan != null) {
				HoaDonBo hd = new HoaDonBo();
				hd.ThemHD(makh,  0);
				System.out.println("thành công");
				ArrayList<HoaDonBean> dshd = hd.GetDSHoaDon(makh);
				request.setAttribute("dshd", dshd);
			} 
			RequestDispatcher rd = request.getRequestDispatcher("ThemChiTietLSController");
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
