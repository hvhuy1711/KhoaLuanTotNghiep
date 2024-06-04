<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.HoaDonBean"%>
<%@page import="bean.DonHangDaDatBean"%>
<%@page import="bean.giospbean"%>
<%@page import="bean.khachhangthibean"%>
<%@page import="bean.AnhBean"%>
<%@page import="bean.KichThuocBean"%>
<%@page import="bean.ThongKeBean"%>
<%@page import="bean.loaispbean"%>
<%@page import="bean.sanphamfullbean"%>
<%@page import="bean.sanphamfullbean"%>
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
.form-row {
	padding: 10px 50px;
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.labelspan {
	width: 100px; /* Đặt kích thước của label */
	margin-right: 10px; /* Tạo khoảng cách giữa label và input */
}

.input {
	padding: 10px;
	flex: 1;
	/* Để input mở rộng để điền vào phần còn lại của hàng */
	height: 30px; /* Đặt chiều cao cho input */
	width: 100%;
	flex: 1; /* Đảm bảo input mở rộng để điền vào khoảng trống */
}

.modal-content {
	padding: 20px;
}

.modal-header {
	border-bottom: none;
	text-align: center;
}

.modal-title {
	font-size: 24px;
}

.text-center {
	text-align: center;
}

 .product-details {
     margin: 20px 0;
 }

 .product-details img {
     max-width: 100%;
     height: auto;
 }

 .product-details .col-sm-6 {
     padding: 10px;
 }

 .product-details .col-sm-6 p {
     margin: 5px 0;
     font-size: 16px;
     color: #333;
 }

 .product-details .col-sm-6 p span {
     font-weight: bold;
     color: #000;
 }

 .modal-dialog {
     max-width: 600px; /* Adjust the width as needed */
 }

 .modal-header .close {
     font-size: 24px;
     cursor: pointer;
 }

 .modal-header .fa-times {
     float: right;
 }

 .modal-header h4 {
     font-size: 30px;
 }

 .modal-body .product-details p {
     font-size: 18px;
     margin-bottom: 10px;
 }

 .modal-body .product-details p span {
     font-size: 18px;
     font-weight: bold;
     margin-right: 10px;
 }

 .modal-body .product-details input {
     color: red;
     width: 100px;
     text-align: center;
     border: none;
     background: none;
 }

 .modal-body .product-details p .mota {
     font-size: 25px;
     color: red;
 }

 .btn-default {
     background-color: #f0f0f0;
     border-color: #ccc;
     color: #333;
 }

.modal-footer {
	border-top: none;
	text-align: center;
}

.modal-footer .btn {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
}

.modal-footer .btn:hover {
	background-color: #0056b3;
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
				 <li><a href="adminxoatkcontroller" class="nav-mobile-css">Quản lí tài khoản</a></li>
				<li><a
					class="footer-Evaluate footer-group js-buy-btn-Evaluate ">Thống
						kê</a></li>
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
 %> <a href="" data-toggle="modal" data-target="#myModal"
					style="color: #fff; margin-right: 15px;" class="header-nav-re"><span
						class="glyphicon glyphicon-log-in"></span> Đăng nhập</a> <%
 }
 %>
				</li>
				<li>
					<%
					if (session.getAttribute("dnadmin") != null) {
					%> <a href="dangxuatcontroller" class=" header-nav-re"><span
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
				<li><a href="adminThongKeController" class="nav-mobile-css">Thống
						kê</a></li>

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
            <!-- Main Content -->
            <div class="col-md-9">
                <div style="padding: 20px"></div>
                <div style="border: 2px solid #446879; border-radius: 10px;padding: 30px">
                <h1 class="text-center">Thống kê doanh thu</h1>
                
				<div class="container">
				    <div class="row justify-content-center">
				        <div class="col-md-6">
				            <form action="adminThongKeDHController" method="post" class="form-inline">
				                <div class="form-group mr-2">
				                    <label for="ngay">Ngày:</label>
				                    <select class="form-control" name="ngay" id="ngay">
				                        <% for(int i = 1; i <= 31; i++) { %>
				                            <option value="<%= i %>"><%= i %></option>
				                        <% } %>
				                    </select>
				                </div>
				                <div class="form-group mr-2">
				                    <label for="thang">Tháng:</label>
				                    <select class="form-control" name="thang" id="thang">
				                        <% for(int i = 1; i <= 12; i++) { %>
				                            <option value="<%= i %>"><%= i %></option>
				                        <% } %>
				                    </select>
				                </div>
				                <div class="form-group mr-2">
				                    <label for="nam">Năm:</label>
				                    <select class="form-control" name="nam" id="nam">
				                        <% 
				                            int currentYear = java.time.LocalDate.now().getYear();
				                            for(int i = currentYear; i >= currentYear - 100; i--) { 
				                        %>
				                            <option value="<%= i %>"><%= i %></option>
				                        <% } %>
				                    </select>
				                </div>
				                <div class="form-group">
				                    <button name="btnchon" type="submit" class="btn btn-primary">Chọn</button>
				                </div>
				            </form>
				        </div>
				    </div>
				</div>
                <div style="padding: 20px"></div>
                <div style="font-size: 25px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; margin: 0 20px">
                    Tổng Tiền đơn hàng đã đặt:
                    <%if(request.getAttribute("tontiendh") == null){%>
                    <span style="color: red;"> 0₫</span>
                    <%}else{ %>
                    <span style="color: red;"> <%=request.getAttribute("tontiendh")%>₫</span>
                    <%} %>
                </div>
                <div style="font-size: 25px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; margin: 0 20px">
                    Tổng Tiền đơn hàng đã hoàn thành:
                   <% if(request.getAttribute("tontienht") != null){%>
                    <span style="color: red;"> <%=request.getAttribute("tontienht")%>₫</span>
                    <%}else{ %>
                    <span style="color: red;"> 0₫</span>
                    <%} %>
                </div>
                </div>
                
<div style="padding: 10px"></div>
<h1 style="margin-left: 20px;text-align: center;">Tìm kiếm đơn hàng</h1>
<div class="container" style="display: block;margin: 0 auto;">
    <div class="row ">
        <div class="col-12" style="display: flex;justify-content: center;">
            <form action="adminThongKeDHController" method="GET" class="form-inline">
                <div class="form-group mx-sm-3 mb-2">
                    <label for="searchProduct" class="sr-only">Tìm kiếm theo sản phẩm</label>
                    <input type="text" class="form-control" id="searchProduct" name="searchProduct" placeholder="Nhập tên sản phẩm">
                </div>
                <div class="form-group mx-sm-3 mb-2">
                    <label for="searchCustomer" class="sr-only">Tìm kiếm theo khách hàng</label>
                    <input type="text" class="form-control" id="searchCustomer" name="searchCustomer" placeholder="Nhập tên khách hàng">
                </div>
                <button type="submit" name="btnsearch" class="btn btn-primary mb-2">Tìm kiếm</button>
            </form>
        </div>
    </div>
</div>

                <div style="padding: 20px"></div>
                <h1 class="text-center">Danh sách đơn hàng</h1>
                <% 
                ArrayList<HoaDonBean> dshd = (ArrayList<HoaDonBean>) request.getAttribute("dshd");
                ArrayList<DonHangDaDatBean> dsdh = (ArrayList<DonHangDaDatBean>) request.getAttribute("dsdh");
                if (dshd == null || dshd.isEmpty()) {
                %>
                <h2 style="text-align: center; margin-top: 20px; font-size: 30px">Không có đơn hàng nào trùng khớp</h2>
                <% 
                } else { 
                %>
                <div class="container">
                    <% 
                    for (HoaDonBean hd : dshd) { 
                    %>
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3>Mã Hóa Đơn: <%= hd.getMaHoaDon() %></h3>
                                    <p>Ngày Đặt: <%= hd.getNgayMua() %></p>
                                </div>
                                <div class="card-body">
                                    <% 
                                    if (dsdh != null && !dsdh.isEmpty()) {
                                        boolean hasOrders = false;
                                        for (DonHangDaDatBean dh : dsdh) {
                                            if (dh.getMaHoaDon() == hd.getMaHoaDon()) {
                                                hasOrders = true;
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
												 long giaLong = dh.getDonGiaSP();
											    long chiecKhauLong = dh.getChiecKhau();
											    float gia = (float) giaLong;
											    float chiecKhau = (float) chiecKhauLong;
											    float giaSauChiecKhau = gia -( gia * (chiecKhau / 100));
								
											    // Định dạng giá tiền thành dạng mong muốn
											    DecimalFormat decimalFormat = new DecimalFormat("#,###");
											    String giaFormatted = decimalFormat.format(giaSauChiecKhau);
											%>
                                                <span><strong>Giá:</strong> <%= giaFormatted %>đ</span> |
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
                                                <span><strong>Trạng thái:</strong> <%= dh.getTrangThai() == 2 || dh.getTrangThai() == 3 ? "Đã hoàn thành" : "Chưa hoàn thành" %></span>
                                            </div>
                                        </div>
                                    </div>
                                    <% 
                                            }
                                        }
                                      
                                    %>
                                <!--     <p class="text-center" style="font-size: 18px;">Không có đơn hàng nào</p> -->
                                    <% 
                                    } 
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% 
                    } 
                    %>
                </div>
                <% 
                } 
                %>
            </div>
        </div>
    </div>

	<%-- <div class="text-center" style="text-align: center;">
	<div style="border: 2px solid #446789;margin: 50px;border-radius: 10px">
		<p style="font-size: 30px">
			Sản phẩm số
			<%=dem1%>:
		</p>
		<div class="row">
			<div class="col-sm-4">
				<img style="width: 100%; margin-left: 10px" alt="" src="<%=dh.getAnh()%> ">
			</div>
			<div class="col-sm-4">
				<div style="display: block">
					<p style="font-size: 40px; font-weight: bold; color: red;height: 60px; overflow: hidden; display: block; text-overflow: ellipsis; white-space: nowrap;"><%=dh.getTenSanPham()%></p>
				</div>
				<div style="display: block">
					<span>Giá: </span>
					<p style="color: red"><%=dh.getDonGiaSP()%>đ
					</p>
				</div>
				<div style="display: block">
					<span>Giảm giá: </span>
					<p style="color: red"><%=dh.getChiecKhau()%>%
					</p>
				</div>
				<div style="display: block">
					<span>Số lượng mua: </span>
					<p style="color: red"><%=dh.getSoLuongMua()%></p>
				</div>
				<div style="display: block">
					<span>Kích thước: </span>
					<p style="color: red"><%=dh.getGhiChuCT()%></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div style="display: block">
					<p style="font-size: 40px; font-weight: bold; color: red"><%=dh.getHoTen()%></p>
				</div>
				<div style="display: block">
					<span>Địa chỉ: </span>
					<p style="color: red"><%=dh.getDiaChi()%>
					</p>
				</div>
				<div style="display: block">
					<span>Email: </span>
					<p style="color: red"><%=dh.getEmail()%>
					</p>
				</div>
				<div style="display: block">
					<span>Số điện thoại: </span>
					<p style="color: red"><%=dh.getSoDT()%></p>
				</div>
				<%if(dh.getTenDN() == null){ %>
				<div style="display: block">
					<span>Tên đăng nhập: </span>
					<p style="color: red">Dùng tài khoản google</p>
				</div>
				<%}else{ %>
				<div style="display: block">
					<span>Tên đăng nhập: </span>
					<p style="color: red"><%=dh.getTenDN()%></p>
				</div>
				<%} %>
				<%if(dh.getTrangThai() == 3){ %>
				<div style="display: block; font-size: 40px">
					<span> </span>
					<p style="color: red">Đã hoàn thành</p>
				</div>
				<%}else{ %>
				<div style="display: block; font-size: 40px">
					<span> </span>
					<p style="color: red">Chưa hoàn thành</p>
				</div>
				<%} %>
			</div>
		</div>
	</div>	 --%>
		<!-- <hr>
		<hr> -->
		
		
	<!-- </div> -->
</body>
</html>