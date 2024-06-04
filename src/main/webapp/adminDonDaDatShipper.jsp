<%@page import="bean.HoaDonBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.DonHangDaDatBean"%>
<%@page import="bean.khachhangthibean"%>
<%@page import="bean.choxacnhanbean"%>
<%@page import="bo.khachhangbo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Admin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="assets/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="Thongbao.css">
<style type="text/css">
.disabled {
    opacity: 0.5; /* Làm mờ nút */
    pointer-events: none; /* Ngăn không cho nhấp vào nút */
}
.card {
    border: 1px solid #ccc;
    border-radius: 10px;
    overflow: hidden;
}

.card-img-top {
    border-bottom: 1px solid #ccc;
}

.card-body {
    padding: 15px;
}

.card-footer {
    background-color: #f9f9f9;
    border-top: 1px solid #ccc;
    padding: 10px;
}
.card {
    border: 1px solid #ccc;
    border-radius: 10px;
    overflow: hidden;
}

.card-header {
    background-color: #446879;
    color: #fff;
    padding: 15px;
    border-bottom: 1px solid #ccc;
}

.card-img-top {
    border-bottom: 1px solid #ccc;
}

.card-body {
    padding: 15px;
}

.card-footer {
    background-color: #f9f9f9;
    border-top: 1px solid #ccc;
    padding: 10px;
}
</style>
</head>
<body>
	<%-- <div id="main">

		<div id="header" style="height: 120px; background-color: #446879;">
			<div
				style="position: relative; display: flex; justify-content: space-between;">
				<img class="header-img-rps" alt="" src="baithijava/logotc4.jpg"
					style="width: 50px; height: 50px; margin-top: 15px; margin-left: 30px;">
				<p class="header-p-rps"
					style="color: #fff; margin-top: 30px; font-size: 17px;">Đây là
					trang Admin của Hv Huy Shop</p>
				<form action="sanphamcontroller" method="post" style=""></form>
			</div>
			<ul id="nav">
				<!--  <li class="active">
                <a href="sanphamcontroller"><img alt="" src="baithijava/logotc4.jpg" style=" width: 50px;height: 50px;"></a></li> -->
				<li><a href="adminloaispcontroller">Quản lí danh mục</a></li>
				<li><a href="adminsanphamcontroller">Quản lí sản phẩm</a></li>
				<li><a href="adminxacnhancontroller">Xác nhận đặt hàng</a></li>
				<li><a href="adminxoatkcontroller">Quản lí tài khoản</a></li>
				<li><a href="adminThongKeController">Thống kê</a></li>
				<!-- <li><a
					class="footer-Evaluate footer-group js-buy-btn-Evaluate ">Đánh
						Giá</a></li> -->
			</ul>
			<ul class="nav navbar-nav navbar-right ">

				<li>
					<%
					//session.removeAttribute("dn")
					if (session.getAttribute("dnadmin") != null) {
						String tenkh = (String) session.getAttribute("dnadmin");
					%> <a href="" style="color: white"><span
						style="display: inline-block; width: 20px; background-color: pink; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 600;"><%=tenkh.toUpperCase().charAt(0)%></span><%=tenkh%>
				</a> <%
 } else {
 %> <a href="dangxuatcontroller" class=" header-nav-re"
					style="text-decoration: none; color: white;"><span
						class="glyphicon glyphicon-log-in"></span> Đăng xuất</a> <%
 }
 %>
				</li>
				<li>
					<%
					if (session.getAttribute("dnadmin") != null) {
					%> <a
					href="dangxuatcontroller" class=" header-nav-re"><span
						class="glyphicon glyphicon-log-in"></span> Đăng xuất</a> <%
 }
 %>
				</li>
			</ul>

			<label for="nav-mobile-input" class="nav-bars-btn"> <i
				class="fa-solid fa-bars"></i>
			</label>

			<!-- <label for="nav-mobile-input">Check 1</label> -->

			<input type="checkbox" hidden name="" class="nav-input"
				id="nav-mobile-input">

			<!-- <label for="nav-mobile-input">Check 2</label> -->

			<label for="nav-mobile-input" class="nav-overlay">
				<li><a href="#"><i class="ti-home nav-home-icon "></i></a></li>
			</label>

			<ul id="nav-mobile">

				<label for="nav-mobile-input" class="nav-mobile-close"> <i
					class="fa-regular fa-circle-xmark "></i>
				</label>

				<li class="active"><a href="sanphamcontroller"><img alt=""
						src="baithijava/logotc4.jpg" style="width: 50px; height: 50px;"></a></li>

				<li><a href="adminloaispcontroller" class="nav-mobile-css">Quản
						lí danh mục</a></li>
				<li><a href="adminsanphamcontroller" class="nav-mobile-css">Quản
						lí sản phẩm</a></li>
				<li><a href="adminxacnhancontroller" class="nav-mobile-css">Xác
						nhận đặt mua</a></li>
				<li><a href="adminxoatkcontroller" class="nav-mobile-css">Quản
						lí tài khoản</a></li>
				<li><a href="adminThongKeController" class="nav-mobile-css">Thống kê</a></li>
			</ul>

			<!-- Hiển thị nút bars -->


		</div>

		<!-- Hiển thị modal đăng nhập -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Đăng Nhập</h4>
					</div>
					<div class="Form">
						<form style="text-align: center;" action="khachhangcontroller"
							method="post">
							<div style="display: block;">
								<span class="FormSV-span">Tài Khoản:</span> <input
									class="FormSV-input" type="text" name="txtun"
									placeholder="Nhập tài khoản" required> <br>
							</div>
							<div style="display: block;">
								<span class="FormSV-span">Mật khẩu:</span> <input
									class="FormSV-input" type="Password" name="txtpass"
									placeholder="Nhập Mật Khẩu" required> <br>
							</div>
							<div style="margin-top: 10px">
								<span style="margin-top: 10px">Bạn chưa có tài khoản?<a
									href="" data-toggle="modal" data-target="#myModaldk"
									data-dismiss="modal">Đăng kí</a></span><br>
								<button class="FormSV-Buttom">Đăng Nhập</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!-- Hết modal đăng nhập -->

		<!-- Hiển thị modal đăng kí -->
		<div class="modal fade" id="myModaldk" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Đăng kí</h4>
					</div>
					<div class="Form">
						<form style="text-align: center;" action="khachhangcontroller"
							method="post">
							<div style="display: inline-block;">
								<span class="FormSV-span">Họ tên:</span> <input
									class="FormSV-input" type="text" name="txtht"
									placeholder="Nhập họ tên" required>
							</div>
							<div style="display: inline-block;">
								<span class="FormSV-span">Đại chỉ:</span> <input
									class="FormSV-input" type="text" name="txtdc"
									placeholder="Nhập địa chỉ" required>
							</div>
							<div style="display: inline-block;">
								<span class="FormSV-span">Số điện thoại:</span> <input
									class="FormSV-input" type="text" name="txtsdt"
									placeholder="Nhập số điện thoại" required>
							</div>
							<div style="display: inline-block;">
								<span class="FormSV-span">Email:</span> <input
									class="FormSV-input" type="email" name="txtemail"
									placeholder="Nhập email" required>
							</div>
							<div style="display: inline-block;">
								<span class="FormSV-span">Tài Khoản:</span> <input
									class="FormSV-input" type="text" name="txtun"
									placeholder="Nhập tài khoản" required>
							</div>
							<div style="display: inline-block;">
								<span class="FormSV-span">Mật khẩu:</span> <input
									class="FormSV-input" type="Password" name="txtpass1"
									placeholder="Nhập mật khẩu" required>
							</div>
							<div style="display: inline-block;">
								<span class="FormSV-span">Nhập lại mật khẩu:</span> <input
									class="FormSV-input" type="Password" name="txtpass2"
									placeholder="Nhập lại mật khẩu" required>
							</div>
							<div>
								<button class="FormSV-Buttom">Đăng Kí</button>
								<span style="margin-top: 10px">Bạn chưa đã có tài khoản?<a
									href="" data-toggle="modal" data-target="#myModal"
									data-dismiss="modal">Đăng nhập</a></span><br>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!-- Hết modal đăng kí -->

	</div> --%>
	<%-- 
