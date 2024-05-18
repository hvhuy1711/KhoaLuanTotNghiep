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
 * Servlet implementation class adminCNSizeController
 */
@WebServlet("/adminCNSizeController")
public class adminCNSizeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminCNSizeController() {
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
			String tenkichthuoc = request.getParameter("tenkichthuoc");
			String soluongsize = request.getParameter("soluongsize");
			String makichthuoc = request.getParameter("makichthuoc");
			String masanpham = request.getParameter("masanpham");
			String btnUpKT = request.getParameter("btnUpKT");
			String btnXoa = request.getParameter("btnXoa");
			//sử lí lại
//			String makichthuocxoa = request.getParameter("makichthuocxoa");
			HttpSession session = request.getSession();
			KichThuocBo kt = new KichThuocBo();
			int makichthuocInt = Integer.parseInt(makichthuoc);

			if(btnXoa != null) {
				kt.XoaKichThuoc(makichthuocInt);
				boolean checkXoaKt = true;
				session.setAttribute("checkXoaKt", (boolean) checkXoaKt);
			}
			
			if(btnUpKT != null) {
				int soluongsizeInt = Integer.parseInt(soluongsize);
				kt.UpdateKTSize(makichthuocInt, soluongsizeInt, tenkichthuoc);
				boolean checkUpSize = true;
				session.setAttribute("checkUpSize", (boolean) checkUpSize);
			}
//			System.out.println(masanpham);
			int masanphamInt = Integer.parseInt(masanpham);
			ArrayList<KichThuocBean> dskt = kt.dskichThuoc(masanphamInt);
			request.setAttribute("dskichthuoc", dskt);
			request.setAttribute("maspchon", masanpham);
			sanphambo sbo = new sanphambo();
			ArrayList<sanphamfullbean> ds = sbo.getsanpham();
			request.setAttribute("dssanpham", ds);
			loaispbo loai = new loaispbo();
			ArrayList<loaispbean> dsloai = loai.getloaisp();
			request.setAttribute("dsloai", dsloai);
		
			if (session.getAttribute("checkUpSize") != null) {
				request.setAttribute("checkUpSize", (boolean) session.getAttribute("checkUpSize"));
				session.removeAttribute("checkUpSize");
			}
			if (session.getAttribute("checkXoaKt") != null) {
				request.setAttribute("checkXoaKt", (boolean) session.getAttribute("checkXoaKt"));
				session.removeAttribute("checkXoaKt");
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
