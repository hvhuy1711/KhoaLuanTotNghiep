package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.AnhBean;
import bo.AnhBo;
import bo.sanphambo;

/**
 * Servlet implementation class adminThemAnhSPController
 */
@WebServlet("/adminThemAnhSPController")
public class adminThemAnhSPController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminThemAnhSPController() {
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
            String masp = null;
            String anh = null;

            List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
            //duyệt qua các đối tượng gửi lên từ client gồm file và các control
            for (FileItem fileItem : fileItems) {
                if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
                    // xử lý file
                    String nameimg = fileItem.getName();
                    if (!nameimg.equals("")) {
                        //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
                        String dirUrl = request.getServletContext().getRealPath("") + File.separator + "baithijava";
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
                } else//Neu la control
                {
                    String tentk = fileItem.getFieldName();
                    if (tentk.equals("masp")) {
                    	masp = fileItem.getString("UTF-8");
                    }

                }
            }
            sanphambo sbo = new sanphambo();
            sbo.getsanpham();
            AnhBo abo = new AnhBo();
            int maspInt = Integer.parseInt(masp);
            HttpSession session = request.getSession();
            abo.ThemAnh(maspInt, anh);
            session.setAttribute("masp", masp);
            System.out.println("thêm thành công");
            boolean checkThemAnh = true;
            session.setAttribute("checkThemAnh", (boolean) checkThemAnh);
            response.sendRedirect("adminThemAnhController");
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