<%
	if (request.getParameter("kt") != null ){%>
	  	<script type="text/javascript">
	  		alert('Vui lòng đăng nhập lại!');
	  	</script>
<% }%> --%>
	<div class="notifications"></div>
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkUpdateShipper") != null) {
		boolean checkUpdateShipper = (boolean) request.getAttribute("checkUpdateShipper");
		if (checkUpdateShipper == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Đã giao hàng cho khách hàng');
	</script>
	<%
	}
	}
	%>

	<!-- <h1 style="color: black; margin-top: 140px; text-align: center;">Trang
		ADMIN Các đơn hàng đã đặt</h1>
		<div style="display: flex;justify-content: space-between;">
			<a href="adminDonHangDaXacNhanShipperController" style="display:block;border: 1px solid black;margin-left: 72px;padding:0px 0px;text-decoration: none;cursor:pointer; color: white;background-color: orange;border-radius: 10px;font-size: 20px;float: right;"><i class="fas fa-check" style="width: 20px;margin-right: 10px;padding: 20px"></i>Đơn hàng đã xác
				nhận cho shipper</a>
			<a href="adminxacnhancontroller" style="display:block;border: 1px solid black;margin-right: 72px;padding:0px 7px;text-decoration: none;cursor:pointer; color: white;background-color: red;border-radius: 10px;font-size: 20px;float: right;"><i class="fas fa-check" style="width: 20px;margin-right: 10px;padding: 20px"></i>Đơn hàng chưa xác
				nhận</a>
		</div> -->

