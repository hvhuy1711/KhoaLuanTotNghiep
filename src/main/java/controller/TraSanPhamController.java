package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DonHangDaDatBean;
import bo.DonHangDaDatBo;

/**
 * Servlet implementation class TraSanPhamController
 */
@WebServlet("/TraSanPhamController")
public class TraSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraSanPhamController() {
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
			String maDanhGia = request.getParameter("maDanhGia");
			int ma= Integer.parseInt(maDanhGia);
			DonHangDaDatBo dh = new DonHangDaDatBo();
			DonHangDaDatBean dsspma = dh.getDHDDDanhGia(ma);
			request.setAttribute("dsspma", dsspma);
			RequestDispatcher rd = 
					request.getRequestDispatcher("TraHang.jsp");
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
