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

import bean.DonHangDaDatBean;
import bean.giospbean;
import bean.khachhangthibean;
import bean.loaispbean;
import bo.DonHangDaDatBo;
import bo.giospbo;
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
			String makh = request.getParameter("makh");
			HttpSession session = request.getSession();
			khachhangbo khbo = new khachhangbo();
			if (makh != null) {
			    int makhInt = Integer.parseInt(makh);
			    giospbo giobo = new giospbo();
			    ArrayList<giospbean> dsgio = giobo.getAlldsgio();

			    boolean hasItemsInCart = false;
			    if (dsgio != null) {
			        for (giospbean ds : dsgio) {
			            if (ds.getMaKhachHang() == makhInt) {
			                hasItemsInCart = true;
			                break; // Không cần kiểm tra thêm, chỉ cần biết khách hàng có giỏ hàng là đủ
			            }
			        }
			    }

			    DonHangDaDatBo dhbo = new DonHangDaDatBo();
			    ArrayList<DonHangDaDatBean> dsdh = dhbo.getAllDHDD();

			    boolean hasOrders = false;
			    if (dsdh != null) {
			        for (DonHangDaDatBean ds : dsdh) {
			            if (ds.getMaKhachHang() == makhInt) {
			                hasOrders = true;
			                break; // Không cần kiểm tra thêm, chỉ cần biết khách hàng có đơn hàng là đủ
			            }
			        }
			    }

			    if (hasItemsInCart || hasOrders) {
			        session.setAttribute("checkXoaTK", false);
			    } else {
			        khbo.xoatk(makhInt);
			        session.setAttribute("checkXoaTK", true);
			    }
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
