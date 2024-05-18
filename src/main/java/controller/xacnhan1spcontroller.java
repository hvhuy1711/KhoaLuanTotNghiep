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
 * Servlet implementation class xacnhan1spcontroller
 */
@WebServlet("/xacnhan1spcontroller")
public class xacnhan1spcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhan1spcontroller() {
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
			String btnMua1SP = request.getParameter("btnMua1SP");
			String maSPMUA = request.getParameter("maSPMUA");
			String tenSPMUA = request.getParameter("tenSPMUA");
			String slMua = request.getParameter("slMua");
			String KichThuoc = request.getParameter("KichThuoc");
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			int maspInt = Integer.parseInt(maSPMUA);
			giospbo gh = new giospbo();
			giospbean giosp = gh.get1spgio(makh, maspInt);
			if(btnMua1SP != null) {
				if (giosp != null) {
					request.setAttribute("giosp", giosp);
					
				}}
//				long makh = kh.getMaKhachHang();
//			if (btnMua1SP!= null) {
//				request.setAttribute("maSPMUA", maSPMUA);
//				request.setAttribute("tenSPMUA", tenSPMUA);
//				request.setAttribute("slMua", slMua);
//				request.setAttribute("KichThuoc", KichThuoc);
//			}
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
