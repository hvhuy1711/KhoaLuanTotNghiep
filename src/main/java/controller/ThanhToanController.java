package controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ThanhToanController
 */
@WebServlet("/ThanhToanController")
public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanController() {
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
			String checkck = request.getParameter("checkck");
			String checktm = request.getParameter("checktm");
			String maSPMUA = request.getParameter("maSPMUA");
			String KichThuoc = request.getParameter("KichThuoc");
			String btnThanhToan = request.getParameter("btnThanhToan");
			
			if (btnThanhToan != null) {
				if (checktm != null) {
					HttpSession session = request.getSession();
					khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
						long makh = kh.getMaKhachHang();
//						int maSPMUAInt = Integer.parseInt(maSPMUA);
						giospbo gh = new giospbo();
						ArrayList<giospbean> dsgiott = gh.getdsgio(makh);
							if (dsgiott != null) {
								session.setAttribute("dstt", (ArrayList<giospbean>)dsgiott);
							}
					response.sendRedirect("TTTienMatController");
					return;
				}
			}
			
			if (btnThanhToan != null) {
				if (checkck != null) {
					HttpSession session = request.getSession();
					khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
						long makh = kh.getMaKhachHang();
//						int maSPMUAInt = Integer.parseInt(maSPMUA);
						giospbo gh = new giospbo();
						ArrayList<giospbean> dsgiott = gh.getdsgio(makh);
							if (dsgiott != null) {
								session.setAttribute("dstt", (ArrayList<giospbean>)dsgiott);
								
							}
					response.sendRedirect("TTChuyenKhoanController");
					return;
				}
			}
			
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
