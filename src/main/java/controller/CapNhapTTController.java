package controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangthibean;
import bo.khachhangbo;
import consts.constClass;

/**
 * Servlet implementation class CapNhapTTController
 */
@WebServlet("/CapNhapTTController")
public class CapNhapTTController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CapNhapTTController() {
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
			String ht = request.getParameter("hoten");
			String soDt = request.getParameter("sodt");
			String Diachi = request.getParameter("diachi");
			String email = request.getParameter("email");
			String btnCapNhap = request.getParameter("btnsua");
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			khachhangbo khbo = new khachhangbo();
			if (btnCapNhap != null) {
			    if (email == null) {
			        khbo.UpdateTTKH(makh, ht, soDt, Diachi);
			        session.setAttribute("checkUpdate", true);
			        session.removeAttribute("dn");
			        khachhangthibean khnew = khbo.get1KhachHang(makh);
			        session.setAttribute("dn", khnew);
			        response.sendRedirect("ThongtinKhachHangController");
			        return;
			    } else {
			        if (!isValidVietnameseEmail(email)) {
			            session.setAttribute("checkEmail", true);
			            response.sendRedirect("ThongtinKhachHangController"); // Thêm dòng này để quay lại trang thông tin khách hàng
			            return;
			        }
			        if (!isValidPhoneNumber(soDt)) {
			            session.setAttribute("checkSoDt", true);
			            response.sendRedirect("ThongtinKhachHangController"); // Thêm dòng này để quay lại trang thông tin khách hàng
			            return;
			        }
			        khbo.UpdateTTKHEmail(makh, ht, soDt, Diachi, email);
			        session.setAttribute("checkUpdate", true);
			        session.removeAttribute("dn");
			        khachhangthibean khnew = khbo.get1KhachHang(makh);
			        session.setAttribute("dn", khnew);
			        response.sendRedirect("ThongtinKhachHangController");
			        return;
			    }
			}

			if (session.getAttribute("checkEmail") != null) {
				request.setAttribute("checkEmail", (boolean) session.getAttribute("checkEmail"));
				session.removeAttribute("checkEmail");
			}
			
			if (session.getAttribute("checkSoDt") != null) {
				request.setAttribute("checkSoDt", (boolean) session.getAttribute("checkSoDt"));
				session.removeAttribute("checkSoDt");
			}
			RequestDispatcher rd = request.getRequestDispatcher("ThongTinCaNhan.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 private boolean isValidPhoneNumber(String phoneNumber) {
	        String phoneRegex =  constClass.PHONE_REGEX; 
	        Pattern pattern = Pattern.compile(phoneRegex);
	        Matcher matcher = pattern.matcher(phoneNumber);
	        return matcher.matches();
	    }
	 
	 private boolean isValidVietnameseEmail(String email) {
	        String emailRegex = constClass.EMAIL_REGEX; 
	        Pattern pattern = Pattern.compile(emailRegex);
	        Matcher matcher = pattern.matcher(email);
	        return matcher.matches();
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
