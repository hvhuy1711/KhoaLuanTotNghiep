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
import utilEmail.Email;

/**
 * Servlet implementation class XacNhanDatHangController
 */
@WebServlet("/XacNhanDatHangController")
public class XacNhanDatHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XacNhanDatHangController() {
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
			String machitiet = request.getParameter("machitiet");
			HttpSession session = request.getSession();
			khachhangthibean kh =(khachhangthibean)session.getAttribute("dn");
			DonHangDaDatBo dhbo = new DonHangDaDatBo();
			ArrayList<DonHangDaDatBean> dsdh = dhbo.getDHDD(kh.getMaKhachHang());
			if(dsdh != null) {
				int maCTInt = Integer.parseInt(machitiet);
				for(DonHangDaDatBean ds : dsdh) {
					if (ds.getMaChiTiet() == maCTInt) {
						dhbo.UpdateTrangThaiDonHT(maCTInt);
						DonHangDaDatBo dhad = new DonHangDaDatBo(); 
						DonHangDaDatBean dsdhHT = dhad.getDHDDDanhGia(maCTInt);
						String thanhtoan = null;
						if(dsdhHT.getTrangThaiDon() == 0 ) {
							thanhtoan = "Thanh toán trực tiếp";
						}else {
							thanhtoan = "Thanh toan online(đã thanh toán)";
						}
						String nodungEmail = "Bạn đặt sản phẩm của chúng tôi với tên sản phẩm là:" + String.valueOf(dsdhHT.getTenSanPham()) +"--- Giá là:" +String.valueOf(dsdhHT.getDonGiaSP()) + "--- Số lượng là:" + String.valueOf(dsdhHT.getSoLuongMua()) + "--- Kích thước là:" + dsdhHT.getGhiChuLS() + "--- Phương thức thanh toán:" + thanhtoan +"ĐƠN HÀNG CỦA BẠN ĐÃ HOÀN THÀNH";
						Email.sendEmail(dsdhHT.getEmail(), "Thông báo đặt hàng", nodungEmail);
						boolean checkDH = true;
						session.setAttribute("checkDH", (boolean) checkDH);
					}
				}
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("LichSuMuaController");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
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
