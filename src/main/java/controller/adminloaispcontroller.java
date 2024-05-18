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

import bean.loaispbean;
import bean.sanphamfullbean;
import bo.loaispbo;
import bo.sanphambo;

/**
 * Servlet implementation class adminloaispcontroller
 */
@WebServlet("/adminloaispcontroller")
public class adminloaispcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminloaispcontroller() {
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
			loaispbo lbo = new loaispbo();
			String tab = request.getParameter("tab");
			String ml = request.getParameter("txtmaloai");
			String mlxoa = request.getParameter("mlxoa");
			String tenloai = request.getParameter("txttenloai");
			HttpSession session = request.getSession();
			ArrayList<loaispbean> ds = lbo.getloaisp();
			if(request.getParameter("butadd") != null) {
				lbo.ThemspLoai( tenloai);
				boolean checkThemLoai = true;
				session.setAttribute("checkThemLoai", (boolean) checkThemLoai);
			}
			
			if (tab != null && tab.equals("xoa")) {
				sanphambo sbo = new sanphambo();
				sanphamfullbean dssp = sbo.get1sanphamMaLoai(mlxoa);
				if(dssp != null) {
					boolean checkMLSP = true;
					session.setAttribute("checkMLSP",  checkMLSP);
				}else {
					int mlxoaInt = Integer.parseInt(mlxoa);
					lbo.XoaspLoai(mlxoaInt);
					boolean checkXoaLoai = true;
					session.setAttribute("checkXoaLoai", (boolean) checkXoaLoai);
				}
			}
			
			
			/*
			 * else if (request.getParameter("butupdate") != null) { lbo.SuaspLoai(ml,
			 * tenloai); }else { String maloai = request.getParameter("ml"); String
			 * tenloaimoi = request.getParameter("tl"); if(tab!=null && tab.equals("xoa"))
			 * lbo.XoaspLoai(maloai); else if (tab != null && tab.equals("chon")) {
			 * request.setAttribute("ml", maloai); request.setAttribute("tenloai",
			 * tenloaimoi); }else if (request.getParameter("butupdate") != null) {
			 * lbo.SuaspLoai(ml, tenloai); response.sendRedirect("adminloaispcontroller");
			 * return; } }
			 */
			 
			 if (session.getAttribute("checkXoaLoai") != null) {
					request.setAttribute("checkXoaLoai", (boolean) session.getAttribute("checkXoaLoai"));
					session.removeAttribute("checkXoaLoai");
				}
			 if (session.getAttribute("checkMLSP") != null) {
					request.setAttribute("checkMLSP", (boolean) session.getAttribute("checkMLSP"));
					session.removeAttribute("checkMLSP");
				}
			 
			if (session.getAttribute("checkThemLoai") != null) {
				request.setAttribute("checkThemLoai", (boolean) session.getAttribute("checkThemLoai"));
				session.removeAttribute("checkThemLoai");
			}
			request.setAttribute("dsloai" , lbo.getloaisp());
			RequestDispatcher rd = 
					request.getRequestDispatcher("Adminsploai.jsp");
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
