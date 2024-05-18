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

import bean.AnhBean;
import bean.sanphamfullbean;
import bo.AnhBo;
import bo.sanphambo;

/**
 * Servlet implementation class adminThemAnhController
 */
@WebServlet("/adminThemAnhController")
public class adminThemAnhController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminThemAnhController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String anh = request.getParameter("anh");
			request.setAttribute("anh1", anh);
			HttpSession session =request.getSession();
			if(session.getAttribute("masp") != null) {
				String masp = (String)session.getAttribute("masp");
				AnhBo anhbo = new AnhBo();
				int maspInt = Integer.parseInt(masp);
				ArrayList<AnhBean> dsAnh = anhbo.getdsAnh(maspInt);
				sanphambo spbo = new sanphambo();
				sanphamfullbean sp = spbo.get1sanpham(masp);
				request.setAttribute("dssanpham", spbo.getsanpham());
				request.setAttribute("sp", sp);
				request.setAttribute("dsAnh", dsAnh);
				session.removeAttribute("masp");
			}
			else {
				String masp = request.getParameter("masp");
				AnhBo anhbo = new AnhBo();
				int maspInt = Integer.parseInt(masp);
				ArrayList<AnhBean> dsAnh = anhbo.getdsAnh(maspInt);
				sanphambo spbo = new sanphambo();
				sanphamfullbean sp = spbo.get1sanpham(masp);
				request.setAttribute("dssanpham", spbo.getsanpham());
				request.setAttribute("sp", sp);
				request.setAttribute("dsAnh", dsAnh);
			}
			if (session.getAttribute("checkXoaChonAnh") != null) {
				request.setAttribute("checkXoaChonAnh", (boolean) session.getAttribute("checkXoaChonAnh"));
				session.removeAttribute("checkXoaChonAnh");
			}
			if (session.getAttribute("checkThemAnh") != null) {
				request.setAttribute("checkThemAnh", (boolean) session.getAttribute("checkThemAnh"));
				session.removeAttribute("checkThemAnh");
			}
			if (session.getAttribute("checkXoaCheckBox") != null) {
				request.setAttribute("checkXoaCheckBox", (boolean) session.getAttribute("checkXoaCheckBox"));
				session.removeAttribute("checkXoaCheckBox");
			}
			RequestDispatcher rd = 
					request.getRequestDispatcher("ThemAnh.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
