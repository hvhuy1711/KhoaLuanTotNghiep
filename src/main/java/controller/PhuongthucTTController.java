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

import bean.giospbean;
import bean.khachhangthibean;
import bo.giospbo;

/**
 * Servlet implementation class PhuongthucTTController
 */
@WebServlet("/PhuongthucTTController")
public class PhuongthucTTController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhuongthucTTController() {
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
			String btnThanhToan = request.getParameter("btnThanhToan");
			String checkck = request.getParameter("checkck");
			String checktm = request.getParameter("checktm");

			// sử lí thanh toán online
//			System.out.print(dsgiott.)
			if (btnThanhToan != null) {
				if (checkck != null) {
					HttpSession session = request.getSession();
					khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
					long makh = kh.getMaKhachHang();
					System.out.println(1);
					System.out.println(makh);
					giospbo gh = new giospbo();
					ArrayList<giospbean> dsgiott = gh.getdsgio(makh);
					if (dsgiott != null) {
						request.setAttribute("dsgio", (ArrayList<giospbean>)dsgiott);
						response.sendRedirect("thanhtoanCK.jsp");
						return;
					}
				}
			}
			// xử lí thanh toán tiền mặt
//			if (checktm != null) {
//				HttpSession session = request.getSession();
//				khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
//				long makh = kh.getMaKhachHang();
//				giospbo gh = new giospbo();
//				ArrayList<giospbean> dsgiott = gh.getdsgio(makh);
//				if (dsgiott != null) {
//					request.setAttribute("dsgio", dsgiott);
//					response.sendRedirect("xulithanhToanTienMatController");
//					return;
//				}
//			}
//			HttpSession session =request.getSession();
//			khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
//			if( kh != null ) {
//				if(btnThanhToan != null) {}
//				choxacnhanbo cxnbo = new choxacnhanbo();
//				ArrayList<choxacnhanbean> dschoxacnhan;
//				long makh = khxn.getMaKhachHang();
//				dschoxacnhan = cxnbo.choxacnhan(makh);
//				request.setAttribute("choxacnhansp", dschoxacnhan);
//			}

//				if (session.getAttribute("gh") != null) {
//					giohangbo gh = (giohangbo)session.getAttribute("gh");
//		      		int n = gh.ds.size();
//		      		if( n>0 ) {
//		      			request.setAttribute("sh", (int)n);	
//		      		}else {
//		      			request.setAttribute("sh", (int)0);
//		      		}
//				}else {
//					request.setAttribute("sh", (int)0);
//				}
			RequestDispatcher rd = request.getRequestDispatcher("thanhtoanCK.jsp");
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
