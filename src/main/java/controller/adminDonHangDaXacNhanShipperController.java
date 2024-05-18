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
import bo.DonHangDaDatBo;

/**
 * Servlet implementation class adminDonHangDaXacNhanShipperController
 */
@WebServlet("/adminDonHangDaXacNhanShipperController")
public class adminDonHangDaXacNhanShipperController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDonHangDaXacNhanShipperController() {
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
			DonHangDaDatBo dhad = new DonHangDaDatBo();
			ArrayList<DonHangDaDatBean> dsdhadmin;
			dsdhadmin = dhad.getDHDDAdmin(1);
			request.setAttribute("adminxacnhan", dsdhadmin);
			HttpSession session =request.getSession();
//			adminxacnhanbo adbo = new adminxacnhanbo();
//			ArrayList<choxacnhanbean> dsadmin;
//			dsadmin = adbo.xacnhansp();
//			request.setAttribute("adminxacnhan", dsadmin);
//			if(session.getAttribute("checkUpdateDH") != null) {
//				request.setAttribute("checkUpdateDH", (boolean)session.getAttribute("checkUpdateDH"));
//				session.removeAttribute("checkUpdateDH");
//			}
			if (session.getAttribute("checkUpdateShipper") != null) {
				request.setAttribute("checkUpdateShipper", (boolean) session.getAttribute("checkUpdateShipper"));
				session.removeAttribute("checkUpdateShipper");
			}
			RequestDispatcher rd = 
					request.getRequestDispatcher("adminDonDaDatShipper.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
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
