package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.Session;
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

import bean.AnhBean;
import bean.KichThuocBean;
import bean.loaispbean;
import bean.sanphambean;
import bean.sanphamfullbean;
import bo.AnhBo;
import bo.KichThuocBo;
import bo.loaispbo;
import bo.sanphambo;

/**
 * Servlet implementation class adminsanphamcontroller
 */
@WebServlet("/adminsanphamcontroller")
public class adminsanphamcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminsanphamcontroller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			sanphambo sbo = new sanphambo();
			HttpSession session = request.getSession();
			// Xóa sản phẩm

			String tab = request.getParameter("tab");
			String maspxoa = request.getParameter("mspx");
			if (tab != null && tab.equals("xoa")) {
				int maInt = Integer.parseInt(maspxoa);
				AnhBo abo = new AnhBo();
				ArrayList<AnhBean> dsanh = abo.getdsAnh(maInt);
				KichThuocBo ktbo = new KichThuocBo();
				ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(maInt);
				if ( !dsanh.isEmpty() || !dskt.isEmpty() ) {
					session.setAttribute("checkXoaSP", true);
				} else {
					sbo.Xoasp(maspxoa);
					session.setAttribute("checkXoa", true);
				}
			}

			// Xử lí chọn
			if (tab != null && tab.equals("chon")) {
				String maspchon = request.getParameter("msp");
				String tenspchon = request.getParameter("tsp");
				String soluongchon = request.getParameter("sl");
				String giacuchon = request.getParameter("giacu");
				String giamoichon = request.getParameter("giamoi");
				String anhchon = request.getParameter("anh");
				String maloaichon = request.getParameter("maloai");
				String hangchon = request.getParameter("hang");
				String ngaynhapchon = request.getParameter("ngaynhap");
				String mota = request.getParameter("mota");
				request.setAttribute("masanpham", maspchon);
				request.setAttribute("tensanpham", tenspchon);
				request.setAttribute("soluong", soluongchon);
				request.setAttribute("giacu", giacuchon);
				request.setAttribute("giamoi", giamoichon);
				request.setAttribute("anh", anhchon);
				request.setAttribute("maloai", maloaichon);
				request.setAttribute("hang", hangchon);
				request.setAttribute("ngaynhap", ngaynhapchon);
				request.setAttribute("mota", mota);
			}
			
			// Xử lí cập nhật
			if (request.getParameter("butupdate") != null) {

				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
				try {
					request.setCharacterEncoding("utf-8");
					response.setCharacterEncoding("utf-8");
					// Thêm sản phẩm , upload file
					String masanpham = null;
					String tensanpham = null;
					String gianhap = null;
					String giacu = null;
					String giamoi = null;
					String anh = null;
					String maloai = null;
					String hang = null;
					String ngaynhap = null;
					String mota = null;
					List<FileItem> fileItems = upload.parseRequest(request);// Lấy về các đối tượng gửi lên
					// duyệt qua các đối tượng gửi lên từ client gồm file và các control
					for (FileItem fileItem : fileItems) {
						if (!fileItem.isFormField()) {// Nếu ko phải các control=>upfile lên
							// xử lý file
							String nameimg = fileItem.getName();
							if (!nameimg.equals("")) {
								// Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
								String dirUrl = request.getServletContext().getRealPath("") + File.separator
										+ "baithijava";
								File dir = new File(dirUrl);
								if (!dir.exists()) {// nếu ko có thư mục thì tạo ra
									dir.mkdir();
								}
								String fileImg = dirUrl + File.separator + nameimg;
								File file = new File(fileImg);// tạo file
								try {
									fileItem.write(file);// lưu file
									anh = "baithijava/" + nameimg;
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						} else// Neu la control
						{
							String tentk = fileItem.getFieldName();
							/*
							 * if (tentk.equals("masanpham")) { masanpham = fileItem.getString(); }
							 */
							if (tentk.equals("tensanpham")) {
								tensanpham = fileItem.getString();
							}
							if (tentk.equals("gianhap")) {
								gianhap = fileItem.getString();
							}
							if (tentk.equals("giacu")) {
								giacu = fileItem.getString();
							}
							if (tentk.equals("giamoi")) {
								giamoi = fileItem.getString();
							}
							if (tentk.equals("maloai")) {
								maloai = fileItem.getString();
							}
							if (tentk.equals("hang")) {
								hang = fileItem.getString();
							}
							if (tentk.equals("ngaynhap")) {
								ngaynhap = fileItem.getString();
							}
							if (tentk.equals("mota")) {
								mota = fileItem.getString();
							}
						}
					}
					loaispbo lbo = new loaispbo();
					int mlInt = Integer.parseInt(maloai);
					request.setAttribute("ds1loai", lbo.getloaispTheoMa(mlInt));
					request.setAttribute("maloai", maloai);
					long giamoi1 = Long.parseLong(giacu);
					long chieckhau1 = Long.parseLong(giamoi);
					long gianhap1 = Long.parseLong(gianhap);
					sbo.Suasp(masanpham, tensanpham, gianhap1, giamoi1, chieckhau1, anh, hang, maloai, mota);
					System.out.println("Sửa thành công");
					response.sendRedirect("adminsanphamcontroller");
					return;
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

			}
	
			loaispbo loai = new loaispbo();
			ArrayList<loaispbean> dsloai = loai.getloaisp();
			request.setAttribute("dsloai", dsloai);
			
			if (session.getAttribute("checkXoa") != null) {
				request.setAttribute("checkXoa", (boolean) session.getAttribute("checkXoa"));
				session.removeAttribute("checkXoa");
			}
			if (session.getAttribute("checkCN") != null) {
				request.setAttribute("checkCN", (boolean) session.getAttribute("checkCN"));
				session.removeAttribute("checkCN");
			}
			if (session.getAttribute("checkThem") != null) {
				request.setAttribute("checkThem", (boolean) session.getAttribute("checkThem"));
				session.removeAttribute("checkThem");
			}
			
			if (session.getAttribute("checkXoaSP") != null) {
				request.setAttribute("checkXoaSP", (boolean) session.getAttribute("checkXoaSP"));
				session.removeAttribute("checkXoaSP");
			}
			
			ArrayList<sanphamfullbean> ds = sbo.getsanpham();
			request.setAttribute("dssanpham", ds);
			RequestDispatcher rd = request.getRequestDispatcher("AdminThemSanPham.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
