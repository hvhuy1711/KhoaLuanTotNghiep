package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

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
import bean.loaispbean;
import bean.sanphamfullbean;
import bo.KichThuocBo;
import bo.giospbo;
import bo.loaispbo;
import bo.sanphambo;

/**
 * Servlet implementation class giospcontroller
 */
@WebServlet("/giospcontroller")
public class giospcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public giospcontroller() {
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
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");

			String ms = request.getParameter("ms");
			String ts = request.getParameter("ts");
			String anh = request.getParameter("anh");
			String giamoi = request.getParameter("giamoi");
			String sl = request.getParameter("sl");
			String mkh = request.getParameter("mkh");

			String masp = request.getParameter("masp");
			String slm = request.getParameter("soluong");

			giospbo gh = new giospbo();

			// thêm sản phâm

			String btnThem = request.getParameter("btnThem");
			String themGio = request.getParameter("themGio1");
			if (btnThem != null) {
				long makh = Long.parseLong(mkh);
				HttpSession session = request.getSession();
				ArrayList<giospbean> dsgio = gh.getdsgio(makh);
				int msint = Integer.parseInt(ms);
				for (giospbean ds : dsgio) {
					if (msint == ds.getMaSanPham()) {
						if (!themGio.equals(ds.getGhiChu())) {
							int gl = Integer.parseInt(giamoi);
							int sll = Integer.parseInt(sl);
							int DonGia = gl * sll;
							gh.ThemSpGio(Integer.parseInt(mkh), msint, sll, DonGia, themGio);
							boolean checkThemML = true;
							session.setAttribute("checkThemML", (boolean) checkThemML);
							response.sendRedirect("giospcontroller");
							return;
						} else {
							gh.UpdateSLGio(ds.getSoLuongMua() + 1, ds.getMaGioHang());
							boolean checkUpdate = true;
							session.setAttribute("checkUpdate", (boolean) checkUpdate);
							response.sendRedirect("giospcontroller");
							return;
						}
					}
				}
				int gl = Integer.parseInt(giamoi);
				int sll = Integer.parseInt(sl);
				int DonGia = gl * sll;
				int check = gh.ThemSpGio(Integer.parseInt(mkh), msint, sll, DonGia, themGio);
				System.out.println(check);
				if (check == 1) {
					boolean checkThem = true;
					session.setAttribute("checkThem", (boolean) checkThem);
					response.sendRedirect("giospcontroller");
					return;
				}
			}
			
			HttpSession session = request.getSession();

			// Hiển thị danh sách giỏ
			khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			long makh = kh.getMaKhachHang();
			ArrayList<giospbean> dsgio = gh.getdsgio(makh);
			if (dsgio.size() != 0) {
				request.setAttribute("dsgio", dsgio);
			}
			// Xu li tra hàng

			String tra = request.getParameter("delete");
			String ghichu = request.getParameter("ghichu");
			if (tra != null) {
				String trats = request.getParameter("mxoa");
				gh.DeleteGio(Integer.parseInt(trats), ghichu);
				boolean checkDelete = true;
				session.setAttribute("checkDelete", (boolean) checkDelete);
				response.sendRedirect("giospcontroller");
				return;
			}
			
			//sử lí mua chọn
			
			String btnXoaChon = request.getParameter("btnXoaChon");
			if (btnXoaChon != null) {
			    // Tạo một tập hợp để lưu trữ các mã sản phẩm và kích thước đã chọn từ form
			    Set<String> selectedProducts = new HashSet<>();
			    Enumeration<String> parameterNames = request.getParameterNames();
			    while (parameterNames.hasMoreElements()) {
			        String name = parameterNames.nextElement();
			        String value = request.getParameter(name);
			        if (value.equals("on")) {
			            selectedProducts.add(name); // Thêm mã sản phẩm đã chọn vào tập hợp
			        }
			    }
			    ArrayList<giospbean> dsGioHang = gh.getdsgio(makh);
			    // Duyệt qua danh sách giỏ hàng để xử lý xóa sản phẩm đã chọn
			    for (giospbean item : dsGioHang) {
			        int productId = item.getMaSanPham();
			        String productSize = item.getGhiChu();
			        String productKey = productId + productSize;

			        // Kiểm tra xem sản phẩm có trong danh sách cần xóa không
			        if (selectedProducts.contains(productKey)) {
			            gh.DeleteGioChon1(productId,productSize); // Xóa sản phẩm từ giỏ hàng
			            selectedProducts.remove(productKey); // Xóa khỏi danh sách đã chọn để không xóa lại lần sau
			        }
			    }

			    // Chuyển hướng về trang giỏ hàng sau khi xóa
			    boolean checkDeleteChon = true;
				session.setAttribute("checkDeleteChon", (boolean) checkDeleteChon);
				request.setAttribute("dsgio", dsgio);
			    response.sendRedirect("giospcontroller");
			    return;
			}


//			Sử lí xóa tất cả.
			String xoaall = request.getParameter("btnxoaAll");
			if (xoaall != null) {
				khachhangthibean kh1 = (khachhangthibean) session.getAttribute("dn");
				gh.DeleteGioKH((int) kh1.getMaKhachHang());
				boolean checkDeleteAll = true;
				session.setAttribute("checkDeleteAll", (boolean) checkDeleteAll);
				response.sendRedirect("giospcontroller");
				return;
			}

