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

import bean.HoaDonBean;
import bean.giospbean;
import bean.khachhangthibean;
import bo.ChiTietHoaDonBo;
import bo.HoaDonBo;
import bo.LichSuBo;
import bo.giospbo;

/**
 * Servlet implementation class ThanhToanCKController
 */
@WebServlet("/ThanhToanCKController")
public class ThanhToanCKController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanCKController() {
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
			String btnHTTT = request.getParameter("btnHTTT");
			String ghichuGio = request.getParameter("ghichuGio");
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			giospbo gh = new giospbo();
			ArrayList<giospbean> dsxacnhan = gh.getdsgio(makh);
			if(btnHTTT != null) {
				HoaDonBo hd = new HoaDonBo();
				hd.ThemHD(makh,  1);
				System.out.println("thành công");
				ArrayList<HoaDonBean> dshd = hd.GetDSHoaDon(makh);
				request.setAttribute("dshd", dshd);
//				ChiTietHoaDonBo ct = new ChiTietHoaDonBo();
//				for (giospbean gio : dsxacnhan) {
////					if () {
//						ct.ThemCTHD(hdkh.getMaHoaDon(), gio.getMaSanPham(), 0, gio.getGhiChu(), gio.getGia(), (int)gio.getSoLuongMua());
//						System.out.println("thành công thêm chi tiết");
////					}
//				}
//				LichSuBo lsbo = new LichSuBo();
//				lsbo.ThemLichSu(makh, hdkh.getMaHoaDon(), "TongTien", 0 ,ghichuGio);
//				System.out.println("Đã thêm lịch sử");
//				gh.DeleteGioKH((int)makh);
//				System.out.println("Đã xóa gio hàng");
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
