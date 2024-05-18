package controller;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DonHangDaDatBean;
import bo.DonHangDaDatBo;
import utilEmail.Email;

/**
 * Servlet implementation class adminGiaoHangcontroller
 */
@WebServlet("/adminGiaoHangcontroller")
public class adminGiaoHangcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminGiaoHangcontroller() {
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
			String mact= request.getParameter("mact");
			String btnGiaoHang = request.getParameter("btnGiaoHang");
			HttpSession session = request.getSession();
			if(btnGiaoHang != null) {
				DonHangDaDatBo dhdd= new DonHangDaDatBo();
				if (mact != null) {
					//chưa sử lí xong
					int mactInt = Integer.parseInt(mact);
					dhdd.UpdateTrangThaiDonShipper(mactInt);
					DonHangDaDatBo dhad = new DonHangDaDatBo(); 
					DonHangDaDatBean dsdh = dhad.getDHDDDanhGia(mactInt);
					String thanhtoan = null;
					if(dsdh.getTrangThaiDon() == 0 ) {
						thanhtoan = "Thanh toán trực tiếp";
					}else {
						thanhtoan = "Thanh toan online(đã thanh toán)";
					}
					double gia = dsdh.getDonGiaSP();
			        double chiecKhau = dsdh.getChiecKhau();
			        double thanhTientt = (gia * (1 - (chiecKhau / 100)));
			        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        			String GiaFormatted = decimalFormat.format(thanhTientt);
					String nodungEmail = "Bạn đặt sản phẩm của chúng tôi với tên sản phẩm là:" + String.valueOf(dsdh.getTenSanPham()) +"--- Giá là:" +String.valueOf(GiaFormatted) + "đ--- Số lượng là:" + String.valueOf(dsdh.getSoLuongMua()) + "--- Kích thước là:" + dsdh.getGhiChuLS() + "--- Phương thức thanh toán:" + thanhtoan +"ĐƠN HÀNG ĐÃ ĐƯỢC GIAO TỚI BẠN";
					Email.sendEmail(dsdh.getEmail(), "Thông báo đặt hàng", nodungEmail);
					boolean checkUpdateShipper = true;
					session.setAttribute("checkUpdateShipper", (boolean) checkUpdateShipper);
					response.sendRedirect("adminDonHangDaXacNhanShipperController");
					return;
				}
			}
		} catch (Exception e) {
			
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
