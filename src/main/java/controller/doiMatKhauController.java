package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangthibean;
import bo.khachhangbo;
import utilEmail.MaHoaMk;

/**
 * Servlet implementation class doiMatKhauController
 */
@WebServlet("/doiMatKhauController")
public class doiMatKhauController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public doiMatKhauController() {
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
			String mk = request.getParameter("txtpasscu");
			String pass1 = request.getParameter("txtpass");
			String pass2 = request.getParameter("txtpass1");
			String btndoi = request.getParameter("btndoimk");

			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			long makhlong = kh.getMaKhachHang();
			khachhangbo khbo = new khachhangbo();
			if(btndoi != null) {
				String MHMk = MaHoaMk.toSHA1(mk); 
				if (!(MHMk.equals(kh.getMatKhau()))) {
					boolean checkMKSQL = false;
					session.setAttribute("checkMKSQL", (boolean)checkMKSQL);
					System.out.println("Bạn đã nhập sai mật khẩu");
				}else if (!(pass1.equals(pass2))){
					boolean checkTMK = false;
					session.setAttribute("checkTMK", (boolean)checkTMK);
					System.out.println("Bạn đã nhập sai mật khẩu nhập lại");
				} else {
					pass1 = MaHoaMk.toSHA1(pass1); 
					khbo.DoiPass(makhlong, pass1);
					boolean checkDoiTC = true;
					session.setAttribute("checkDoiTC", (boolean)checkDoiTC);
					session.removeAttribute("dn");
					khachhangthibean khnew = khbo.get1KhachHang(makhlong);
					session.setAttribute("dn", (khachhangthibean) khnew);
				}
				response.sendRedirect("ThongtinKhachHangController");
				return;
			}
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
