package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AnhBean;
import bean.DonHangDaDatBean;
import bean.HoaDonBean;
import bean.KichThuocBean;
import bean.ThongKeBean;
import bean.giospbean;
import bean.khachhangthibean;
import bean.loaispbean;
import bean.sanphamfullbean;
import bo.AnhBo;
import bo.DonHangDaDatBo;
import bo.HoaDonBo;
import bo.KichThuocBo;
import bo.ThongKeBo;
import bo.giospbo;
import bo.khachhangbo;
import bo.loaispbo;
import bo.sanphambo;

/**
 * Servlet implementation class adminThongKeDHController
 */
@WebServlet("/adminThongKeDHController")
public class adminThongKeDHController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminThongKeDHController() {
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
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			sanphambo sbo = new sanphambo();
			ArrayList<sanphamfullbean> dssp = sbo.getsanpham();
			KichThuocBo ktbo = new KichThuocBo();
			ArrayList<KichThuocBean> dskt = ktbo.getDSKT();
			loaispbo lbo = new loaispbo();
			ArrayList<loaispbean> dsloai = lbo.getloaisp();
			AnhBo abo = new AnhBo();
			ArrayList<AnhBean> dsAnh = abo.getAnh();
			khachhangbo khbo = new khachhangbo();
			ArrayList<khachhangthibean> dskh = khbo.getAllkhachhang();
			giospbo giobo = new giospbo();
			ArrayList<giospbean> dsgio = giobo.getAlldsgio();
			DonHangDaDatBo dhBo = new DonHangDaDatBo();
			HoaDonBo hdbo = new HoaDonBo();
			ArrayList<HoaDonBean> dshd = hdbo.GetALLDSHoaDon();
			ArrayList<DonHangDaDatBean> dsdh = dhBo.getAllDHDD();
			String btnsearch = request.getParameter("btnsearch");
			if (btnsearch != null) {
				String searchProduct = request.getParameter("searchProduct");
				String searchCustomer = request.getParameter("searchCustomer");
				ArrayList<DonHangDaDatBean> dsdhFiltered = new ArrayList<DonHangDaDatBean>();

				// Lọc các đơn hàng theo tiêu chí tìm kiếm
				if ((searchProduct != null && !searchProduct.isEmpty())
						|| (searchCustomer != null && !searchCustomer.isEmpty())) {
					for (DonHangDaDatBean dh : dsdh) {
						boolean matchProductName = searchProduct != null && !searchProduct.isEmpty()
								&& dh.getTenSanPham().toLowerCase().contains(searchProduct.toLowerCase());
						boolean matchCustomerName = searchCustomer != null && !searchCustomer.isEmpty()
								&& dh.getHoTen().toLowerCase().contains(searchCustomer.toLowerCase());
						if (matchProductName || matchCustomerName) {
							dsdhFiltered.add(dh);
						}
					}
				} else {
					dsdhFiltered = dsdh;
				}

				// Lọc danh sách hóa đơn, chỉ giữ lại hóa đơn có chứa đơn hàng phù hợp
				ArrayList<HoaDonBean> filteredHoaDons = new ArrayList<HoaDonBean>();
				for (HoaDonBean hd : dshd) {
					boolean hasMatchingOrder = false;
					for (DonHangDaDatBean dh : dsdhFiltered) {
						if (dh.getMaHoaDon() == hd.getMaHoaDon()) {
							hasMatchingOrder = true;
							break;
						}
					}
					if (hasMatchingOrder) {
						filteredHoaDons.add(hd);
					}
				}

				// Cập nhật request attribute
				request.setAttribute("dshd", filteredHoaDons);
				request.setAttribute("dsdh", dsdhFiltered);
			}
			String btnchon = request.getParameter("btnchon");
			if (btnchon != null) {
				ArrayList<DonHangDaDatBean> dsdhht = dhBo.getDHDDAdmin(2);
				String ngay = request.getParameter("ngay");
				String thang = request.getParameter("thang");
				String nam = request.getParameter("nam");
				int ngayInt = Integer.parseInt(ngay);
				int thangInt = Integer.parseInt(thang);
				int namInt = Integer.parseInt(nam);
				double tontienht = 0;
				if (dsdhht != null) {
					int dsint = dsdhht.size();
					for (int i = 0; i < dsint; i++) {
						DonHangDaDatBean donHang = dsdhht.get(i);

						// Lấy ngày mua của đơn hàng
						java.util.Date ngayMuaDate = donHang.getNgayMua();

						// Chuyển đổi java.util.Date sang String với định dạng yyyy-MM-dd
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						String ngayMuaStr = sdf.format(ngayMuaDate);

						String[] ngayMuaParts = ngayMuaStr.split("-");

						// Lấy năm, tháng, ngày từ chuỗi đã tách
						String namMua = ngayMuaParts[0];
						String thangMua = ngayMuaParts[1];
						String ngayMua = ngayMuaParts[2];
						int namMuaInt = Integer.parseInt(namMua);
						int thangMuaInt = Integer.parseInt(thangMua);
						int ngayMuaInt = Integer.parseInt(ngayMua);
						

						// So sánh ngày, tháng và năm của đơn hàng với các tham số đã chọn
						if (namMuaInt == namInt && thangMuaInt == thangInt && ngayMuaInt == ngayInt) {
							double soLuongMua = dsdh.get(i).getSoLuongMua();
							double gia = dsdh.get(i).getDonGiaSP();
							double chiecKhau = dsdh.get(i).getChiecKhau();
							double thanhTien = soLuongMua * (gia - (gia * (chiecKhau / 100)));
							tontienht += thanhTien;
						}
					}
				}
				DecimalFormat decimalFormat = new DecimalFormat("#,###");
				String tongtienhtFormatted = decimalFormat.format(tontienht);
				request.setAttribute("tontienht", tongtienhtFormatted);

				double tontiendh = 0;
				ArrayList<HoaDonBean> filteredHoaDons = new ArrayList<HoaDonBean>(); // Khởi tạo danh sách hóa đơn đã lọc bên ngoài vòng lặp
				ArrayList<DonHangDaDatBean> dsdhFiltered = new ArrayList<DonHangDaDatBean>(); // Khởi tạo danh sách đơn hàng đã lọc bên ngoài vòng lặp

				if (dsdh != null) {
				    int dsint = dsdh.size();
				    for (int i = 0; i < dsint; i++) {
				        DonHangDaDatBean donHang = dsdh.get(i);
				        java.util.Date ngayMuaDate = donHang.getNgayMua();
				        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				        String ngayMuaStr = sdf.format(ngayMuaDate);
				        String[] ngayMuaParts = ngayMuaStr.split("-");
				        String namMua = ngayMuaParts[0];
				        String thangMua = ngayMuaParts[1];
				        String ngayMua = ngayMuaParts[2];
				        int namMuaInt = Integer.parseInt(namMua);
				        int thangMuaInt = Integer.parseInt(thangMua);
				        int ngayMuaInt = Integer.parseInt(ngayMua);

				        // So sánh ngày, tháng và năm của đơn hàng với các tham số đã chọn
				        if (namMuaInt == namInt && thangMuaInt == thangInt && ngayMuaInt == ngayInt) {
				            dsdhFiltered.add(donHang);
				            double soLuongMua = donHang.getSoLuongMua();
				            double gia = donHang.getDonGiaSP();
				            double chiecKhau = donHang.getChiecKhau();
				            double thanhTien = soLuongMua * (gia - (gia * (chiecKhau / 100)));
				            tontiendh += thanhTien;
				        }
				    }
				}

				// Lọc danh sách hóa đơn, chỉ giữ lại hóa đơn có chứa đơn hàng phù hợp
				for (HoaDonBean hd : dshd) {
				    boolean hasMatchingOrder = false;
				    for (DonHangDaDatBean dh : dsdhFiltered) {
				        if (dh.getMaHoaDon() == hd.getMaHoaDon()) {
				            hasMatchingOrder = true;
				            break;
				        }
				    }
				    if (hasMatchingOrder) {
				        filteredHoaDons.add(hd);
				    }
				}

				// Cập nhật request attribute
				request.setAttribute("dshd", filteredHoaDons);
				request.setAttribute("dsdh", dsdhFiltered);

				String tongtienFormatted = decimalFormat.format(tontiendh);
				request.setAttribute("tontiendh", tongtienFormatted);

			}
			ThongKeBo tkbo = new ThongKeBo();
			ArrayList<ThongKeBean> dstk = tkbo.GetThongKe();
			request.setAttribute("dstk", dstk);
			request.setAttribute("dssp", dssp);
			request.setAttribute("dskt", dskt);
			request.setAttribute("dsloai", dsloai);
			request.setAttribute("dsAnh", dsAnh);
			request.setAttribute("dskh", dskh);
			request.setAttribute("dsgio", dsgio);
//			 request.setAttribute("dsdh", dsdh);
			RequestDispatcher rd = request.getRequestDispatcher("ThongKeDH.jsp");
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
