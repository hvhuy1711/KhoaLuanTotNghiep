<%@page import="bean.AnhBean"%>
<%@page import="bean.DanhGiaBean"%>
<%@page import="bean.KichThuocBean"%>
<%@page import="bean.giospbean"%>
<%@page import="bean.sanphamfullbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.khachhangthibean"%>
	
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaispbean"%>
<%@page import="bean.sanphambean"%>
<%@ page import="java.text.DecimalFormat" %>

<%@page import="bo.giospbo"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chi tiết sản phẩm</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="assets/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" href="ChiTietSanPham.css">
<link rel="stylesheet" href="Thongbao.css">
<style type="text/css">
.giohang {
	display: block;
	position: absolute;
	color: #fff;
	background-color: red;
	top: 5px;
	right: 0;
	border-radius: 50%;
	width: 20px;
	height: 20px;
	text-align: center;
}
/* tablet */
@media ( min-width : 739px) and (max-width:1023px) {
	.item {
		margin-top: 55px;
	}
	.header-nav-re {
		display: in;
		float: right;
	}
	.header-img-rps, .header-p-rps {
		display: none;
	}
	.header-input-rps {
		display: none;
	}
}

/* Mobile */
@media ( max-width : 740px) {
	.item {
		margin-top: 55px;
	}
	.header-nav-re {
		display: block;
		float: right;
		color: #fff;
		margin-right: 10px;
	}
	.header-img-rps, .header-p-rps {
		display: none;
	}
	.header-input-rps {
		display: none;
	}
}



/* Basic modal styling */
.modal-dialog {
  max-width: 400px; /* Adjust width as needed */
  margin: 0 auto; /* Center the modal horizontally */
}

