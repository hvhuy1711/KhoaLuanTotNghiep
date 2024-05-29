package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

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
import bo.hoadonspbo;

/**
 * Servlet implementation class xacnhanspcontroller
 */
@WebServlet("/xacnhanspcontroller")
public class xacnhanspcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanspcontroller() {
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
			String btnTT = request.getParameter("btnTT");
			String maSPMUA = request.getParameter("maSPMUA");
			String KichThuoc = request.getParameter("KichThuoc");
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			if(kh.getHoTen() == null) {
				boolean checkHoten = true;
				session.setAttribute("checkHoten", checkHoten);
				response.sendRedirect("ThongtinKhachHangController");
				return;
			} 
			else if (kh.getDiaChi() == null) {
				boolean checkDiaChi = true;
				session.setAttribute("checkDiaChi", checkDiaChi);
				response.sendRedirect("ThongtinKhachHangController");
				return;
			}
			else if (kh.getSoDT() == null) {
				boolean checkSoDT = true;
				session.setAttribute("checkSoDT", checkSoDT);
				response.sendRedirect("ThongtinKhachHangController");
				return;
			}
			else
			if (session.getAttribute("maSPMUA") != null && (String)session.getAttribute("KichThuoc") != null) {
				int maSPMUAInt = Integer.parseInt((String)session.getAttribute("maSPMUA"));
				String KichThuoc1 = (String)session.getAttribute("KichThuoc");
				giospbo gh = new giospbo();
				ArrayList<giospbean> dsgiott = gh.getdsgio1SP(makh, maSPMUAInt ,KichThuoc1);
					if (dsgiott != null) {
						request.setAttribute("dsgio", dsgiott);
						
					}
				session.removeAttribute("KichThuoc1");
				session.removeAttribute("maSPMUA");
			}else {
				int maSPMUAInt = Integer.parseInt(maSPMUA);
				giospbo gh = new giospbo();
				if (btnTT != null) {
				ArrayList<giospbean> dsgiott = gh.getdsgio1SP(makh, maSPMUAInt ,KichThuoc);
					if (dsgiott != null) {
						request.setAttribute("dsgio", dsgiott);
						
					}
				}
			}
				
			request.setAttribute("dn", kh);
			RequestDispatcher rd = 
					request.getRequestDispatcher("thanhtoansp.jsp");
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
