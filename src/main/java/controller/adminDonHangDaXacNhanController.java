package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class adminDonHangDaXacNhanController
 */
@WebServlet("/adminDonHangDaXacNhanController")
public class adminDonHangDaXacNhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDonHangDaXacNhanController() {
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
			if(session.getAttribute("checkUpdateHuyDon") != null) {
				request.setAttribute("checkUpdateHuyDon", (boolean)session.getAttribute("checkUpdateHuyDon"));
				session.removeAttribute("checkUpdateHuyDon");
			}
			RequestDispatcher rd = 
					request.getRequestDispatcher("adminDonDaDat.jsp");
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