.modal-content {
  background-color: #fff; /* White background */
  border-radius: 5px; /* Rounded corners */
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

.modal-header {
  padding: 15px; /* Adjust padding as needed */
  border-bottom: 1px solid #ddd; /* Bottom border */
}

.modal-title {
  font-weight: bold;
  font-size: 18px; /* Adjust font size as needed */
}

.close {
  margin-top: -5px; /* Adjust margin as needed */
  color: #ccc; /* Gray color for close button */
  font-size: 20px; /* Adjust font size as needed */
  opacity: 0.8; /* Semi-transparent close button */
}

.close:hover, .close:focus {
  opacity: 1; /* Fully opaque close button on hover/focus */
  cursor: pointer; /* Indicate clickable behavior */
}

.Form {
  padding: 20px; /* Adjust padding as needed */
}

.FormSV-span {
  display: block; /* Ensure labels are on separate lines */
  margin-bottom: 5px; /* Add some space between labels and inputs */
  font-weight: bold; /* Bold labels for better readability */
}

.FormSV-input {
  width: 100%; /* Make inputs full width */
  padding: 10px; /* Add padding for better user experience */
  border: 1px solid #ccc; /* Light border for inputs */
  border-radius: 3px; /* Rounded corners for inputs */
}

.FormSV-Buttom {
  background-color: #333; /* Darker blue for button */
  color: #fff; /* White text for button */
  border: none; /* Remove border for cleaner look */
  padding: 10px 20px; /* Add padding for button */
  border-radius: 5px; /* Rounded corners for button */
  cursor: pointer; /* Indicate clickable behavior */
  margin-top: 10px; /* Add some space above the button */
}

.FormSV-Buttom:hover {
  background-color: #222; /* Darken button on hover */
}

.modal-footer {
  padding: 10px; /* Adjust padding as needed */
  text-align: center; /* Center footer content */
}

/* Link styling for "Đăng kí" */
.FormSV-span a {
  color: #333; /* Darker blue for link text */
  text-decoration: none; /* Remove underline */
  font-weight: bold; /* Bold link text */
}

.FormSV-span a:hover {
  text-decoration: underline; /* Add underline on hover */
}

.btn-mua:hover {
    color: #fff;
    background-color: #c82333;
    border-color: #bd2130;
}

.containers {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

h2 {
    text-align: center;
}

.reviews {
    margin-top: 20px;
}

.review {
    border: 1px solid #ccc;
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
}

.rating {
    font-size: 20px;
    font-weight: bold;
    color: gold;
}

.reviewer {
    font-style: italic;
    margin-top: 5px;
}

.date {
    font-size: 12px;
    color: #999;
}
.nav-tabs .nav-item {
    margin: 0;
    padding: 0;
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
					style="color: #fff; margin-top: 30px; font-size: 17px;font-weight: bold;">Chào
					mừng bạn đến với Hv Huy Shop</p>
				<form action="sanphamcontroller" method="post" style="">
					<input style="width: 400px; margin-top: 30px; margin-right: 30px;"
						type="text" name="txttim" class="form-control header-input-rps"
						placeholder="Tìm kiếm...">

				</form>
			</div>
			<ul id="nav">
			<li class="active"><a href="sanphamcontroller">Trang Chủ</a></li>
				<li>
                <a href="sanphamcontroller">Sản phẩm <i class="fa-solid fa-caret-down nav-arrow-down"></i></a>
                <ul class="subnav">
                    <% 
                    ArrayList<loaispbean> dsloaiheader = (ArrayList<loaispbean>) request.getAttribute("dsloai");
                    if (dsloaiheader != null) {
                        for (loaispbean l : dsloaiheader) {
                    %>
                    <li>
                        <a style="cursor: pointer; text-decoration: none; font-weight: bold;" href="sanphamcontroller?ml=<%=l.getMaLoai()%>"> 
                            <%=l.getTenLoai()%>
                        </a>
                    </li>
                    <% 
                        } 
                    } 
                    %>
                </ul>
            </li>
				<%
				if (session.getAttribute("dn") == null) {
				%>

				<li class="active"><a href="" data-toggle="modal"
					data-target="#myModal"> <i class="fa-solid fa-cart-shopping"></i>
						Giỏ Hàng
				</a></li>

				<%
				} else {
				%>
				<li class="active"><a href="giospcontroller"><i
						class="fa-solid fa-cart-shopping"></i> Giỏ Hàng</a> <%
				 ArrayList<giospbean> dsgio = (ArrayList<giospbean>)request.getAttribute("dsgio");
				 if (dsgio != null){
					  if (dsgio.size() != 0) {
				 	int n = dsgio.size();
				 	if (n > 0) {
				 %> <span class="giohang"><%=n%></span> <%
				 }
				 }
				 }
				 %></li>

				<%
				}
				%>

				<li><a href="">Thương hiệu <i
						class="fa-solid fa-caret-down nav-arrow-down"></i></a>
					<ul class="subnav">
						<%
						ArrayList<String> dshang = (ArrayList<String>) request.getAttribute("dsHang");
						int nhang = dshang.size();
						if (dshang != null) {
							for (int i = 0;i<nhang ;i++) {
						%>
						<li><a
							style="cursor: pointer; text-decoration: none; font-weight: bold;"
							href="sanphamcontroller?tenhang=<%=dshang.get(i)%>"> <%=dshang.get(i)%>
						</a></li>
						<%
						}
						}
						%>
					</ul></li>
				<%
				if (session.getAttribute("dn") == null) {
				%>
				<li class="active"><a href="" data-toggle="modal"
					data-target="#myModal"> Lịch Sử Mua </a></li>

				<%
				} else {
					%>
				<li class="active"><a href="LichSuMuaController">Lịch Sử
						Mua</a></li>
				<%
				} 
				%>
			</ul>
			<ul class="nav navbar-nav navbar-right ">
				<li>
					<%
					if (session.getAttribute("dn") != null) {
						khachhangthibean kh1 = (khachhangthibean) session.getAttribute("dn");
						if(kh1.getHoTen() != null){
					%> <a href="ThongtinKhachHangController" style="color: white"><span
						style="display: inline-block; width: 20px; background-color: pink; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 600;"><%=kh1.getHoTen().toUpperCase().charAt(0)%></span><%=kh1.getHoTen()%>
				</a> <%
				}
 } else {
 %> <a  href="" data-toggle="modal" data-target="#myModal"
					style="color: #fff; margin-right: 40px;" class="header-nav-re"><i class="fas fa-user" style="font-size: 24px; margin-right: 10px;"></i></a> <%
 }
 %>
				</li>
				<li>
					<%
					if (session.getAttribute("dn") != null) {
					%> <a href="dangxuatcontroller" class=" header-nav-re"
					style="text-decoration: none; color: white;"><span
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

				<li><a href="sanphamcontroller" class="nav-mobile-css">Trang
						Chủ</a></li>
				<li><a href="giospcontroller" class="nav-mobile-css">Giỏ
						Hàng</a></li>
				<li><a href="thanhtoanspcontroller" class="nav-mobile-css">Thanh
						Toán</a></li>
				<li><a href="choxacnhancontroller" class="nav-mobile-css">Chờ
						xác nhận</a></li>
				<li><a href="lichsuspcontroller" class="nav-mobile-css">Lịch
						Sử Mua</a></li>
			</ul>
			<!-- Hiển thị nút bars -->
		</div>

		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Đăng Nhập</h4>
					</div>
					<div class="Form">
						<form style="text-align: center;" action="khachhangcontroller"
							method="post">

							<div style="display: block;; padding: 0 40px 8px">
								<!-- <span class="FormSV-span">Tài Khoản:</span>  -->
								<input class="FormSV-input"
									style="margin: 16px 0 8px 0; width: 100%" type="text"
									name="txtun" placeholder="Nhập tài khoản" required> <br>
							</div>
							<div style="display: block; padding: 0 40px 8px">
								<!-- <span class="FormSV-span">Mật khẩu:</span>  -->
								<input class="FormSV-input"
									style="margin: 16px 0 8px 0; width: 100%" type="Password"
									name="txtpass" placeholder="Nhập Mật Khẩu" required> <br>
							</div>

							<div style="margin-top: 10px; padding: 0 40px 10px">
								<span style="margin-top: 10px">Bạn chưa có tài khoản?<a
									href="" data-toggle="modal" data-target="#myModaldk"
									data-dismiss="modal">Đăng kí</a></span><br>
								<button name="btndn" class="FormSV-Buttom" style="width: 100%">Đăng
									Nhập</button>
								<div
									style="padding-bottom: 14px; display: flex; align-items: center;">
									<div
										style="background-color: #dbdbdb; flex: 1; height: 1px; width: 100%; display: block;"></div>
									<span
										style="color: #ccc; font-size: 15px; padding: 0 16px; text-transform: uppercase;">Hoặc</span>
									<div
										style="background-color: #dbdbdb; flex: 1; height: 1px; width: 100%; display: block;"></div>
								</div>

								<div>
									<a
										href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/BaiThiJava/LoginGoogleHander&response_type=code
		   &client_id=24913803022-pd2qhuqnj4br9qlj7t0qljnk90fks46i.apps.googleusercontent.com&approval_prompt=force">Đăng
										nhập bằng Google<i class="fab fa-google-plus-g"></i>
									</a>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>



		<!-- Hiển thị modal đăng nhập -->
		<!-- 	<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				Modal content
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
		</div> -->
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
								<!-- <span class="FormSV-span">Tài Khoản:</span>  -->
								<input class="FormSV-input" type="text" name="txtun"
									placeholder="Nhập tài khoản" required>
							</div>
							<div style="display: inline-block;">
								<!-- <span class="FormSV-span">Mật khẩu:</span>  -->
								<input class="FormSV-input" type="Password" name="txtpass1"
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
	<div class="notifications"></div>
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkDanhGia") != null) {
		boolean checkDanhGia = (boolean) request.getAttribute("checkDanhGia");
		if (checkDanhGia == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Bạn đã đánh giá thành công sản phẩm');
	</script>
	
	<%}
	}
	%>
	
		<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkSoDt") != null) {
		boolean checkSoDt = (boolean) request.getAttribute("checkSoDt");
		if (checkSoDt == true) {
	%>
		<script type="text/javascript">
			createToast('warning', 'fa-solid fa-circle-exclamation',
					'Cảnh báo',
					'Số điện thoại bạn nhập không hợp lệ');
		</script>
		<%
	}
	}
	%>

<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkEmail") != null) {
		boolean checkEmail = (boolean) request.getAttribute("checkEmail");
		if (checkEmail == true) {
	%>
		<script type="text/javascript">
			createToast('warning', 'fa-solid fa-circle-exclamation',
					'Cảnh báo',
					'Email bạn nhập không hợp lệ');
		</script>
		<%
	}
	}
	%>

<%sanphamfullbean sp = (sanphamfullbean)request.getAttribute("ctsp");
	if(sp != null){
		 /* khachhangthibean kh = (khachhangthibean) session.getAttribute("dn"); 
		if (kh == null ){
			
		} */
%>
	


	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div class="col-sm-6 col-xs-12 col-md-6 text-center product-img">
				<img src="<%=sp.getAnh()%>" alt="Hình ảnh sản phẩm" style="padding-bottom: 10px;display: block;margin: 0 auto;width: 300px">
				<% ArrayList<AnhBean> dsAnh = (ArrayList<AnhBean>)request.getAttribute("dsAnh");
			            if (dsAnh != null){
			                for(int i = 0; i < dsAnh.size(); i++){ %>
			                <div style="display:inline-block;padding-bottom: 10px">
			                 	<img src="<%= dsAnh.get(i).getTenAnh() %>" alt="Image" style="max-width: 130px;padding:10px ; max-height: 130px;margin: 0 auto;">
			                 </div>
			                     <%}} %>       
 				<%-- <div id="myCarousel" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			        <!-- Chỉ mục của các slide -->
			    </ol>
			
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner" role="listbox">
			        <% ArrayList<AnhBean> dsAnh = (ArrayList<AnhBean>)request.getAttribute("dsAnh");
			            if (dsAnh != null){
			                for(int i = 0; i < dsAnh.size(); i++){ %>
			                    <div class="item <%= i == 0 ? "active" : "" %>">
			                        <!-- Thay đổi kích thước của hình ảnh -->
			                        <img src="<%= dsAnh.get(i).getTenAnh() %>" alt="Image" style="max-width: 200px; max-height: 200px;margin: 0 auto;">
			                        <div class="carousel-caption"></div>
			                    </div>
										            <%}} %>
							    </div>
							
							    <!-- Left and right controls -->
							    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
							        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							        <span class="sr-only">Previous</span>
							    </a>
							    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							        <span class="sr-only">Next</span>
							    </a>
							</div>
 --%>            </div>

			<div class="col-sm-6 col-xs-12 col-md-6 product-info ">
			<%khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
			if(kh != null){
			%>
			
			<form action="giospcontroller" method="post" id="themGio">
				<input style="display: none;" form="themGio" value="<%=sp.getMaSanPham()%>" name="ms">
		<%-- 		<input style="display: none;" form="themGio" value="<%=sp.getMaSanPham()%>" name="msTT"> --%>
				<input style="display: none;" form="themGio" value="<%=kh.getMaKhachHang()%>" name="mkh">
				<input style="display: none;" form="themGio" value="<%=sp.getTenSanPham()%>" name="ts">
				<input style="display: none;" form="themGio" value="<%=sp.getAnh()%>" name="anh">
				<input style="display: none;" form="themGio" value="<%=sp.getGia()%>" name="giamoi">
				<input style="display: none;" form="themGio" value="<%=sp.getChiecKhau()%>" name="chieckhau">
				
			</form>
			
			<%} %>
				<h1 style="font-weight: bold"><%=sp.getTenSanPham() %></h1>
				<%
				 long giaLong = sp.getGia();
			    long chiecKhauLong = sp.getChiecKhau();
			    float gia = (float) giaLong;
			    float chiecKhau = (float) chiecKhauLong;
			    float giaSauChiecKhau = gia -( gia * (chiecKhau / 100));

			    // Định dạng giá tiền thành dạng mong muốn
			    DecimalFormat decimalFormat = new DecimalFormat("#,###");
			    String giaFormatted = decimalFormat.format(giaSauChiecKhau);
				%>
				<div style="display: inline-block;">
					<p style="text-decoration: line-through;display:inline-block; opacity: 0.5;font-size: 20px">
									<%=sp.getGia()%>₫
								</p>
				    <p class="price" style="font-size: 30px; margin-left:20px; display: inline-block;">Giá: <%= giaFormatted %>₫</p>
				    <p style="display: inline-block; margin-left: 10px; border: 1px solid #446789;color: white;background-color: #446789"> <%= sp.getChiecKhau() %>% <span>Giảm</span></p>
				</div>
				<p style="font-size: 18px;font-weight: bold; ">Chọn kích thước:</p>
				<ul class="specifications">
					<li>
					<%ArrayList<KichThuocBean> dskt = (ArrayList<KichThuocBean>)request.getAttribute("dskt");
					if(dskt != null){
						int n = dskt.size();
						int index = 0;
						for(int i = 0 ; i < n ; i++){
						%>
						<label for="sizeLabel">
						</label>
						<input 
		                    style="display: inline-block;font-weight: bold; cursor:pointer; border:none; text-align:center; width: 40px; height: 30px; margin-right: 20px;" 
		                    id="sizeInput<%=index%>"  
		                    type="text" 
		                    class = "inputId"
		                    form="themGio" 
		                    name="themGio" 
		                    value="<%=dskt.get(i).getTenKichThuoc()%>" 
		                    data-span-id="quantityDisplay<%=index%>"
		                    data-quantity="<%=dskt.get(i).getSoLuongSize()%>"
		                    readonly
		                    onclick="updateQuantityDisplay(this)" >
		                <input 
		                    style="display: none; border:none; cursor:pointer; text-align:center; width: 40px; height: 30px; margin-right: 20px;" 
		                    id="sizeInputOutput" 
		                    value="<%=dskt.get(0).getTenKichThuoc() %>"
		                    type="text" 
		                    form="themGio" 
		                    name="themGio1" 
		                    readonly
		                >
		                 <input 
		                    style="display: none; border:none; cursor:pointer; text-align:center; width: 40px; height: 30px; margin-right: 20px;" 
		                    id="slInputOutput" 
		                    value="<%=dskt.get(0).getSoLuongSize() %>"
		                    type="text" 
		                    form="themGio" 
		                    name="themGio1" 
		                    readonly
		                >
		               <script>
				function addToCart() {
				    var sizeInput = document.getElementById("sizeInput<%=index%>");
				    var sizeValue = sizeInput.value.trim(); // Lấy giá trị và loại bỏ khoảng trắng từ input
				
				    // Kiểm tra xem input có giá trị hay không
				    if (!sizeValue) {
				        alert("Bạn phải chọn kích thước trước khi thêm vào giỏ hàng");
				        console.log("Người dùng không chọn kích thước trước khi thêm vào giỏ hàng");
				        return false; // Ngăn chặn hành động mặc định của thẻ <a> (chuyển hướng trang)
				    } else {
				        // Thực hiện hành động mặc định của thẻ <a> (chuyển hướng trang)
				        console.log("Đã thêm sản phẩm vào giỏ hàng với kích thước: " + sizeValue);
				        return true;
				    }
				}
				</script>

							<script src="assets/ThemGioHang.js"></script> 
						<%-- <span class="" style="display: inline-block; width: 40px; height: 30px; border: 1px solid black;text-align:center;border-radius: 5px; margin: 10px"><%=ds.getTenKichThuoc() %></span>	 --%>
						<%	
						index ++;
						}
					}%>
					</li>
					<li >
						<p style="font-size: 18px;font-weight: bold; ">Số lượng:</p>
					 	<i style="border: 1px solid;cursor:pointer; margin-left:40px; border-radius: 50px;padding: 3px;background-color: #446789;color: white;" class="fas fa-minus" onclick="decrement()"></i> <!-- Biểu tượng giảm -->
					    <input style="width: 60px; margin-bottom: 20px; display: inline-block; text-align: center;" form="themGio" value="1" name="sl" id="sl" readonly>
					    <i style="border: 1px solid;cursor:pointer; border-radius: 50px;padding: 3px;background-color: #446789;color: white;" class="fas fa-plus" onclick="increment()"></i> <!-- Biểu tượng tăng -->
					</li>
					<li style="font-size: 18px;font-weight: bold;">Hãng: <%=sp.getHang() %></li>
					<li style="font-size: 18px;font-weight: bold;">Mô tả sản phẩm: <%=sp.getMoTaSanPham() %></li>
				</ul>
					<script>
					function getValueOfInput() {
					    var inputElement = document.getElementById('slInputOutput');
					    var value = inputElement.value;
					    return value;
					}

					function increment() {
					    var maxValue = getValueOfInput(); // Lấy giá trị tối đa từ phần tử input
					    var inputElement = document.getElementById('sl');
					    var newValue = parseInt(inputElement.value) + 1;
					    if (newValue <= maxValue) {
					        inputElement.value = newValue;
					    }
					}

					
					    function decrement() {
					        var inputElement = document.getElementById('sl');
					        if (parseInt(inputElement.value) > 1) {
					            inputElement.value = parseInt(inputElement.value) - 1;
					        }
					    }
					</script>
				
			<span id="span" style="color: red; font-size: 30px"></span>
			
				<div class="actions">
					<%
					if (session.getAttribute("dn") == null) {
						%>
						<a class="btn btn-primary add-to-cart" style="font-size: 21px;"
						href="" data-toggle="modal" data-target="#myModal" onclick="addToCart()"
					style="color: #fff; margin-right: 15px;" class="header-nav-re">
									<i class="fa-solid fa-cart-shopping"></i>
									Thêm vào giỏ hàng</a>
					
					<%}else{ 
					/* khachhangthibean kh = (khachhangthibean) session.getAttribute("dn"); */
					%>
					 <a class="btn btn-primary add-to-cart" style="font-size: 21px;" onclick="addToCart()"
					>
					<i class="fa-solid fa-cart-shopping"></i>
					<input style="border: none;background-color: transparent;" type="submit" form="themGio" name="btnThem" value="Thêm vào giỏ hàng">
					</a> 
					<%} %>
					<%if (session.getAttribute("dn") == null){
						%>
						<a data-toggle="modal" data-target="#myModal" class="btn btn-danger buy-now btn-mua" 
							><input style="border: none;background-color: transparent;width: 104px;height: 32px;font-size: 21px;" type="submit" form="themGio" name="btnThem" value="Mua Ngay">
					</a>
						<%}else{ %>
					<a class="btn btn-danger buy-now btn-mua"
							><input style="border: none;background-color: transparent;width: 104px;height: 32px;font-size: 21px;" type="submit" form="themGio" name="btnThem" value="Mua Ngay">
					</a>
					<%} %>
					
				</div>
			</div>
		</div>
	</div>
	</div>
	<hr>
	
	<h1>Danh sách các sản phẩm tương tự</h1>
	<div style="padding: 20px"></div>
		<div class= "container">
		<div class = "row">
	<%ArrayList<sanphamfullbean> dsspTM = (ArrayList<sanphamfullbean>)request.getAttribute("dsspTM");
	if(dsspTM != null){
		for(sanphamfullbean ds : dsspTM){%>
		<a href="chitietsanphamcontroller?ctsp=<%=ds.getMaSanPham()%>&maloai=<%=ds.getMaLoai()%>">
			<div class="col-sm-4 col-xs-6 col-md-3 text-center"
							style="border: 2px solid #446789;border-radius:10px; ">
							<img style="width: 100%;margin-top:5px; border-image: linear-gradient(to bottom, #446789, pink) 1;border: 1px solid; height: 250px;" src="<%=ds.getAnh()%>">
							<div>
								<br>
								<% 		
									double gialq= ds.getGia();
									double chieckhaulq = ds.getChiecKhau();
								    double giaChiecKhau = gialq -( gialq * (chieckhaulq / 100));
					
								    // Định dạng giá tiền thành dạng mong muốn
								    String giaFormattedlq = decimalFormat.format(giaChiecKhau);
								   %>
								<p
									style="font-size: 15px; font-weight: bold; height: 20px;color: #45a049; overflow: hidden; display: block; text-overflow: ellipsis; white-space: nowrap;"><%=ds.getTenSanPham()%></p>
								<div style="display: inline-block;">
									<p style="text-decoration: line-through; opacity: 0.5;display: inline-block;">
										<%=ds.getGia()%>₫</p>
									<p style="display: inline-block;"> <span style="display: block;position: absolute;color: #fff;background-color: red;font-weight:bold; top: 5px;right: 5px;border-radius: 50%;width: 40px;height: 40px;line-height:40px; text-align: center;">-<%=ds.getChiecKhau() %>%</span> </p>
								</div>
								<p style="color: red; font-size: 17px;">
									Giá bán:
									<%=giaFormattedlq%>₫
								</p>
								<br>
								<hr>
							</div>
						</div>
		</a>
				
					<%}
	}
	%>
			</div>
		
		</div>
	
<hr>
 <h1 class= "text-center">Đánh giá sản phẩm</h1>
	<div class="product-info-tabs" style="background-color: #bcd8e5">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			
			<li class="nav-item"><a class="nav-link" id="review-tab" style="font-weight: bold;"
				data-toggle="tab" href="#review" role="tab" aria-controls="review"
				aria-selected="false">Đánh Giá </a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="description"
				role="tabpanel" aria-labelledby="description-tab">Bảng size bên shop cho các bạn tham khảo:</div>
		<div class="tab-pane fade" id="review" role="tabpanel"
				aria-labelledby="review-tab">
				<form class="review-form" action="DanhGiaController" method="post">
					<div class="form-group">
						<label>Đánh giá của bạn</label>
						<div class="reviews-counter">
							<div class="rate">
								<input type="radio" id="star5" name="rate" value="5" required onchange="updateRating(this.value)" />
								<label for="star5" title="text">5 stars</label>
								<input type="radio" id="star4" name="rate" value="4" required onchange="updateRating(this.value)" />
								<label for="star4" title="text">4 stars</label>
								<input type="radio" id="star3" name="rate" value="3" required onchange="updateRating(this.value)" />
								<label for="star3" title="text">3 stars</label>
								<input type="radio" id="star2" name="rate" value="2" required onchange="updateRating(this.value)" />
								<label for="star2" title="text">2 stars</label>
								<input type="radio" id="star1" name="rate" value="1" required onchange="updateRating(this.value)" />
								<label for="star1" title="text">1 star</label>
								<!-- Thẻ input để lưu trữ số sao đã chọn -->
								<input type="text" name="sosao" id="sosao" value="" style="display: none;">
									<input type="text" name="masp" id="masp" value="<%=sp.getMaSanPham() %>" style="display: none;">
									<input type="text" name="maloai" id="maloai" value="<%=sp.getMaLoai() %>" style="display: none;">
								<script>
								    function updateRating(value) {
								        // Lấy thẻ input theo id và gán giá trị được chọn từ radio button vào
								        document.getElementById("sosao").value = value;
								    }
								</script>

							</div>
						</div>
					</div>
					<hr>
					<div class="form-group">
						<label>Nội Dung</label>
						<textarea name="nd" class="form-control" rows="10" name="comment" required="required"></textarea>
					</div>
					<%ArrayList<khachhangthibean> dskh = (ArrayList<khachhangthibean>)request.getAttribute("dskh");
					khachhangthibean kh1 = (khachhangthibean)session.getAttribute("dn");
					if(dskh !=null){
						for(khachhangthibean ds : dskh){
							if (ds.getMaKhachHang() == kh1.getMaKhachHang()){%>
								
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" name="" disabled="disabled" class="form-control" value="<%=ds.getHoTen() %>"
									placeholder="Họ và tên*">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group"> 
							<%if(ds.getEmail() == null){ %>
								<input type="text" name="" disabled="disabled" class="form-control" value="<%=ds.getEmail() %>"
									placeholder="Email Id*">
									<%}else{ %>
									<input type="text" name="" disabled="disabled" class="form-control" value="Không có"
									placeholder="Email Id">
									<%} %>
							</div>
						</div>
					</div>
							<%}
						}
					}
					%>
					<%if(session.getAttribute("dn") == null){ %>
					<div style="display: flex;justify-content: flex-end; align-items: center;">
						<button style="border: 2px solid; padding: 10px;border-radius: 10px;font-weight: bold;" data-toggle="modal"
					data-target="#myModal" class="round-black-btn">Gửi Bình Luận</button>
					</div>
					<%}else{ %>
					<div style="display: flex;justify-content: flex-end; align-items: center;">
						<button style="border: 2px solid; padding: 10px;border-radius: 10px;font-weight: bold;" class="round-black-btn">Gửi Bình Luận</button>
					</div>
					<%} %>
				</form>
			</div>
		</div>
	</div>
	
	<%} %>
	
	<%ArrayList<DanhGiaBean> dsdg = (ArrayList<DanhGiaBean>)request.getAttribute("dsdg");
	if(dsdg!=null){%>
		    <h1 class= "text-center">Danh sách sản phẩm</h1>
	<%
	for(DanhGiaBean ds : dsdg){%>
		<div class="containers">
		    <div class="reviews">
		        <div class="review">
		        	<div  style="display: flex;justify-content: space-between;">
			        	<div> 
			        	<%ArrayList<khachhangthibean> dskh = (ArrayList<khachhangthibean>)request.getAttribute("dskh");
			        	if(dskh != null){
			        		for(khachhangthibean ds1 : dskh){
			        			if (ds1.getMaKhachHang() == ds.getMaKhachHang()){%>
			        		
				            <div class="reviewer"  style="font-size: 26px"><%=ds1.getHoTen()%></div>
			        		<%
			        			}
			        		}
			        	}
			        	%>
				            <div class="rating">
							    <% for (int i = 0; i < ds.getSoSao(); i++) { %>
							        <i class="fas fa-star"></i>
							    <% } %>
							    <% for (int i = 0; i < 5 - ds.getSoSao(); i++) { %>
							        <i class="far fa-star"></i>
							    <% } %>
							    <%= ds.getSoSao() %> sao
							</div>
			           </div>
			            <div>
			            	<div class="date" style="padding: 10px 10px 0 0;"><%=ds.getNgayDanhGia() %></div>
			            </div>
		        	</div>
		        	<hr>
			         <span style="opacity: 0.5">Nội dung đánh giá:</span> 
		            <div class="reviewer" style="font-size: 26px"><%=ds.getNoiDungDanhGia() %></div>
		        </div>
		        <!-- Thêm các đánh giá khác ở đây -->
		    </div>
		</div>
	<%}}%>
	
	
	<div id="footer" class="footer-contact"
		style="background-color: #446879; color: white;">
		<h2 class="section-heading" style="text-align: center;">
			LIÊN HỆ <i class="fa-solid fa-phone"></i>
		</h2>
		<div class="logo-item">
			<a class="logo logo-fb " href="https://www.facebook.com/"> <i
				class="fa-brands fa-facebook"></i>
			</a> <a class="logo logo-yt" href="https://www.youtube.com/"> <i
				class="fa-brands fa-youtube"></i>
			</a> <a class="logo logo-twitter" href=""> <i
				class="fa-brands fa-twitter"></i>
			</a> <a class="logo logo-inta"
				href="https://www.instagram.com/hvhuy_1711/"> <i
				class="fa-brands fa-instagram"></i>
			</a> <a class="logo logo-phone" href=""> <i
				class="fa-solid fa-phone-volume"></i>
			</a>
		</div>

		<div class="gird">
			<div style="border-bottom: 1px solid #ccc; color: white;" class="row">
				<div class="col-md-3 col-sm-6 col-xs-12  footer-item">
					<h1 class="footer-product footer-group" style="color: white;">Sản
						Phẩm</h1>
					<a href="#Ao" class="footer-ao footer-group" style="color: white;">Áo</a>
					<a href="#Giay" class="footer-giay footer-group"
						style="color: white;">Giày</a> <a href="#PhuKien"
						class="footer-phukien footer-group" style="color: white;">Phụ
						Kiện</a> <a href="#tour" class="footer-ve footer-group"
						style="color: white;">Khác</a>

				</div>

				<div class="col-md-3 col-sm-6 col-xs-12  footer-item">
					<h1 class="footer-info footer-group " style="color: white;">Thông
						Tin</h1>
					<a href="#content" class="footer-fb footer-group"
						style="color: white;">Giới Thiệu</a>
					<p class="footer-fb footer-group" style="color: white;">Thông
						tin sản phẩm</p>
					<p class="footer-tw footer-group" style="color: white;">Thông
						tin khách hàng</p>
					<p class="footer-phukien footer-group" style="color: white;">Thông
						tin Liên Hệ</p>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12  footer-item">
					<h1 class="footer-tt" style="color: white;">Thanh Toán</h1>
					<a class="footer-pay"> <img src="./ASSETS/logo/MoMo_Logo1.png"
						alt="" class="footer-momo-img">
						<p class="footer-text" style="color: white;">Momo</p>
					</a> <a href="" class="footer-pay"> <img
						src="./ASSETS/logo/logo-visa.jpg" alt="" class="footer-momo-img">
						<p class="footer-text" style="color: white;">Visa</p>
					</a> <a href="" class="footer-pay"> <img
						src="./ASSETS/logo/Logo-VietinBank.webp" alt=""
						class="footer-momo-img">
						<p class="footer-text" style="color: white;">Vietinbank</p>
					</a> <a href="" class="footer-pay"> <img
						src="./ASSETS/logo/Icon-Vietcombank.webp" alt=""
						class="footer-momo-img">
						<p class="footer-text" style="color: white;">Vietcombank</p>
					</a>
					<!-- <a href="" class="footer-pay">
                            <img src="./ASSETS/logo/icon-MB.png" alt="" class="footer-momo-img">
                            <p class="footer-text">MB Bank</p>
                        </a> -->

				</div>

				<div class="col-md-3 col-sm-6 col-xs-12  footer-item">
					<h1 class="footer footer-group" style="color: white;">Hỗ Trợ</h1>
					<a class="footer-Evaluate footer-group js-buy-btn-Evaluate "
						style="color: white;">Đánh Giá</a>
					<div class="modal-Evaluate js-modal-Evaluate">
						<div class="modal-container-Evaluate js-modal-container-Evaluate">
							<div class="modal-close-Evaluate js-modal-close-Evaluate">
								<i class="ti-close"></i>
							</div>

							<header class="modal-header-Evaluate">
								<i class="modal-headig-icon-Evaluate ti-pencil-alt"></i> Đánh
								Giá
							</header>

							<div class="modal-body-Evaluate">
								<label for="ticket-quanlity-Evaluate"
									class="modal-label-Evaluate"> <i class="ti-comment-alt"></i>
									Chọn phần đánh giá?
								</label> <input id="ticket-quanlity-Evaluate" type="text"
									class="modal-input-Evaluate" placeholder="Nhập ở đây...">

								<label for="text-email" class="modal-label"> <i
									class="ti-pencil"></i> Nội dung đánh giá?
								</label> <input id="text-email-Evaluate" type="email"
									class="modal-input-Evaluate" placeholder="Nhập nội dung...">

								<label for="ticket-quanlity-Evaluate"
									class="modal-label-Evaluate"> <i class="ti-email"></i>
									Email liên hệ?
								</label> <input id="ticket-quanlity-Evaluate" type="text"
									class="modal-input-Evaluate" placeholder="Nhập email...">

								<button id="buy-ticket-Evaluate">
									Đánh giá <i class="ti-pencil-alt"></i>
								</button>
							</div>
							<footer class="modal-footer-Evaluate">
								<input name="mail" type="checkbox" value="mail" /> Chúng tôi sẽ
								gữi phản hồi vào email của bạn!!!<br />
								<!-- <p class="modal-help-Evaluate"> Cần <a href="">Trợ giúp?</a></p> -->
							</footer>
						</div>
					</div>

					<a href="" class="footer-DK footer-group" style="color: white;">Điều
						Khoản</a> <a href="" class="footer-PK footer-group"
						style="color: white;">Câu Hỏi Thường Gặp</a> <a href=""
						class="footer-Help footer-group" style="color: white;">Trợ
						Giúp</a>

				</div>
			</div>
			<div style="padding-top: 15px; text-align: center;">
				<div style="text-align: center;">
					<img style="width: 50px" alt="" src="baithijava/logotc4.jpg">
					<p>Hv Huy Shop</p>
				</div>
				<span style="font-size: 20px">Cung cấp các mặt hàng chất
					lượng</span>
			</div>
		</div>
	</div>

</body>
</html>