			// Xử lí cap nhat
			//--bấm cộng
			String btnUp = request.getParameter("btnUp");
			String masl = request.getParameter("masl");
			String kt = request.getParameter("kt");
			String slmua = request.getParameter("slmua");
//			String kt = request.getParameter("kt");
			KichThuocBo ktbo = new KichThuocBo();
			if (btnUp != null) {
				if(masl != null && kt != null & slmua != null ) {
					int maspInt = Integer.parseInt(masl);
					ArrayList<giospbean> dsgiosp = gh.getdsgio(makh);
					ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(maspInt);
					for(KichThuocBean dsktsp : dskt) {
						dsktsp.getSoLuongSize();
						if (dsktsp != null) {
							int slmuaInt = Integer.parseInt(slmua);
							int maslInt = Integer.parseInt(masl);
							if (kt.equals(dsktsp.getTenKichThuoc()) && maslInt == dsktsp.getMaSanPham()) {
								if (slmuaInt >= dsktsp.getSoLuongSize()) {
									boolean checkUpdateUp = false;
									session.setAttribute("checkUpdateUp", (boolean) checkUpdateUp);
									response.sendRedirect("giospcontroller");
									return;
								}else {
									for(giospbean ds :dsgiosp) {
										if (maspInt == ds.getMaSanPham() && kt.equals(ds.getGhiChu())) {
											gh.UpdateGio(Integer.parseInt(masl), Long.parseLong(slmua) + 1, kt);
											boolean checkUpdateUp = true;
											session.setAttribute("checkUpdateUp", (boolean) checkUpdateUp);
											request.setAttribute("dsgio", dsgiosp);
											response.sendRedirect("giospcontroller");
											return;
										}
									}
								}
							}
						}
					}
				}
			}
			
			//--bấm trừ
			
			String btnDown = request.getParameter("btnDown");
			if (btnDown != null) {
			    if(masl != null && kt != null & slmua != null ) {
			        int maspInt = Integer.parseInt(masl);
			        ArrayList<giospbean> dsgiosp = gh.getdsgio(makh);
			        for(giospbean ds :dsgiosp) {
			            if (maspInt == ds.getMaSanPham() && kt.equals(ds.getGhiChu())) {
			                long slmuaInt = Long.parseLong(slmua);
			                // Kiểm tra xem số lượng mua có lớn hơn 1 không
			                if (slmuaInt > 1) {
			                    gh.UpdateGio(Integer.parseInt(masl), slmuaInt - 1, kt);
			                    boolean checkUpdateDown = true;
			                    session.setAttribute("checkUpdateDown", checkUpdateDown);
			                    request.setAttribute("dsgio", dsgiosp);
			                } else {
			                    // Nếu số lượng mua đã là 1, không thực hiện gì cả
			                    boolean checkUpdateDown = false;
			                    session.setAttribute("checkUpdateDown", checkUpdateDown);
			                }
			                response.sendRedirect("giospcontroller");
			                return;
			            }
			        }
			    }
			}

			//---nhập 
			String gccn = request.getParameter("gccn");
			if (masp != null && slm != null && gccn != null)  {
				int maspInt = Integer.parseInt(masp);
				ArrayList<giospbean> dsgiosp = gh.getdsgio(makh);
				ArrayList<KichThuocBean> dskt = ktbo.dskichThuoc(maspInt);
				for(KichThuocBean dsktsp : dskt) {
					if (dsktsp != null) {
						if (gccn.equals(dsktsp.getTenKichThuoc()) && maspInt == dsktsp.getMaSanPham()) {
							int slmInt = Integer.parseInt(slm);
							if (slmInt >= dsktsp.getSoLuongSize()) {
								boolean checkUpdateNhap = false;
								session.setAttribute("checkUpdateNhap", (boolean) checkUpdateNhap);
								response.sendRedirect("giospcontroller");
								return;
							}else if(slmInt <= 0) {
								boolean checkUpdateNhapMin = false;
								session.setAttribute("checkUpdateNhapMin", (boolean) checkUpdateNhapMin);
								response.sendRedirect("giospcontroller");
								return;
							}else {
								for(giospbean ds :dsgiosp) {
									if (maspInt == ds.getMaSanPham() && gccn.equals(ds.getGhiChu())) {
										gh.UpdateGio(Integer.parseInt(masp), Long.parseLong(slm), gccn);
										boolean checkUpdateNhap = true;
										session.setAttribute("checkUpdateNhap", (boolean) checkUpdateNhap);
										request.setAttribute("dsgio", dsgiosp);
										response.sendRedirect("giospcontroller");
										return;
									}
								}
							}
						}
					}
				}
			}
			
