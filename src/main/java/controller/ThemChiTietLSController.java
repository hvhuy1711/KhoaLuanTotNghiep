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
import bean.KichThuocBean;
import bean.giospbean;
import bean.khachhangthibean;
import bo.ChiTietHoaDonBo;
import bo.KichThuocBo;
import bo.LichSuBo;
import bo.giospbo;
import utilEmail.Email;

/**
 * Servlet implementation class ThemChiTietLSController
 */
@WebServlet("/ThemChiTietLSController")
public class ThemChiTietLSController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThemChiTietLSController() {
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
			ArrayList<HoaDonBean> dshd = (ArrayList<HoaDonBean>) request.getAttribute("dshd");
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			giospbo gh = new giospbo();
			String thanhtoan= null;
			int maHdCuoiCung = -1;
			if (!dshd.isEmpty()) {
				for (HoaDonBean hoaDon : dshd) {
					maHdCuoiCung = hoaDon.getMaHoaDon();
					if(hoaDon.getTrangThaiDon() == 0) {
						thanhtoan = "Thanh toán khi nhận hàng";
					}else {
						thanhtoan = "Thanh toán online (đã thanh toán)";
					}
				}
			}
//			xử lí mới
			ArrayList<giospbean> dsxacnhan = (ArrayList<giospbean>)session.getAttribute("dstt");
			ChiTietHoaDonBo ct = new ChiTietHoaDonBo();
			KichThuocBo ktbo = new KichThuocBo();
			for (giospbean gio : dsxacnhan) {
				ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(gio.getMaSanPham());
				if (dskt != null) {
					for (KichThuocBean kt : dskt) {
						if (gio.getMaSanPham() == kt.getMaSanPham() && gio.getGhiChu().equals(kt.getTenKichThuoc()) ) {
							System.out.println((int) (kt.getSoLuongSize() - gio.getSoLuongMua()));
							ktbo.UpdateSLMua(gio.getMaSanPham(), (int) (kt.getSoLuongSize() - gio.getSoLuongMua()),
									gio.getGhiChu());
//							System.out.println("Đã update lại số lượng");
						}
					}
				}
				ct.ThemCTHD(maHdCuoiCung, gio.getMaSanPham(), 0, gio.getGhiChu(), gio.getGia(),
						(int) gio.getSoLuongMua());
//				System.out.println("thành công thêm chi tiết");
				
				String nodungEmail = "Bạn đặt sản phẩm của chúng tôi với tên sản phẩm là:" + String.valueOf(gio.getTenSanPham()) +"--- Giá là:" +String.valueOf(gio.getGia()) + "--- Số lượng là:" + String.valueOf(gio.getSoLuongMua()) + "--- Kích thước là:" + gio.getGhiChu() + "--- Phương thức thanh toán:" + thanhtoan ;
				Email.sendEmail(kh.getEmail(), "Thông báo đặt hàng", nodungEmail);
			
				gh.DeleteGio1SP( gio.getMaSanPham(), gio.getGhiChu(), makh);
//				System.out.println("Đã xóa gio hàng");
				boolean checkThanhCong =true;
				session.setAttribute("checkThanhCong", (boolean) checkThanhCong );
			}
			
//			xử lí cũ
//			ArrayList<giospbean> dsxacnhan = gh.getdsgio(makh);
//			System.out.println("Mã hóa đơn cuối cùng: " + maHdCuoiCung);
//			ChiTietHoaDonBo ct = new ChiTietHoaDonBo();
//			KichThuocBo ktbo = new KichThuocBo();
//			for (giospbean gio : dsxacnhan) {
//				ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(gio.getMaSanPham());
//				if (dskt != null) {
//					for (KichThuocBean kt : dskt) {
//						if (gio.getMaSanPham() == kt.getMaSanPham() && gio.getGhiChu().equals(kt.getTenKichThuoc()) ) {
//							System.out.println((int) (kt.getSoLuongSize() - gio.getSoLuongMua()));
//							ktbo.UpdateSLMua(gio.getMaSanPham(), (int) (kt.getSoLuongSize() - gio.getSoLuongMua()),
//									gio.getGhiChu());
//							System.out.println("Đã update lại số lượng");
//						}
//					}
//				}
//				ct.ThemCTHD(maHdCuoiCung, gio.getMaSanPham(), 0, gio.getGhiChu(), gio.getGia(),
//						(int) gio.getSoLuongMua());
//				System.out.println("thành công thêm chi tiết");
//
//			}
			
			LichSuBo lsbo = new LichSuBo();
			lsbo.ThemLichSu(makh, maHdCuoiCung, "TongTien", 0, null);
//			System.out.println("Đã thêm lịch sử");
//			gh.DeleteGioKH((int) makh);
//			System.out.println("Đã xóa gio hàng");
			if (session.getAttribute("checkThanhCong") != null) {
				request.setAttribute("checkThanhCong", (boolean) session.getAttribute("checkThanhCong"));
				session.removeAttribute("checkThanhCong");
			}
			RequestDispatcher rd = request.getRequestDispatcher("LichSuMuaController");
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
