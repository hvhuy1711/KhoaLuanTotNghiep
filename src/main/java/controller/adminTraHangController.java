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
 * Servlet implementation class adminTraHangController
 */
@WebServlet("/adminTraHangController")
public class adminTraHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminTraHangController() {
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
			ArrayList<DonHangDaDatBean> admintra;
			admintra = dhad.getDHDDAdmin(4);
			
			request.setAttribute("admintra", admintra);
			HttpSession session =request.getSession();
			if(session.getAttribute("checkUpdateHuyDon") != null) {
				request.setAttribute("checkUpdateHuyDon", (boolean)session.getAttribute("checkUpdateHuyDon"));
				session.removeAttribute("checkUpdateHuyDon");
			}
			if(session.getAttribute("checkTraHang") != null) {
				request.setAttribute("checkTraHang", (boolean)session.getAttribute("checkTraHang"));
				session.removeAttribute("checkTraHang");
			}
			if(session.getAttribute("checkTraHangTC") != null) {
				request.setAttribute("checkTraHangTC", (boolean)session.getAttribute("checkTraHangTC"));
				session.removeAttribute("checkTraHangTC");
			}
			RequestDispatcher rd = 
					request.getRequestDispatcher("adminTraHang.jsp");
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