<div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3" style="background-color: #ccc">
                <div style="padding: 20px"></div>
                <div style="display: flex;justify-content: center;align-items: center;">
                	<img alt="" src="baithijava/admin1.jpg" style="width: 100px; height: 100px;">
                	<h1 class="text-center" style="padding: 20px">ADMIN</h1>
                </div>
                <div style="display: flex; flex-direction: column; justify-content: space-around; margin: 30px;">
                    <a href="adminThongKeController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px;  color: black; font-weight: bold; margin-bottom: 10px;">Thống kê theo sản phẩm</a>
                    <a href="adminThongKeKHController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold; margin-bottom: 10px;">Thống kê theo khách hàng</a>
                    <a href="adminThongKeDHController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Thống kê theo đơn hàng</a>
                    <a href="adminxacnhancontroller" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Xác nhận đơn hàng</a>
                    <a href="adminDonHangDaXacNhanShipperController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Trang của người vận chuyển</a>
                    <a href="adminsanphamcontroller" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Quản lí sản phẩm</a>
                    <a href="adminloaispcontroller" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px; padding: 10px; color: black; font-weight: bold;margin-bottom: 10px;">Quản lí danh mục</a>
                </div>
            </div>
			<div class="col-md-9 main-content">
			<div style="padding: 20px"></div>
			<h1 style="color: black; text-align: center;">Đơn hàng cần giao</h1>
				<%
				ArrayList<HoaDonBean> dshd = (ArrayList<HoaDonBean>) request.getAttribute("dshd");
				ArrayList<DonHangDaDatBean> dsadmin = (ArrayList<DonHangDaDatBean>) request.getAttribute("adminxacnhan");
				if (dshd == null || dshd.isEmpty()) {
				%>
				<h2 style="text-align: center; margin-top: 20px; font-size: 30px">Không có đơn hàng nào!!</h2>
				<%
				} else {
				%>
				<div class="container">
				    <%
				    for (HoaDonBean hd : dshd) {
				    %>
				    <%
				    if (dsadmin != null && !dsadmin.isEmpty()) {
				        boolean hasOrders = false;
				        boolean firstOrder = true;
				        for (DonHangDaDatBean dh : dsadmin) {
				            if (dh.getMaHoaDon() == hd.getMaHoaDon() && dh.getTrangThaiCt() == 0) {
				                hasOrders = true;
				                if (firstOrder) {
				                    firstOrder = false;
				    %>
				    <div class="row mb-4">
				        <div class="col-12">
				            <div class="card">
				                <div class="card-header">
				                    <h3>Mã Hóa Đơn: <%= hd.getMaHoaDon() %></h3>
				                    <p>Ngày Đặt: <%= hd.getNgayMua() %></p>
				                     <p class="payment-method">
			                            <%
			                            if (hd.getTrangThaiDon() == 0) {
			                            %>
			                            Phương thức thanh toán: Thanh toán trực tiếp (chưa thanh toán)
			                            <%
			                            } else {
			                            %>
			                            Phương thức thanh toán: Thanh toán online (đã thanh toán)
			                            <%
			                            }
			                            %>
			                        </p>
				                </div>
				                <div class="card-body">
				    <%
				                }
				    %>
				                    <div class="row order-details mb-2">
				                        <div class="col-md-2">
				                            <img src="<%= dh.getAnh() %>" alt="Ảnh sản phẩm" style="width: 100%; object-fit: cover;">
				                        </div>
				                        <div class="col-md-7">
				                            <div>
				                                <span><strong>Tên sản phẩm:</strong> <%= dh.getTenSanPham() %></span>
				                            </div>
				                            <div>
				                            	<%
										        double gia = dh.getDonGiaSP();
										        double chiecKhau = dh.getChiecKhau();
										        double thanhTientt = (gia * (1 - (chiecKhau / 100)));
										        DecimalFormat decimalFormat = new DecimalFormat("#,###");
							        			String GiaFormatted = decimalFormat.format(thanhTientt); %>
				                                <span><strong>Giá:</strong> <%= GiaFormatted %>đ</span> |
				                                <span><strong>Số lượng:</strong> <%= dh.getSoLuongMua() %></span>
				                            </div>
				                            <div>
				                                <span><strong>Kích thước:</strong> <%= dh.getGhiChuCT() %></span> |
				                                <span><strong>Khách hàng:</strong> <%= dh.getHoTen() %></span>
				                            </div>
				                            <div>
				                                <span><strong>Địa chỉ:</strong> <%= dh.getDiaChi() %></span> |
				                                <span><strong>SĐT:</strong> <%= dh.getSoDT() %></span>
				                            </div>
				                            <div style="color: red;">
				                                <span><strong>Trạng thái:</strong> <%= dh.getTrangThai() == 3 ? "Đã hoàn thành" : "Chưa xác nhận" %></span>
				                            </div>
				                        </div>
				                         <div class="col-md-3" id="xacnhan-<%= dh.getMaHoaDon() %>">
				                              <%
				                              if (dh.getTrangThaiDon() == 1) {
				                              %>
				                              <a href="adminGiaoHangcontroller?btnGiaoHang&mact=<%= dh.getMaChiTiet() %>" onclick="disableButton(this)"
				                                 style="border: 1px solid #ccc; text-decoration: none; font-weight: bold; padding: 9px 18px; display: block; float: right; margin-bottom: 20px; background-color: red; color: #fff; border-radius: 10px">Giao hàng</a>
				                              <% } else { %>
				                              <a href="adminGiaoHangcontroller?btnGiaoHang&mact=<%= dh.getMaChiTiet() %>" onclick="disableButton(this)"
				                                 style="border: 1px solid #ccc; text-decoration: none; font-weight: bold; padding: 9px 18px; display: block; float: right; margin-bottom: 20px; background-color: red; color: #fff; border-radius: 10px">Giao hàng và nhận tiền</a>
				                              <% } %>
				                          </div>
				                        <script src="assets/ThemDisable.js"></script>
				                    </div>
				    <%
				            }
				        }
				        if (hasOrders) {
				    %>
				                </div>
				            </div>
				        </div>
				    </div>
				    <%
				        }
				    }
				    %>
				    <%
				    }
				    %>
				</div>
				<%
				}
				%>
				<script>
				    // Chỉ hiển thị div đầu tiên với id bắt đầu bằng "xacnhan-" cho mỗi mã hóa đơn
				    document.addEventListener('DOMContentLoaded', function() {
				        var xacnhanDivs = document.querySelectorAll('div[id^="xacnhan-"]');
				        var seen = {};
				        xacnhanDivs.forEach(function(div) {
				            var id = div.id.split('-')[1];
				            if (seen[id]) {
				                div.style.display = 'none';
				            } else {
				                seen[id] = true;
				            }
				        });
				    });
				</script>
			</div>
		</div>
	</div>		


	<!-- Modal thông tin khách hàng -->
			<%-- 	<div class="modal fade" id="myModal<%=dsadmin.get(i).getMaChiTiet()%>"
					role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h2 class="modal-title">Thông tin đơn hàng</h2>
							</div>
							<div class="row">
								<div class="Form col-sm-6"
									style="border-right: 1px solid black;">
									<form style="text-align: center;" action="" method="post">

										<span class="FormSV-span" style="font-size: 18px">Ngày
											đặt hàng:</span>
										<p style="color: red"><%=dsadmin.get(i).getNgayMua()%></p>

										<span class="FormSV-span" style="font-size: 18px">Họ
											tên:</span>
										<p style="color: red"><%=dsadmin.get(i).getHoTen()%></p>


										<span class="FormSV-span" style="font-size: 18px">Địa
											chỉ:</span>
										<p style="color: red"><%=dsadmin.get(i).getDiaChi()%></p>


										<span class="FormSV-span" style="font-size: 18px">Số
											điện thoại:</span>
										<p style="color: red"><%=dsadmin.get(i).getSoDT()%></p>


										<span class="FormSV-span" style="font-size: 18px">Phương thức thanh toán:</span>
										<% if(dsadmin.get(i).getTrangThaiDon() == 1){%>
											<p style="color: red">Thanh toán online(đã thanh toán)</p>
										<%}else{ %>
										<p style="color: red">Thanh toán trực tiếp(thanh toán khi nhận hàng)</p>
										<%} %>
									</form>
								</div>
								<div class="col-sm-6 text-center">
									<span class="FormSV-span" style="font-size: 18px">Tên
										sản phẩm :</span>
									<p style="color: red"><%=dsadmin.get(i).getTenSanPham()%></p>

									<!-- <span class = "FormSV-span" style="font-size: 18px">Ảnh:</span> -->
									<img alt="" src="<%=dsadmin.get(i).getAnh()%>" style="width: 50px"> <span
										class="FormSV-span" style="font-size: 18px">Số lượng
										mua:</span>
									<p style="color: red"><%=dsadmin.get(i).getSoLuongMua()%></p>
								<%
						        double gia = dsadmin.get(i).getDonGiaSP();
						        double chiecKhau = dsadmin.get(i).getChiecKhau();
						        double thanhTientt = (gia * (1 - (chiecKhau / 100)));
						        DecimalFormat decimalFormat = new DecimalFormat("#,###");
			        			String GiaFormatted = decimalFormat.format(thanhTientt); %>

									<span class="FormSV-span" style="font-size: 18px">Giá:</span>
									<p style="color: red"><%=GiaFormatted%></p>

								<%
							 	double soLuongMua = dsadmin.get(i).getSoLuongMua();
						        double giassp = dsadmin.get(i).getDonGiaSP();
						        double chiecKhausp = dsadmin.get(i).getChiecKhau();
						        double thanhTien = soLuongMua * (giassp * (1 - (chiecKhausp / 100)));
			        			
			        			
			        			String tongTienFormatted = decimalFormat.format(thanhTien); %>
								
									<span class="FormSV-span" style="font-size: 18px">Tổng tiền:</span>
									<p style="color: red"><%=tongTienFormatted%></p>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div> --%>
</body>
</html>