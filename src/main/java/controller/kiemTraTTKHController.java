package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giospbean;
import bean.khachhangthibean;
import bo.giospbo;

/**
 * Servlet implementation class kiemTraTTKHController
 */
@WebServlet("/kiemTraTTKHController")
public class kiemTraTTKHController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kiemTraTTKHController() {
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
			String btnMua1SP = request.getParameter("btnMua1SP");
			String btnDatMua = request.getParameter("btnDatMua");
			String KichThuoc = request.getParameter("KichThuoc");
			String maSPMUA = request.getParameter("maSPMUA");
			String tenSPMUA = request.getParameter("tenSPMUA");
			String slMua = request.getParameter("slMua");
//			String KichThuoc = request.getParameter("KichThuoc");
//			 if(btnDatMua != null) {
//				 HttpSession session = request.getSession();
//					khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
//						long makh = kh.getMaKhachHang(); 
//						giospbo gh = new giospbo();
//						ArrayList<giospbean> dsgiokh = gh.getdsgio(makh);
//							if (dsgiokh != null) {
//								session.setAttribute("dsgio", dsgiokh);
//							}
//			 }
			//xử lí mới
//			String btnMuaChon = request.getParameter("btnMuaChon");
//			if (btnMuaChon != null) {
//			    // Lấy danh sách giỏ hàng của khách hàng từ đối tượng `gh`
//
//			    // Tạo một tập hợp để lưu trữ các mã sản phẩm và kích thước đã chọn từ form
//			    Set<String> selectedProducts = new HashSet<>();
//			    Enumeration<String> parameterNames = request.getParameterNames();
//			    while (parameterNames.hasMoreElements()) {
//			        String name = parameterNames.nextElement();
//			        String value = request.getParameter(name);
//			        if (value.equals("on")) {
//			            selectedProducts.add(name); // Thêm mã sản phẩm đã chọn vào tập hợp
//			        }
//			    } 
//			    request.setAttribute("selectedProducts", selectedProducts);		    
//			}
			
			HttpSession session = request.getSession();
			khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
				if (session.getAttribute("maSPMUA") != null && (String)session.getAttribute("KichThuoc") != null) {
					int maSPMUAInt = Integer.parseInt((String)session.getAttribute("maSPMUA"));
					String KichThuoc1 = (String)session.getAttribute("KichThuoc");
					giospbo gh = new giospbo();
					ArrayList<giospbean> dsgiott = gh.getdsgio1SP(makh, maSPMUAInt ,KichThuoc1);
					if (dsgiott != null) {
						request.setAttribute("dsgio", dsgiott);
						
					}
					session.removeAttribute("KichThuoc");
					session.removeAttribute("maSPMUA");
				}else {
					int maSPMUAInt = Integer.parseInt(maSPMUA);
					giospbo gh = new giospbo();
					ArrayList<giospbean> dsgiott = gh.getdsgio1SP(makh, maSPMUAInt ,KichThuoc);
					if (dsgiott != null) {
						request.setAttribute("dsgio", dsgiott);
					}
				}
			
//			
//				HttpSession session = request.getSession();
//				khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
//					long makh = kh.getMaKhachHang();
//					int maSPMUAInt = Integer.parseInt(maSPMUA);
//					giospbo gh = new giospbo();
//					ArrayList<giospbean> dsgiott = gh.getdsgio1SP(makh, maSPMUAInt ,KichThuoc);
//						if (dsgiott != null) {
//							request.setAttribute("dsgio", dsgiott);
//						}
//					request.setAttribute("dn", kh);
					RequestDispatcher rd = 
							request.getRequestDispatcher("kiemTraTTKH.jsp");
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