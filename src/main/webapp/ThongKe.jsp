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

.pagination {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.pagination a {
    margin: 0 5px;
    padding: 8px 16px;
    text-decoration: none;
    border: 1px solid #ddd;
    color: #333;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
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
                <h1 class="text-center" style="padding: 20px">Danh sách sản phẩm</h1>
                <div class="container">
                    <!-- <form action="adminThongKeController" method="GET">
                        <div class="form-group">
                            <label for="productName">Tìm kiếm sản phẩm:</label>
                            <input type="text" class="form-control" id="productName" name="productName" placeholder="Nhập tên sản phẩm">
                        </div>
                        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                    </form> -->
                    
                    <div class="container">
					    <h4 class="text-center">Tìm kiếm sản phẩm</h4>
					    <div class="row justify-content-center">
					        <div class="col-md-6">
					            <form action="adminThongKeController" method="post">
					                <div class="form-group">
					                    <input class="form-control" name="productName" type="text" placeholder="Nhập từ khóa tìm kiếm" required="required">
					                </div>
					                <div class="form-group text-center">
					                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
					                </div>
					            </form>
					        </div>
					    </div>
					</div>
                    <div class="row" style="margin-left: 150px">
                        <%
                        ArrayList<sanphamfullbean> dssp = (ArrayList<sanphamfullbean>) request.getAttribute("dssp");
                        if (dssp != null) {
                            for (sanphamfullbean s : dssp) {
                        %>
                        <div class="col-sm-4 col-xs-6 col-md-3 text-center" style="border: 2px solid #446789; border-radius: 10px; padding: 25px; margin: 10px;">
                            <img alt="" src="<%= s.getAnh() %>" style="width: 100%; height: 250px;">
                            <h1 style="font-size: 18px; font-weight: bold; color: red; height: 35px; overflow: hidden; display: block; text-overflow: ellipsis; white-space: nowrap;"><%= s.getTenSanPham() %></h1>
                            <div>
                                <a data-toggle="modal" data-target="#myModalKT<%= s.getMaSanPham() %>" style="display: block; text-decoration: none; cursor: pointer; border: 1px solid; background-color: #ffd43b; padding: 10px; margin: 10px; font-size: 18px; font-weight: bold; border-radius: 10px; color: white">Kích Thước</a>
                                <a data-toggle="modal" data-target="#myModalXCC<%= s.getMaSanPham() %>" style="display: block; text-decoration: none; cursor: pointer; border: 1px solid; background-color: #ffd43b; padding: 10px; margin: 10px; font-size: 18px; font-weight: bold; border-radius: 10px; color: white">Xem chi tiết</a>
                                <a data-toggle="modal" data-target="#myModalAnh<%= s.getMaSanPham() %>" style="display: block; text-decoration: none; cursor: pointer; border: 1px solid; background-color: #ffd43b; padding: 10px; margin: 10px; font-size: 18px; font-weight: bold; border-radius: 10px; color: white;">Ảnh</a>
                            </div>
                        </div>
                        <%
                            }
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="pagination">
        <%
            int currentPage = (int) request.getAttribute("currentPage");
            int totalPages = (int) request.getAttribute("totalPages");
            String keyword = request.getParameter("productName");

            String queryParams = "";
            if (keyword != null) queryParams += "&productName=" + keyword;

            if (currentPage > 1) {
        %>
        <a href="adminThongKeController?page=<%= currentPage - 1 %><%= queryParams %>">&laquo; Quay lại</a>
        <% 
            }
            for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="adminThongKeController?page=<%= i %><%= queryParams %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
        <% 
            }
            if (currentPage < totalPages) {
        %>
        <a href="adminThongKeController?page=<%= currentPage + 1 %><%= queryParams %>">Tiếp theo &raquo;</a>
        <% } %>
    </div>	

	<%
	ArrayList<sanphamfullbean> dssp1 = (ArrayList<sanphamfullbean>) request.getAttribute("dssp");
	if (dssp1 != null) {
		for (sanphamfullbean s : dssp1) {
	%>

	<!-- Modol Kich thước -->
	<div class="containers">
		<div class="modal fade" id="myModalKT<%=s.getMaSanPham()%>"
			role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="font-size: 30px">Thông tin
							kích thước</h4>
					</div>
					<div class="modal-body text-center">
						<%
						ArrayList<KichThuocBean> dskt = (ArrayList<KichThuocBean>) request.getAttribute("dskt");
						if (dskt != null) {
							for (KichThuocBean ds : dskt) {
								if (ds.getMaSanPham() == s.getMaSanPham()) {
						%>
						<div class="text-center"
							style="display: block; text-align: center; margin: 20px">
							<span style="font-size: 18px; margin-right: 20px">Tên kích
								thước:</span><input
								style="color: red; width: 100px; text-align: center; margin-right: 20px"
								value="<%=ds.getTenKichThuoc()%>" disabled="disabled"> <span
								style="font-size: 18px; margin-right: 20px">Số lượng:</span><input
								style="color: red; width: 100px; text-align: center;"
								value="<%=ds.getSoLuongSize()%>" disabled="disabled">
						</div>
						<%
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

	<!-- Modal Xem chi tiết -->
	<div class="containers">
        <div class="modal fade" id="myModalXCC<%=s.getMaSanPham()%>" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <i class="fas fa-times" data-dismiss="modal"></i>
                        <h4 class="modal-title">Thông tin sản phẩm</h4>
                    </div>
                    <div class="modal-body text-center">
                        <%
                        ArrayList<sanphamfullbean> ds = (ArrayList<sanphamfullbean>) request.getAttribute("dssp");
                        if (ds != null) {
                            for (sanphamfullbean ds1 : ds) {
                                if (ds1.getMaSanPham() == s.getMaSanPham()) {
                        %>
                        <div class="text-center product-details">
                            <img alt="" src="<%=ds1.getAnh()%>">
                            <p style="font-size: 30px; color: red">
                                <%=ds1.getTenSanPham()%>
                            </p>
                            <p>
                                <span>Giá nhập:</span>
                                <input value="<%=ds1.getSoLuong()%>đ" disabled="disabled">
                            </p>
                            <p>
                                <span>Giá bán:</span>
                                <input value="<%=ds1.getGia()%>đ" disabled="disabled">
                            </p>
                            <p>
                                <span>Giảm giá:</span>
                                <input value="<%=ds1.getChiecKhau()%>%" disabled="disabled">
                            </p>
                            <p>
                                <span>Thương hiệu:</span>
                                <input value="<%=ds1.getHang()%>" disabled="disabled">
                            </p>
                            <p>
                                <span>Ngày nhập hàng:</span>
                                <input value="<%=ds1.getNgayNhap()%>" disabled="disabled">
                            </p>
                            <p class="mota">
                                <%=ds1.getMoTaSanPham()%>
                            </p>
                        </div>
                        <%
                        }
                        }
                        }
                        %>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



	<!-- Modal Ảnh sản phẩm -->
	<div class="containers">
		<div class="modal fade" id="myModalAnh<%=s.getMaSanPham()%>"
			role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="font-size: 30px">Thông tin ảnh
							minh họa</h4>
					</div>
					<div class="modal-body text-center">
						<%
						ArrayList<AnhBean> anh = (ArrayList<AnhBean>) request.getAttribute("dsAnh");
						if (anh == null) {
						%>
						<h1>Danh sách sản phẩm đang trống</h1>
						<%
						} else {
						int n = anh.size();
						int demsp = 1;
						for (int i = 0; i < n; i++) {
							if (anh.get(i).getMaSanPham() == s.getMaSanPham()) {
						%>
						<div class="text-center" style="text-align: center; margin: 20px">
							<p style="font-size: 30px">
								Ảnh minh họa
								<%=demsp%>:
							</p>
							<img style="width: 50%" alt="" src="<%=anh.get(i).getTenAnh()%> ">
						</div>
						<%
						demsp++;
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

	<%
	}
	}
	%>

</body>
</html>