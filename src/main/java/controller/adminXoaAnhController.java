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

import bean.AnhBean;
import bo.AnhBo;

/**
 * Servlet implementation class adminXoaAnhController
 */
@WebServlet("/adminXoaAnhController")
public class adminXoaAnhController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminXoaAnhController() {
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
		    String btnxoa = request.getParameter("btnxoa");
		    String maspxoa = request.getParameter("maspxoa");
		    HttpSession session = request.getSession();
		    AnhBo abo = new AnhBo();
		    if (btnxoa != null) {
		        //xử lí xóa chọn ảnh
		        Set<String> selectedProducts = new HashSet<>();
		        Enumeration<String> parameterNames = request.getParameterNames();
		        while (parameterNames.hasMoreElements()) {
		            String name = parameterNames.nextElement();
		            String value = request.getParameter(name);
		            if (value.equals("on")) {
		                selectedProducts.add(name); // Thêm mã sản phẩm đã chọn vào tập hợp
		            }
		        }
		        
		        // Kiểm tra xem có checkbox nào được chọn không
		        if (selectedProducts.isEmpty()) {
		        	 boolean checkXoaCheckBox = false;
		                session.setAttribute("checkXoaCheckBox", (boolean) checkXoaCheckBox);
		        } else {
		        	  int maspInt = Integer.parseInt(maspxoa);
			            ArrayList<AnhBean> dsAnh = abo.getdsAnh(maspInt);
		            // Duyệt qua danh sách ảnh để xử lý xóa ảnh đã chọn
		            for (AnhBean item : dsAnh) {
		                int AnhId = item.getMaAnh();
		                String AnhIdString = String.valueOf(AnhId);
		                String productKey = AnhIdString;

		                // Kiểm tra xem ảnh có trong danh sách cần xóa không
		                if (selectedProducts.contains(productKey)) {
		                    abo.XoaAnhChon(AnhId); // Xóa ảnh từ danh sách
		                    selectedProducts.remove(productKey); // Xóa khỏi danh sách đã chọn để không xóa lại lần sau
		                }
		            }
	                boolean checkXoaChonAnh = true;
	                session.setAttribute("checkXoaChonAnh", (boolean) checkXoaChonAnh);
	                request.setAttribute("dsAnh", dsAnh);
		        }
		    }

            
            session.setAttribute("masp", maspxoa);
            RequestDispatcher rd = 
					request.getRequestDispatcher("adminThemAnhController");
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
