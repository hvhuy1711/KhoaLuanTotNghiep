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

import bean.khachhangthibean;
import bean.loaispbean;
import bo.khachhangbo;

/**
 * Servlet implementation class adminxoatkcontroller
 */
@WebServlet("/adminxoatkcontroller")
public class adminxoatkcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminxoatkcontroller() {
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
//			HttpSession session =request.getSession();
//			String khxoa = request.getParameter("khxoa");
			String makh = request.getParameter("makh");
			HttpSession session = request.getSession();
			khachhangbo khbo = new khachhangbo();
			if(makh != null) {
				int makhInt = Integer.parseInt(makh);
				khbo.xoatk(makhInt);
				boolean checkXoaTK= true;
				session.setAttribute("checkXoaTK", (boolean) checkXoaTK);
			}
			if (session.getAttribute("checkXoaTK") != null) {
				request.setAttribute("checkXoaTK", (boolean) session.getAttribute("checkXoaTK"));
				session.removeAttribute("checkXoaTK");
			}
			ArrayList<khachhangthibean> ds = khbo.htkhachhang();
			request.setAttribute("dskhachhang" , ds);
			RequestDispatcher rd = 
					request.getRequestDispatcher("adminxoatk.jsp");
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
