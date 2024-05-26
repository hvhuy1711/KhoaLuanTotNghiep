package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.EmailCheckBean;
import bo.EmailCheckBo;
import bo.khachhangbo;
import utilEmail.MaHoaMk;

/**
 * Servlet implementation class XacNhanMaController
 */
@WebServlet("/XacNhanMaController")
public class XacNhanMaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XacNhanMaController() {
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
			HttpSession session = request.getSession();
			String code = request.getParameter("code");
			EmailCheckBo ebo = new EmailCheckBo();
			ArrayList<EmailCheckBean> dsCode = ebo.getMaMail();
			if(dsCode != null) {
				for(EmailCheckBean e :dsCode) {
					if(code.equals(e.getKey())) {
						String ht = (String)session.getAttribute("ht");
						String sodt =(String)session.getAttribute("sodt");
						String email = (String)session.getAttribute("email");
						String diachi = (String)session.getAttribute("diachi");
						String usernamedk = (String)session.getAttribute("usernamedk");
						String pass1 = (String)session.getAttribute("pass1");
						pass1 = MaHoaMk.toSHA1(pass1); 
						khachhangbo khbo = new khachhangbo();
						khbo.dktk(ht, diachi, sodt, email, usernamedk, pass1, false, null);
						session.removeAttribute(ht);
						session.removeAttribute(sodt);
						session.removeAttribute(email);
						session.removeAttribute(diachi);
						session.removeAttribute(usernamedk);
						session.removeAttribute(pass1);
						session.setAttribute("checkDK", true);
						session.setAttribute("checkEmail", true);
						ebo.DeleteKey();
					    response.sendRedirect("sanphamcontroller");
					    return;
					}else {
						ebo.DeleteKey();
						session.setAttribute("checkEmail", false);
						response.sendRedirect("sanphamcontroller");
						return;
					}
				}
			}
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
