package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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

import bo.sanphambo;

/**
 * Servlet implementation class adminCapNhatSanPhamController
 */
@WebServlet("/adminCapNhatSanPhamController")
public class adminCapNhatSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminCapNhatSanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		try {
		    request.setCharacterEncoding("utf-8");
		    response.setCharacterEncoding("utf-8");
		    String masanpham = null;
		    String tensanpham = null;
		    String gianhap = null;
		    String giacu = null;
		    String giamoi = null;
		    String anh = null;
		    String maloai = null;
		    String hang = null;
		    String mota = null;
		    List<FileItem> fileItems = upload.parseRequest(request);
		    for (FileItem fileItem : fileItems) {
		        if (!fileItem.isFormField()) {
		            String nameimg = fileItem.getName();
		            if (!nameimg.equals("")) {
		                // Lấy đường dẫn hiện tại, chú ý xử lý trên dirUrl để có đường dẫn đúng
		                String dirUrl = request.getServletContext().getRealPath("") + File.separator + "baithijava";
		                File dir = new File(dirUrl);
		                if (!dir.exists()) {// Nếu không có thư mục thì tạo ra
		                    dir.mkdir();
		                }
		                String fileImg = dirUrl + File.separator + nameimg;
		                File file = new File(fileImg);// Tạo file
		                try {
		                    fileItem.write(file);// Lưu file
		                    anh = "baithijava/" + nameimg;
		                } catch (Exception e) {
		                    e.printStackTrace();
		                }
		            }
		        } else {
		            String fieldName = fileItem.getFieldName();
		            String value = fileItem.getString("UTF-8");
		            if (fieldName.equals("masanpham")) {
		                masanpham = value;
		            } else if (fieldName.equals("tensanpham")) {
		                tensanpham = value;
		            } else if (fieldName.equals("gianhap")) {
		            	gianhap = value;
		            } else if (fieldName.equals("giacu")) {
		                giacu = value;
		            } else if (fieldName.equals("giamoi")) {
		                giamoi = value;
		            } else if (fieldName.equals("maloai")) {
		                maloai = value;
		            } else if (fieldName.equals("hang")) {
		                hang = value;
		            } else if (fieldName.equals("mota")) {
		                mota = value;
		            }
		        }
		    }
		    // Chuyển đổi giá trị giá cũ và giá mới từ chuỗi sang số
		    long giacu1 = Long.parseLong(giacu);
		    long giamoi1 = Long.parseLong(giamoi);
		    long gianhap1 = Long.parseLong(gianhap);
		    sanphambo sbo = new sanphambo();
		    sbo.Suasp(masanpham, tensanpham,gianhap1, giacu1, giamoi1, anh, hang, maloai, mota);
		    HttpSession session = request.getSession();
		    boolean checkCN = true;
		    session.setAttribute("checkCN", checkCN);
		    response.sendRedirect("adminsanphamcontroller");
		    return;
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
