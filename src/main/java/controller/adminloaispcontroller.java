package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaispbean;
import bean.sanphamfullbean;
import bo.loaispbo;
import bo.sanphambo;

/**
 * Servlet implementation class adminloaispcontroller
 */
@WebServlet("/adminloaispcontroller")
public class adminloaispcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminloaispcontroller() {
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
			loaispbo lbo = new loaispbo();
			String tab = request.getParameter("tab");
			String ml = request.getParameter("txtmaloai");
			String mlxoa = request.getParameter("mlxoa");
			String tenloai = request.getParameter("txttenloai");
			HttpSession session = request.getSession();
			String key = request.getParameter("key");
			ArrayList<loaispbean> ds = lbo.getloaisp();
			ArrayList<loaispbean> searchResults = new ArrayList<loaispbean>();
			if (key != null && !key.isEmpty()) {
			    for (loaispbean sp : ds) {
			        if (sp.getTenLoai().toLowerCase().contains(key.toLowerCase())) {
			            searchResults.add(sp);
			        }
			    }
			} else {
			    searchResults = ds;
			}
			int page = 1;
            int recordsPerPage = 10;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            int totalRecords = searchResults.size();
            int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

            int start = (page - 1) * recordsPerPage;
            int end = Math.min(start + recordsPerPage, totalRecords);
            ArrayList<loaispbean> dsPage = new ArrayList<>(searchResults.subList(start, end));
//            request.setAttribute("dsloai" , searchResults);
            request.setAttribute("dsloai", dsPage);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
			if(request.getParameter("butadd") != null) {
				ArrayList<String> dsDM = lbo.getTenDanhMuc();
				if (dsDM == null || dsDM.contains(tenloai)) {
				    session.setAttribute("checkThemLoai", false);
				}else {
					lbo.ThemspLoai( tenloai);
					session.setAttribute("checkThemLoai", true);
				}
			
			}
			if (tab != null && tab.equals("xoa")) {
				sanphambo sbo = new sanphambo();
				sanphamfullbean dssp = sbo.get1sanphamMaLoai(mlxoa);
				if(dssp != null) {
					boolean checkMLSP = true;
					session.setAttribute("checkMLSP",  checkMLSP);
				}else {
					int mlxoaInt = Integer.parseInt(mlxoa);
					lbo.XoaspLoai(mlxoaInt);
					boolean checkXoaLoai = true;
					session.setAttribute("checkXoaLoai", (boolean) checkXoaLoai);
				}
			}
			 
			 if (session.getAttribute("checkXoaLoai") != null) {
					request.setAttribute("checkXoaLoai", (boolean) session.getAttribute("checkXoaLoai"));
					session.removeAttribute("checkXoaLoai");
				}
			 if (session.getAttribute("checkMLSP") != null) {
					request.setAttribute("checkMLSP", (boolean) session.getAttribute("checkMLSP"));
					session.removeAttribute("checkMLSP");
				}
			 
			if (session.getAttribute("checkThemLoai") != null) {
				request.setAttribute("checkThemLoai", (boolean) session.getAttribute("checkThemLoai"));
				session.removeAttribute("checkThemLoai");
			}
			
			RequestDispatcher rd = 
					request.getRequestDispatcher("Adminsploai.jsp");
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
