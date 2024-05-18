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
//			int magio = dsxacnhan.
			if(btnXacNhan != null) {
				HoaDonBo hd = new HoaDonBo();
				hd.ThemHD(makh,  0);
				System.out.println("thành công");
				ArrayList<HoaDonBean> dshd = hd.GetDSHoaDon(makh);
				request.setAttribute("dshd", dshd);
			} 
//				HoaDonBean hdkh = hd.GetHoaDon(makh);
				
//				int maHdCuoiCung = -1; // Khởi tạo giá trị mặc định, có thể thay đổi tùy theo yêu cầu
//				if (!dshd.isEmpty()) {
//				    for (HoaDonBean hoaDon : dshd) {
//				        maHdCuoiCung = hoaDon.getMaHoaDon();
//				    }
//				}
//				System.out.println("Mã hóa đơn cuối cùng: " + maHdCuoiCung);
//				ChiTietHoaDonBo ct = new ChiTietHoaDonBo();
//				for (giospbean gio : dsxacnhan) {
////					if () {
//						ct.ThemCTHD(maHdCuoiCung, gio.getMaSanPham(), 0, gio.getGhiChu(), gio.getGia(), (int)gio.getSoLuongMua());
//						System.out.println("thành công thêm chi tiết");
////					}
//				}
//				LichSuBo lsbo = new LichSuBo();
//				lsbo.ThemLichSu(makh,maHdCuoiCung, "TongTien", 0 ,null);
//				System.out.println("Đã thêm lịch sử");
//				gh.DeleteGioKH((int)makh);
//				System.out.println("Đã xóa gio hàng");
			RequestDispatcher rd = request.getRequestDispatcher("ThemChiTietLSController");
			rd.forward(request, response);
//			RequestDispatcher rd = request.getRequestDispatcher("sanphamcontroller");
//			rd.forward(request, response);
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
