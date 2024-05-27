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

import bean.AnhBean;
import bean.DonHangDaDatBean;
import bean.KichThuocBean;
import bean.ThongKeBean;
import bean.giospbean;
import bean.khachhangthibean;
import bean.loaispbean;
import bean.sanphamfullbean;
import bo.AnhBo;
import bo.DonHangDaDatBo;
import bo.KichThuocBo;
import bo.ThongKeBo;
import bo.giospbo;
import bo.khachhangbo;
import bo.loaispbo;
import bo.sanphambo;

/**
 * Servlet implementation class adminThongKeKHController
 */
@WebServlet("/adminThongKeKHController")
public class adminThongKeKHController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminThongKeKHController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 request.setCharacterEncoding("utf-8");
			 response.setCharacterEncoding("utf-8");
			 sanphambo sbo = new sanphambo();
			 ArrayList<sanphamfullbean> dssp= sbo.getsanpham(); 
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
			 ArrayList<DonHangDaDatBean> dsdh = dhBo.getAllDHDD();
			 ArrayList<DonHangDaDatBean> dsdhht = dhBo.getDHDDAdmin(3);
			 double tontienht = 0;
			 if (dsdhht != null) {
				    int dsint = dsdhht.size();
				    for (int i = 0; i < dsint; i++) {
				        double soLuongMua = dsdh.get(i).getSoLuongMua();
				        System.out.println(soLuongMua);
				        double gia = dsdh.get(i).getDonGiaSP();
				        System.out.println(gia);
				        double chiecKhau = dsdh.get(i).getChiecKhau();
				        System.out.println(chiecKhau);
				        double thanhTien = soLuongMua * (gia - (gia * (chiecKhau / 100)));
				        tontienht += thanhTien;
				    }
				}
			 DecimalFormat decimalFormat = new DecimalFormat("#,###");
			String tongtienhtFormatted = decimalFormat.format(tontienht);
			request.setAttribute("tontienht", tongtienhtFormatted);
			
			
			 double tontiendh = 0;
			 if (dsdh != null) {
				    int dsint = dsdh.size();
				    for (int i = 0; i < dsint; i++) {
				        double soLuongMua = dsdh.get(i).getSoLuongMua();
				        double gia = dsdh.get(i).getDonGiaSP();
				        double chiecKhau = dsdh.get(i).getChiecKhau();
				        double thanhTien = soLuongMua * (gia - (gia * (chiecKhau / 100)));
				        tontiendh += thanhTien;
				    }
				}
				String tongtienFormatted = decimalFormat.format(tontiendh);
				request.setAttribute("tontiendh", tongtienFormatted);
			 ThongKeBo tkbo = new ThongKeBo();
			 ArrayList<ThongKeBean> dstk = tkbo.GetThongKe();
			 request.setAttribute("dstk", dstk);
			 request.setAttribute("dssp", dssp);
			 request.setAttribute("dskt", dskt);
			 request.setAttribute("dsloai", dsloai);
			 request.setAttribute("dsAnh", dsAnh);
			 request.setAttribute("dskh", dskh);
			 request.setAttribute("dsgio", dsgio);
			 request.setAttribute("dsdh", dsdh);
			 RequestDispatcher rd = 
						request.getRequestDispatcher("ThongKeKH.jsp");
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
