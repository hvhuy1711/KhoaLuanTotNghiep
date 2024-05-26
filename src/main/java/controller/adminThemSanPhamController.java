package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.sanphambo;

/**
 * Servlet implementation class adminThemSanPhamController
 */
@WebServlet("/adminThemSanPhamController")
public class adminThemSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminThemSanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			//Thêm sản phẩm , upload file
//				String masanpham = null ; 
				String tensanpham = null;
				String gianhap = null;
				String giacu = null;
				String giamoi = null;
				String anh = null;
				String maloai = null;
				String hang = null;
				String ngaynhap = null;
				String mota = null;
				List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
				//duyệt qua các đối tượng gửi lên từ client gồm file và các control
				for (FileItem fileItem : fileItems) {
					if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
						// xử lý file
						String nameimg = fileItem.getName();
						if (!nameimg.equals("")) {
					   //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
							String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "baithijava";
							File dir = new File(dirUrl);
							if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);//tạo file
							try {
								fileItem.write(file);//lưu file
								anh = "baithijava/" + nameimg;
							} catch (Exception e) {
							    e.printStackTrace();
							}
						}
					 }else//Neu la control
					 {
						String tentk=fileItem.getFieldName();
						if(tentk.equals("tensanpham")) {
							tensanpham = fileItem.getString("UTF-8");
						} 
						if(tentk.equals("gianhap")) {
							gianhap = fileItem.getString("UTF-8");
						}
						if(tentk.equals("giacu")) {
							giacu = fileItem.getString("UTF-8");
						}
						if(tentk.equals("giamoi")) {
							giamoi = fileItem.getString("UTF-8");
						}
						if(tentk.equals("maloai")) {
							maloai = fileItem.getString("UTF-8");
						}
						if(tentk.equals("hang")) {
							hang = fileItem.getString("UTF-8");
						}
						
						 if(tentk.equals("mota")) { 
							 mota = fileItem.getString("UTF-8"); 
						 }
					}
				}
				HttpSession session = request.getSession();
				long giacu1 = Long.parseLong(giacu);
				long giamoi1 = Long.parseLong(giamoi);
				long gianhap1 = Long.parseLong(gianhap);
				sanphambo sbo = new sanphambo();
				sbo.getsanpham();
				ArrayList<String> dsSP = sbo.getTenSanPham();
				if(dsSP == null || dsSP.contains(tensanpham)) {
					session.setAttribute("checkThemSP", false);
				}else {						
				
					sbo.Themsp(tensanpham, gianhap1, giacu1, giamoi1, anh, hang, maloai, mota);
					session.setAttribute("checkThemSP", true);
				}
				response.sendRedirect("adminsanphamcontroller");
				return;
				
		} catch (Exception e) {
			// TODO: handle exception
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
