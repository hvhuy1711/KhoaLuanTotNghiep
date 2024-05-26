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
import bean.giospbean;
import bean.khachhangthibean;
import bo.KichThuocBo;
import bo.giospbo;

/**
 * Servlet implementation class capNhatSizeController
 */
@WebServlet("/capNhatSizeController")
public class capNhatSizeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public capNhatSizeController() {
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
			String kichthuocsp = request.getParameter("kichthuocsp");
			String tensp = request.getParameter("tensp");
			String maspsize = request.getParameter("maspsize");
			KichThuocBo ktbo = new KichThuocBo();
			int maspsizeInt = Integer.parseInt(maspsize);
			ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(maspsizeInt);
			request.setAttribute("dskt", (ArrayList<KichThuocBean>)dskt);
			request.setAttribute("tensp", tensp);
			request.setAttribute("kichthuocsp", kichthuocsp);
			RequestDispatcher rd = request.getRequestDispatcher("giospcontroller");
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
