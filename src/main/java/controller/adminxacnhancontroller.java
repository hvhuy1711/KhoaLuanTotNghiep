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
import bean.choxacnhanbean;
import bo.DonHangDaDatBo;
import bo.choxacnhanbo;

/**
 * Servlet implementation class adminxacnhancontroller
 */
@WebServlet("/adminxacnhancontroller")
public class adminxacnhancontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminxacnhancontroller() {
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
			dsdhadmin = dhad.getDHDDAdmin(0);
			request.setAttribute("adminxacnhan", dsdhadmin);
			HttpSession session =request.getSession();
			if(session.getAttribute("checkUpdateXacNhan") != null) {
				request.setAttribute("checkUpdateXacNhan", (boolean)session.getAttribute("checkUpdateXacNhan"));
				session.removeAttribute("checkUpdateXacNhan");
			}
			RequestDispatcher rd = 
					request.getRequestDispatcher("adminxacnhansp.jsp");
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
