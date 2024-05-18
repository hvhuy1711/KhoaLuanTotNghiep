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
import bean.DanhGiaBean;
import bean.KichThuocBean;
import bean.khachhangthibean;
import bean.loaispbean;
import bean.sanphamfullbean;
import bo.AnhBo;
import bo.KichThuocBo;
import bo.khachhangbo;
import bo.loaispbo;
import bo.sanphambo;
import dao.DanhGiaDao;

/**
 * Servlet implementation class chitietsanphamcontroller
 */
@WebServlet("/chitietsanphamcontroller")
public class chitietsanphamcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public chitietsanphamcontroller() {
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
			String ctsp = request.getParameter("ctsp");
			String maloai = request.getParameter("maloai");
			HttpSession session = request.getSession();
			if (session.getAttribute("ctsp") != null && session.getAttribute("maloai") !=null) {
				String ctspss = (String)session.getAttribute("ctsp");
				sanphambo spbo = new sanphambo();
				sanphamfullbean spbean = spbo.get1sanpham(ctspss);
				int ctspint = Integer.parseInt(ctspss);
				DanhGiaDao dg= new DanhGiaDao();
				int maloaiInt = Integer.parseInt(maloai);
				ArrayList<sanphamfullbean> dsspTM = spbo.getSanPhamTM(maloaiInt);
				ArrayList<DanhGiaBean> dsdg =  dg.GetDsDanhGia(ctspint);
				request.setAttribute("dsdg", dsdg);
				KichThuocBo ktbo = new KichThuocBo();
				khachhangbo khbo = new khachhangbo();
				ArrayList<khachhangthibean> dskh = khbo.htkhachhang();
				AnhBo anhbo = new AnhBo();
				request.setAttribute("dsAnh", (ArrayList<AnhBean>)anhbo.getdsAnh(ctspint));
				request.setAttribute("dskh", dskh);
				ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(ctspint);
				request.setAttribute("dsspTM", dsspTM);
				request.setAttribute("dskt", dskt);
				request.setAttribute("ctsp", spbean);
				session.removeAttribute("ctsp");
				session.removeAttribute("maloai");
			} else {
				if (ctsp != null) {
					sanphambo spbo = new sanphambo();
					sanphamfullbean spbean = spbo.get1sanpham(ctsp);
					int ctspint = Integer.parseInt(ctsp);
					KichThuocBo ktbo = new KichThuocBo();
					ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(ctspint);
					DanhGiaDao dg= new DanhGiaDao();
					ArrayList<DanhGiaBean> dsdg =  dg.GetDsDanhGia(ctspint);
					int maloaiInt = Integer.parseInt(maloai);
					ArrayList<sanphamfullbean> dsspTM = spbo.getSanPhamTM(maloaiInt);
					khachhangbo khbo = new khachhangbo();
					ArrayList<khachhangthibean> dskh = khbo.htkhachhang();
					AnhBo anhbo = new AnhBo();
					request.setAttribute("dsAnh", (ArrayList<AnhBean>)anhbo.getdsAnh(ctspint));
					request.setAttribute("dskh", dskh);
					request.setAttribute("dsdg", dsdg);
					request.setAttribute("dsspTM", dsspTM);
					request.setAttribute("dskt", dskt);
					request.setAttribute("ctsp", spbean);
				}
			}
//			DanhGiaDao dg= new DanhGiaDao();
			
			
			if (session.getAttribute("checkDanhGia") != null) {
				request.setAttribute("checkDanhGia", (boolean) session.getAttribute("checkDanhGia"));
				session.removeAttribute("checkDanhGia");
			}
			RequestDispatcher rd = request.getRequestDispatcher("ChiTietSanPham.jsp");
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