			//Xử lí thay đổi kích thước
			String btnUpKT = request.getParameter("btnUpKT");
			String tenKT = request.getParameter("tenKT");
			String maspSize = request.getParameter("maspSize");
			if (btnUpKT != null) {
				int maspSizeInt = Integer.parseInt(maspSize);
				gh.UpdateGioKT(maspSizeInt, tenKT);
				boolean checkUpdateKT = true;
				session.setAttribute("checkUpdateKT", (boolean) checkUpdateKT);
				 response.sendRedirect("giospcontroller");
	                return;
			}
			// tính tổng tiền
			double tongtien = 0;
			DecimalFormat decimalFormat = new DecimalFormat("#,###");

			if (dsgio != null) {
			    int dsint = dsgio.size();
			    for (int i = 0; i < dsint; i++) {
			        double soLuongMua = dsgio.get(i).getSoLuongMua();
			        double gia = dsgio.get(i).getGia();
			        double chiecKhau = dsgio.get(i).getChiecKhau();
			        double thanhTien = soLuongMua * (gia - (gia * (chiecKhau / 100)));
			        tongtien += thanhTien;
			    }
			}

			String tongtienFormatted = decimalFormat.format(tongtien);
			request.setAttribute("tongtien", tongtienFormatted);

			loaispbo lbo = new loaispbo();
			ArrayList<loaispbean> dsloai = lbo.getloaisp();

			ArrayList<KichThuocBean> dskt = (ArrayList<KichThuocBean>)request.getAttribute("dskt");
			if (dskt != null) {
				System.out.println(2);
				System.out.println(dskt);
				request.setAttribute("dskt", dskt);
			}

			sanphambo sbo = new sanphambo();
			ArrayList<String> dsHang = sbo.getHang();
			request.setAttribute("dsHang", dsHang);
			request.setAttribute("dssanpham", dsgio);
			request.setAttribute("dsloai", dsloai);

			if (session.getAttribute("checkThem") != null) {
				request.setAttribute("checkThem", (boolean) session.getAttribute("checkThem"));
				session.removeAttribute("checkThem");
			}
			if (session.getAttribute("checkThemML") != null) {
				request.setAttribute("checkThemML", (boolean) session.getAttribute("checkThemML"));
				session.removeAttribute("checkThemML");
			}
			if (session.getAttribute("checkDelete") != null) {
				request.setAttribute("checkDelete", (boolean) session.getAttribute("checkDelete"));
				session.removeAttribute("checkDelete");
			}
			if (session.getAttribute("checkDeleteChon") != null) {
				request.setAttribute("checkDeleteChon", (boolean) session.getAttribute("checkDeleteChon"));
				session.removeAttribute("checkDeleteChon");
			}
			if (session.getAttribute("checkDeleteAll") != null) {
				request.setAttribute("checkDeleteAll", (boolean) session.getAttribute("checkDeleteAll"));
				session.removeAttribute("checkDeleteAll");
			}
			if (session.getAttribute("checkUpdate") != null) {
				request.setAttribute("checkUpdate", (boolean) session.getAttribute("checkUpdate"));
				session.removeAttribute("checkUpdate");
			}
			if (session.getAttribute("checkUpdateDown") != null) {
				request.setAttribute("checkUpdateDown", (boolean) session.getAttribute("checkUpdateDown"));
				session.removeAttribute("checkUpdateDown");
			}
			if (session.getAttribute("checkUpdateUp") != null) {
				request.setAttribute("checkUpdateUp", (boolean) session.getAttribute("checkUpdateUp"));
				session.removeAttribute("checkUpdateUp");
			}
			if (session.getAttribute("checkUpdateNhap") != null) {
				request.setAttribute("checkUpdateNhap", (boolean) session.getAttribute("checkUpdateNhap"));
				session.removeAttribute("checkUpdateNhap");
			}
			if (session.getAttribute("checkUpdateNhapMin") != null) {
				request.setAttribute("checkUpdateNhapMin", (boolean) session.getAttribute("checkUpdateNhapMin"));
				session.removeAttribute("checkUpdateNhapMin");
			}
			if (session.getAttribute("checkUpdateKT") != null) {
				request.setAttribute("checkUpdateKT", (boolean) session.getAttribute("checkUpdateKT"));
				session.removeAttribute("checkUpdateKT");
			}
			if (session.getAttribute("checkSoLuong") != null) {
				request.setAttribute("checkSoLuong", (boolean) session.getAttribute("checkSoLuong"));
				session.removeAttribute("checkSoLuong");
			}
			RequestDispatcher rd = request.getRequestDispatcher("Giosp.jsp");
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
