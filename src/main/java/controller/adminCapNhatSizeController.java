package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.KichThuocBean;
import bean.loaispbean;
import bean.sanphamfullbean;
import bo.KichThuocBo;
import bo.loaispbo;
import bo.sanphambo;

/**
 * Servlet implementation class adminCapNhatSizeController
 */
@WebServlet("/adminCapNhatSizeController")
public class adminCapNhatSizeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminCapNhatSizeController() {
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
			String maspchon = request.getParameter("msp");
			request.setAttribute("maspchon", maspchon);
			KichThuocBo ktbo = new KichThuocBo();
			int maspchonInt = Integer.parseInt(maspchon);
			ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(maspchonInt);
			request.setAttribute("dskichthuoc", dskt);
			sanphambo sbo = new sanphambo();
			ArrayList<sanphamfullbean> ds = sbo.getsanpham();
			request.setAttribute("dssanpham", ds);
			loaispbo loai = new loaispbo();
			ArrayList<loaispbean> dsloai = loai.getloaisp();
			request.setAttribute("dsloai", dsloai);

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
