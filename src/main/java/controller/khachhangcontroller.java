package controller;

import java.io.IOException;
import java.util.ArrayList;
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
import utilEmail.Email;
import utilEmail.MaHoaMk;

/**
 * Servlet implementation class khachhangcontroller
 */
@WebServlet("/khachhangcontroller")
public class khachhangcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public khachhangcontroller() {
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
			// Xử lí đăng nhập
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			// Neu khong phai chay lan dau thi:
			HttpSession session = request.getSession();
			khachhangbo khbo = new khachhangbo();
			String btndn = request.getParameter("btndn");
			if(btndn != null) {
			String username = request.getParameter("txtun");
			String password = request.getParameter("txtpass");
			khachhangthibean khbean;

//			boolean check;
			if (username != null && password != null) {
				password = MaHoaMk.toSHA1(password);
				khbean = khbo.dntk(username, password);
				if(khbean != null) {
//				if (khbean != null && khbean.isQuyen() == true) {
//					session.setAttribute("dnadmin", khbean.getHoTen());
//					response.sendRedirect("adminloaispcontroller");
//					return;
//				} else if (khbean != null && khbean.isQuyen() == false) {
//							session.setAttribute("dn2", khbean);
	//							session.setAttribute("dn3", khbean);
						session.setAttribute("dn", khbean);
						boolean check = true;
						session.setAttribute("checkdangnhap", (boolean) check);
						response.sendRedirect("sanphamcontroller");
						return;
					} else {
						response.sendRedirect("sanphamcontroller?kt=1");
						boolean check = false;
						session.setAttribute("checkdangnhap", (boolean) check);
						return;
					}
				}
			}

			// Xử lí đăng kí
			String btndk = request.getParameter("btndk");
			if(btndk != null) {
			String ht = request.getParameter("txtht");
			String diachi = request.getParameter("txtdc");
			String sodt = request.getParameter("txtsdt");
			String email = request.getParameter("txtemail");
			String usernamedk = request.getParameter("txtun");
			String pass1 = request.getParameter("txtpass1");
			String pass2 = request.getParameter("txtpass2");
			boolean checkMail = Email.sendEmail(email, "Kiểm tra đăng kí", "Kiểm tra đăng kí!! ");

			// Kiểm tra số điện thoại
			if (!isValidPhoneNumber(sodt)) {
			    session.setAttribute("checkSoDt", true);
			    response.sendRedirect("sanphamcontroller");
			    return;
			}

			// Kiểm tra email và kết quả gửi email
			if (!isValidVietnameseEmail(email) || !checkMail) {
			    session.setAttribute("checkEmail", true);
			    response.sendRedirect("sanphamcontroller");
			    return;
			}

			// Kiểm tra các trường nhập vào và mật khẩu
			if (ht == null || diachi == null || sodt == null || email == null || usernamedk == null || pass1 == null || pass2 == null || !pass1.equals(pass2)) {
			    session.setAttribute("checkDKMK", false);
			    response.sendRedirect("sanphamcontroller");
			    return;
			}

			// Kiểm tra tên đăng nhập
			ArrayList<String> dsTenDN = khbo.getTenDN();
			if (dsTenDN == null || dsTenDN.contains(usernamedk)) {
			    session.setAttribute("checkTenDN", false);
			    response.sendRedirect("sanphamcontroller");
			    return;
			}

			// Tạo tài khoản nếu tất cả các điều kiện đều thỏa mãn
			pass1 = MaHoaMk.toSHA1(pass1); 
			khbo.dktk(ht, diachi, sodt, email, usernamedk, pass1, false, null);
			session.setAttribute("checkDK", true);
			}

			RequestDispatcher rd = request.getRequestDispatcher("sanphamcontroller");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// sử lí check số điện thoại
	private boolean isValidPhoneNumber(String phoneNumber) {
		String phoneRegex = constClass.PHONE_REGEX;
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

	public static boolean isValidPassword(String password) {
		String matKhauRegex = constClass.PASSWORD_REGEX;
		Pattern pattern = Pattern.compile(matKhauRegex);
		Matcher matcher = pattern.matcher(password);
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
