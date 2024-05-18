package GoogleLogin;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

import GoogleLogin.UserGoogleBto;
import bean.khachhangthibean;
import bo.LoginBo;
import bo.khachhangbo;

/**
 * @author heaty566
 */
@WebServlet(urlPatterns = { "/LoginGoogleHander" })
public class LoginGoogleHander extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 * 
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
//		System.out.println(code);
		String accessToken = getToken(code);
		UserGoogleBto user = getUserInfo(accessToken);
//		System.out.println(user);
//		UserGoogleBto u = new UserGoogleBto();
		khachhangbo khbo = new khachhangbo();
		HttpSession session = request.getSession();
		khachhangthibean dngg;
		try {
			boolean ktggID;
			ktggID = khbo.ktggID(user.getId());
			if (ktggID) {
				dngg = khbo.dntkGG(user.getEmail(), user.getId(), 0);
				session.setAttribute("dn",(khachhangthibean) dngg);
				//cho đăng nhập vào
			} else {
				int khdn = khbo.DNGG(user.getName(), user.getEmail(), user.getId());
				dngg = khbo.dntkGG(user.getEmail(), user.getId() , 0);
				session.setAttribute("dn",(khachhangthibean) dngg);
				
			}
			// thêm sử lí đăng nhập chỉ cho 1 lần
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static String getToken(String code) throws ClientProtocolException, IOException {
		// call api to get token
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();
		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}

	public static UserGoogleBto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();
		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

		// Kiểm tra xem email có tồn tại trước khi truy cập
		String email = jobj.has("email") ? jobj.get("email").toString().replaceAll("\"", "") : null;

		UserGoogleBto googlePojo = new Gson().fromJson(response, UserGoogleBto.class);
		googlePojo.setEmail(email); // Đặt email sau khi kiểm tra tồn tại
		return googlePojo;

	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

		RequestDispatcher rd = request.getRequestDispatcher("sanphamcontroller");
		rd.forward(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 * 
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 * 
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}

}
