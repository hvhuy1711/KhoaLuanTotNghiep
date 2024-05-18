package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DonHangDaDatBean;
import bean.choxacnhanbean;
import bean.khachhangthibean;
import bo.DonHangDaDatBo;
import bo.choxacnhanbo;
import utilEmail.Email;

/**
 * Servlet implementation class adminxacnhanspkhcontroller
 */
@WebServlet("/adminxacnhanspkhcontroller")
public class adminxacnhanspkhcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminxacnhanspkhcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// dùng để set Damua = 1
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String mact= request.getParameter("mact");
			String btnXacNhan = request.getParameter("btnXacNhan");
			String btnDonDat = request.getParameter("btnDonDat");
			HttpSession session = request.getSession();
			if(btnXacNhan != null) {
				DonHangDaDatBo dhdd= new DonHangDaDatBo();
				if (mact != null) { 
					int mactInt = Integer.parseInt(mact);
					dhdd.UpdateTrangThaiDon(mactInt);
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
					String nodungEmail = "Bạn đặt sản phẩm của chúng tôi với tên sản phẩm là:" + String.valueOf(dsdh.getTenSanPham()) +"--- Giá là:" +String.valueOf(GiaFormatted) + "--- Số lượng là:" + String.valueOf(dsdh.getSoLuongMua()) + "--- Kích thước là:" + dsdh.getGhiChuLS() + "--- Phương thức thanh toán:" + thanhtoan +"ĐÃ ĐƯỢC PHÊ DUYỆT!!ĐƠN HÀNG ĐANG DƯỢC GIAO";
					Email.sendEmail(dsdh.getEmail(), "Thông báo đặt hàng", nodungEmail);
					boolean checkUpdateXacNhan = true;
					session.setAttribute("checkUpdateXacNhan", (boolean) checkUpdateXacNhan);
					response.sendRedirect("adminxacnhancontroller");
					return;
				}
			}
			else if(btnDonDat != null) {
				DonHangDaDatBo dhdd= new DonHangDaDatBo();
				if (mact != null) {
					int mactInt = Integer.parseInt(mact);
					dhdd.UpdateTrangThaiHuyDon(mactInt);
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
					String nodungEmail = "Bạn đặt sản phẩm của chúng tôi với tên sản phẩm là:" + String.valueOf(dsdh.getTenSanPham()) +"--- Giá là:" +String.valueOf(GiaFormatted) + "đ--- Số lượng là:" + String.valueOf(dsdh.getSoLuongMua()) + "--- Kích thước là:" + dsdh.getGhiChuLS() + "--- Phương thức thanh toán:" + thanhtoan + "ĐƠN HÀNG CỦA BẠN ĐÃ BỊ HỦY";
					Email.sendEmail(dsdh.getEmail(), "Thông báo đặt hàng", nodungEmail);
					boolean checkUpdateHuyDon = true;
					session.setAttribute("checkUpdateHuyDon", (boolean) checkUpdateHuyDon);
					response.sendRedirect("adminDonHangDaXacNhanController");
					return;
				}
			}
//				request.removeAttribute(mact);
//				response.sendRedirect("adminxacnhancontroller");
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
