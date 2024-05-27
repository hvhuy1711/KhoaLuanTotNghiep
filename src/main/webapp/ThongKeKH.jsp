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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
</style>
</head>
<body>
	<div id="main">

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
	</div>

	<div style="padding: 50px"></div>
	<h1 class="text-center" style="padding: 20px">Thống kê sản phẩm</h1>
	<div style="display: flex;justify-content: space-around;margin: 30px 100px">
		<a href="adminThongKeController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px;padding: 10px; background-color: #446879; color: #fff; font-weight: bold;">Thống kê theo sản phẩm</a>
		<a href="adminThongKeKHController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px;padding: 10px; background-color: #446879; color: #fff; font-weight: bold;">Thống kê theo khách hàng</a>
		<a href="adminThongKeDHController" style="border: 2px solid #fff; border-radius: 10px; text-decoration: none; font-size: 18px;padding: 10px; background-color: #446879; color: #fff; font-weight: bold;">Thống kê theo đơn hàng</a>
	</div>
	<h1 class="text-center" style="padding: 20px">Thống kê Khách hàng</h1>
	<div class="container">
		<div class="row">
			<%
			ArrayList<khachhangthibean> dskh = (ArrayList<khachhangthibean>) request.getAttribute("dskh");
			if (dskh != null) {
				for (khachhangthibean s : dskh) {
			%>
			<div class="col-sm-4 col-xs-6 col-md- text-center"
				style="border: 2px solid #446789; border-radius: 10px; padding: 25px">
				<h1 style="font-size: 30px; font-weight: bold; color: red;">Khách
					hàng</h1>
				<h1
					style="font-size: 25px; font-weight: bold; color: red; margin-bottom: 20px"><%=s.getHoTen()%></h1>
				<div style="">
					<a data-toggle="modal"
						data-target="#myModalGH<%=s.getMaKhachHang()%>"
						style="display: block; text-decoration: none; cursor: pointer; border: 1px solid; background-color: #446789; padding: 10px; margin: 10px; font-size: 18px; font-weight: bold; border-radius: 10px; color: white">Giỏ
						hàng</a> <a data-toggle="modal"
						data-target="#myModalXKH<%=s.getMaKhachHang()%>"
						style="display: block; text-decoration: none; cursor: pointer; border: 1px solid; background-color: #446789; padding: 10px; margin: 10px; font-size: 18px; font-weight: bold; border-radius: 10px; color: white">Xem
						chi tiết</a>
				</div>
			</div>

			<!-- Modal giỏ hàng -->
			<div class="containerss">
				<div class="modal fade" id="myModalGH<%=s.getMaKhachHang()%>"
					role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Thông tin sản phẩm</h4>
							</div>
							<div class="modal-body">
								<%
								ArrayList<giospbean> gio = (ArrayList<giospbean>) request.getAttribute("dsgio");
								if (gio == null) {
								%>
								<h1>Danh sách giỏ đang trống</h1>
								<%
								} else {
								int dem = 1;
								for (giospbean ds1 : gio) {
									if (ds1.getMaKhachHang() == s.getMaKhachHang()) {
								%>
								<div class="product-details">
									<p>
										Sản phẩm số
										<%=dem%>:
									</p>
									<div class="row">
										<div class="col-sm-6">
											<img alt="" src="<%=ds1.getAnh()%>">
										</div>
										<div class="col-sm-6">
											<p>
												<span>Tên sản phẩm:</span>
												<%=ds1.getTenSanPham()%></p>
											<p>
												<span>Giá:</span>
												<%=ds1.getGia()%>đ
											</p>
											<p>
												<span>Giảm giá:</span>
												<%=ds1.getChiecKhau()%>%
											</p>
											<p>
												<span>Số lượng mua:</span>
												<%=ds1.getSoLuongMua()%></p>
											<p>
												<span>Kích thước:</span>
												<%=ds1.getGhiChu()%></p>
										</div>
									</div>
									<hr>
									<hr>
								</div>
								<%
								dem++;
								}
								}
								}
								%>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>




			<!-- 	Modal xem xem chi tiết khách hàng -->
	<div class="containers">
	    <div class="modal fade" id="myModalXKH<%=s.getMaKhachHang()%>" role="dialog">
	        <div class="modal-dialog">
	            <!-- Modal content-->
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
	                    <h4 class="modal-title">Thông tin khách hàng</h4>
	                </div>
	                <div class="modal-body text-center">
	                    <%
	                    ArrayList<khachhangthibean> dskh2 = (ArrayList<khachhangthibean>) request.getAttribute("dskh");
	                    if (dskh2 != null) {
	                        for (khachhangthibean d : dskh2) {
	                            if (d.getMaKhachHang() == s.getMaKhachHang()) {
	                    %>
	                    <div class="text-center customer-details">
	                        <p><span>Tên khách hàng:</span><input value="<%=d.getHoTen()%>" disabled="disabled"></p>
	                        <p><span>Địa chỉ:</span><input value="<%=d.getDiaChi()%>" disabled="disabled"></p>
	                        <p><span>Số điện thoại:</span><input value="<%=d.getSoDT()%>" disabled="disabled"></p>
	                        <p><span>Tên đăng nhập:</span><input value="<%=d.getTenDN()%>" disabled="disabled"></p>
	                        <p><span>Email:</span><input value="<%=d.getEmail()%>" disabled="disabled"></p>
	                    </div>
	                    <%
	                    }
	                    }
	                    }
	                    %>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
			<%
			}
			}
			%>
		</div>
	</div>

</body>
</html>