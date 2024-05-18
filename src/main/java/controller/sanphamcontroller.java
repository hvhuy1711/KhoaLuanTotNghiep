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
import bean.loaispbean;
import bean.sanphambean;
import bean.sanphamfullbean;
import bo.giospbo;
import bo.loaispbo;
import bo.sanphambo;

/**
 * Servlet implementation class sanphamcontroller
 */
@WebServlet("/sanphamcontroller")
public class sanphamcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public sanphamcontroller() {
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
			HttpSession session = request.getSession();
			sanphambo sbo = new sanphambo();
			ArrayList<String> dsHang = sbo.getHang();
			ArrayList<sanphamfullbean> ds = sbo.getsanpham();
			String ml = request.getParameter("ml");
			String key = request.getParameter("txttim");
			String hang = request.getParameter("tenhang");
			String minGia = request.getParameter("minGia");
			String maxGiasp = request.getParameter("maxGiasp");
			String btnLoc = request.getParameter("btnLoc");
			// Sai bo lam
			if (ml != null) {
			    ds = sbo.timMa(ml);
			    session.setAttribute("checkMLSP", true);
			} else if (key != null) {
			    ds = sbo.Tim(key);
			    session.setAttribute("checkKeySP", true);
			} else if (hang != null) {
			    ds = sbo.timHang(hang);
			    session.setAttribute("checkHang", true);
			} else if (btnLoc != null) {
			    ds = sbo.timGia(minGia, maxGiasp);
			    boolean checkGia = (ds != null);
			    session.setAttribute("checkGia", checkGia);
			}
//			System.out.println(sbo.maxGia());
			request.setAttribute("maxGia" ,sbo.maxGia());
			// else
			// ds = sbo.getsach();//Lay ve tat ca sach
			loaispbo lbo = new loaispbo();
			ArrayList<loaispbean> dsloai = lbo.getloaisp();
			// Chuyen ve htsach.jsp: ds va dsloai
			if (session.getAttribute("checkdangnhap") != null) {
				request.setAttribute("checkdangnhap", (boolean) session.getAttribute("checkdangnhap"));
				session.removeAttribute("checkdangnhap");
			}
			request.setAttribute("dssanpham", ds);
			request.setAttribute("dsloai", dsloai);
			request.setAttribute("dsHang", dsHang);
			giospbo gh = new giospbo();
//			HttpSession session2 = request.getSession();
			if (session.getAttribute("dn") != null) {
				khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
				if (kh != null) {
					ArrayList<giospbean> dsgiohang = gh.getdsgio(kh.getMaKhachHang());
					request.setAttribute("dsgio", (ArrayList<giospbean>) dsgiohang);
				}else {
					System.out.print("Không có khách hàng nào đăng nhập");
				}
			}else {
				System.out.println("Session đang rỗng");
			}
			//check đăng nhập
			if(session.getAttribute("checkDK") != null) {
				request.setAttribute("checkDK", (boolean)session.getAttribute("checkDK"));
				session.removeAttribute("checkDK");
			}
			if(session.getAttribute("checkDKMK") != null) {
				request.setAttribute("checkDKMK", (boolean)session.getAttribute("checkDKMK"));
				session.removeAttribute("checkDKMK");
			}
			if(session.getAttribute("checkTenDN") != null) {
				request.setAttribute("checkTenDN", (boolean)session.getAttribute("checkTenDN"));
				session.removeAttribute("checkTenDN");
			}
			//check lọc
			if(session.getAttribute("checkMLSP") != null) {
				request.setAttribute("checkMLSP", (boolean)session.getAttribute("checkMLSP"));
				session.removeAttribute("checkMLSP");
			}
			if(session.getAttribute("checkKeySP") != null) {
				request.setAttribute("checkKeySP", (boolean)session.getAttribute("checkKeySP"));
				session.removeAttribute("checkKeySP");
			}
			if(session.getAttribute("checkHang") != null) {
				request.setAttribute("checkHang", (boolean)session.getAttribute("checkHang"));
				session.removeAttribute("checkHang");
			}
			if(session.getAttribute("checkGia") != null) {
				request.setAttribute("checkGia", (boolean)session.getAttribute("checkGia"));
				session.removeAttribute("checkGia");
			}
			
			if(session.getAttribute("checkNull") != null) {
				request.setAttribute("checkNull", (boolean)session.getAttribute("checkNull"));
				session.removeAttribute("checkNull");
			}
			
			if (session.getAttribute("checkSoDt") != null) {
				request.setAttribute("checkSoDt", (boolean) session.getAttribute("checkSoDt"));
				session.removeAttribute("checkSoDt");
			}
			
			if (session.getAttribute("checkEmail") != null) {
				request.setAttribute("checkEmail", (boolean) session.getAttribute("checkEmail"));
				session.removeAttribute("checkEmail");
			}
			
			if (session.getAttribute("checkPass") != null) {
				request.setAttribute("checkPass", (boolean) session.getAttribute("checkPass"));
				session.removeAttribute("checkPass");
			}
			
			if (session.getAttribute("checkPass1") != null) {
				request.setAttribute("checkPass1", (boolean) session.getAttribute("checkPass1"));
				session.removeAttribute("checkPass1");
			}
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
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
