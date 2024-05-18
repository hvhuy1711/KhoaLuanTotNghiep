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

import bean.KichThuocBean;
import bean.loaispbean;
import bean.sanphamfullbean;
import bo.KichThuocBo;
import bo.loaispbo;
import bo.sanphambo;

/**
 * Servlet implementation class adminThemKichThuocController
 */
@WebServlet("/adminThemKichThuocController")
public class adminThemKichThuocController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminThemKichThuocController() {
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
			String masanpham = request.getParameter("masanpham");
			String tenkichthuoc = request.getParameter("tenkichthuoc");
			String soluongsize = request.getParameter("soluongsize");
			String btnThemKT = request.getParameter("btnThemKT");
			HttpSession session = request.getSession();
			int masanphamInt = Integer.parseInt(masanpham);
			if(btnThemKT != null) {
				int soluongsizeInt = Integer.parseInt(soluongsize);
				KichThuocBo kt = new KichThuocBo();
				kt.ThemKichThuoc(tenkichthuoc, masanphamInt, soluongsizeInt);
				boolean checkAddKT = true;
				session.setAttribute("checkAddKT", (boolean) checkAddKT);
			}
			request.setAttribute("maspchon", masanpham);
			KichThuocBo ktbo = new KichThuocBo();
			ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(masanphamInt);
			request.setAttribute("dskichthuoc", dskt);
			sanphambo sbo = new sanphambo();
			ArrayList<sanphamfullbean> ds = sbo.getsanpham();
			request.setAttribute("dssanpham", ds);
			loaispbo loai = new loaispbo();
			ArrayList<loaispbean> dsloai = loai.getloaisp();
			request.setAttribute("dsloai", dsloai);
		
			if (session.getAttribute("checkAddKT") != null) {
				request.setAttribute("checkAddKT", (boolean) session.getAttribute("checkAddKT"));
				session.removeAttribute("checkAddKT");
			}
			RequestDispatcher rd = request.getRequestDispatcher("AdminCapNhatSize.jsp");
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
