<%@page import="bean.DonHangDaDatBean"%>
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
					style="color: #fff; margin-top: 30px; font-size: 17px;">Chào
					mừng bạn đến với Hv Huy Shop</p>
				<form action="sanphamcontroller" method="post" style="">
					<input style="width: 400px; margin-top: 30px; margin-right: 30px;"
						type="text" name="txttim" class="form-control header-input-rps"
						placeholder="Tìm kiếm...">

				</form>
			</div>
			<ul id="nav">
				<!--  <li class="active">
                <a href="sanphamcontroller"><img alt="" src="baithijava/logotc4.jpg" style=" width: 50px;height: 50px;"></a></li> -->
				<li class="active"><a href="sanphamcontroller">Trang Chủ</a></li>
				<li><a href="sanphamcontroller">Sản phẩm <i
						class="fa-solid fa-caret-down nav-arrow-down"></i></a>
					<ul class="subnav">
						<%
						ArrayList<loaispbean> dsloaiheader = (ArrayList<loaispbean>) request.getAttribute("dsloai");
						if (dsloaiheader != null) {
							for (loaispbean l : dsloaiheader) {
						%>
						<li><a
							style="cursor: pointer; text-decoration: none; font-weight: bold;"
							href="sanphamcontroller?ml=<%=l.getMaLoai()%>"> <%=l.getTenLoai()%>
						</a></li>

						<%
						}
						}
						%>
					</ul></li>
					<%
					if (session.getAttribute("dn") == null) {
						%>
					
					<li class="active"><a href="" data-toggle="modal" data-target="#myModal">
									<i class="fa-solid fa-cart-shopping"></i>
									Giỏ Hàng </a></li>
									
							<%}else{ %>		
				<li class="active"><a href="giospcontroller"><i class="fa-solid fa-cart-shopping"></i>
				Giỏ Hàng</a> <%
 ArrayList<giospbean> dsgio = new ArrayList<giospbean>();
 if (dsgio.size() != 0) {
 	int n = dsgio.size();
 	if (n > 0) {
 %> <span class="giohang"><%=n%></span> <%
 }
 }
 %></li>
 
 <%} %>
<li><a href="">Thương hiệu <i
						class="fa-solid fa-caret-down nav-arrow-down"></i></a>
					<ul class="subnav">
						<%-- <%
						ArrayList<sanphamfullbean> dssp = (ArrayList<sanphamfullbean>) request.getAttribute("dssanpham");
						if (dssp != null) {
							for (sanphamfullbean l : dssp) {
						%> --%>
						<li><a
							style="cursor: pointer; text-decoration: none; font-weight: bold;"
							href="sanphamcontroller?hang=Nike"> Nike
						</a></li>
						<li><a
							style="cursor: pointer; text-decoration: none; font-weight: bold;"
							href="sanphamcontroller?hang=Adidas"> Adidas
						</a></li>

						<%-- <%
						}
						}
						%> --%>
					</ul></li>
				<!-- <li><a href="thanhtoanspcontroller">Thanh Toán</a></li>
				<li><a href="choxacnhancontroller">Chờ xác nhận</a></li>
				<li><a href="lichsuspcontroller">Lịch Sử Mua</a></li> -->
				<!-- <li><a href="SignUPIN.jsp">Sign in</a></li> -->

				<!-- <li>
               <a  class="footer-Evaluate footer-group js-buy-btn-Evaluate ">Đánh Giá</a></li>   -->
			</ul>
			<ul class="nav navbar-nav navbar-right ">
				<li>
					<%
					if (session.getAttribute("dn") == null) {
					%> <a href="" data-toggle="modal" data-target="#myModaldk"
					style="color: #fff; margin-right: 15px;" class="header-nav-re"><span
						class="glyphicon glyphicon-user"
						style="color: #fff; margin-right: 15px;"></span> Đăng kí</a> <%
 }
 %>
				</li>
				<li>
					<%
					if (session.getAttribute("dn") != null) {
						khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
					%> <a a href="ThongtinKhachHangController" style="color: white"><span
						style="display: inline-block; width: 20px; background-color: pink; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 600;"><%=kh.getHoTen().toUpperCase().charAt(0)%></span><%=kh.getHoTen()%>
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
					if (session.getAttribute("dn") != null) {
					%> <a href="dangxuatcontroller" class=" head er-nav-re"><span
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
				<%-- <li >
			        <%
			      		if (session.getAttribute("dn") == null){%>
			      			<a href="" data-toggle="modal" data-target="#myModaldk" style="color: #fff;margin-right: 15px; " class="header-nav-re nav-mobile-css"><span class="glyphicon glyphicon-user" style="color: #fff;margin-right: 15px;"></span> Đăng kí</a>    	      	
			      	<%}%>
		      	</li>
		        <li>
		       		 <%
						//session.removeAttribute("dn")
						if (session.getAttribute("dn") != null){ 
							String tenkh = (String)session.getAttribute("dn");
						%>
						<a href = "" style="color:white"><span style=" display: inline-block;width: 20px; background-color: pink; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 600;" ><%=tenkh.toUpperCase().charAt(0)%></span><%=tenkh %> </a> 
						<%}else{%>
						 <a href="" data-toggle="modal" data-target="#myModal" style="color: #fff;margin-right: 15px;" class="nav-mobile-css header-nav-re"><span class="glyphicon glyphicon-log-in" ></span> Đăng nhập</a>
					<%} %>
				</li>
				<li>
		         	<%	if (session.getAttribute("dn") != null){%>
		      		<a href="dangxuatcontroller" class= "nav-mobile-css header-nav-re"><span class="glyphicon glyphicon-log-in"></span> Đăng xuất</a>	    
		      		<%}%>
		      	</li> --%>

			</ul>

			<!--  <div class="search-btn">
            <i class="search-icon ti-search"></i>
        </div> -->

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
								<button class="FormSV-Buttom" style="width: 100%">Đăng
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
	if (request.getAttribute("chechDanhGia") != null) {
		boolean chechDanhGia = (boolean) request.getAttribute("chechDanhGia");
		if (chechDanhGia == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Bạn đã đánh giá thành công sản phẩm');
	</script>
	<%
	}
	}
	%>

<%DonHangDaDatBean sp = (DonHangDaDatBean)request.getAttribute("dsspma");
	if(sp != null){
		 /* khachhangthibean kh = (khachhangthibean) session.getAttribute("dn"); 
		if (kh == null ){
			
		} */
	
%>
<div style="padding: 50px"></div>
<h1 style="margin-left: 40px;color: red">Sản phẩm</h1>
<div class = "row">
	<div class="col-sm-1"></div>
	<div class="col-sm-3">
		<img style="width: 100%" alt="" src="<%=sp.getAnh()%>">
	</div>
	<div class="col-sm-8">
		<div>
			<h3 style="font-size: 40px"><%=sp.getTenSanPham()%></h3>
		</div>
		<%
        double giassp = sp.getDonGiaSP();
        double chiecKhausp = sp.getChiecKhau();
        double thanhTientt = (giassp * (1 - (chiecKhausp / 100)));
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
     	String tongTienFormatted = decimalFormat.format(thanhTientt); %>
			<p><span>Giá;</span> <%=tongTienFormatted%></p>
			<p><span>Số lượng:</span> <%=sp.getSoLuongMua() %></p>
			<p><span>Thương hiệu:</span> <%=sp.getHang()%></p>
			<p><span>Ngày đặt đơn:</span> <%=sp.getNgayMua()%></p>
			<p><span>Kích thước:</span> <%=sp.getGhiChuCT()%></p>
	</div>
</div>
<h1 style="margin-left: 40px;color: red">Đánh giá sản phẩm ở phía dưới</h1>
<div class="product-info-tabs" style="background-color: #bcd8e5">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <!-- <li class="nav-item"><a class="nav-link active"
            id="description-tab" data-toggle="tab" href="#description"
            role="tab" aria-controls="description" aria-selected="true">Mô
                Tả</a></li> -->
        <li class="nav-item" style="font-size: 18px;font-weight: bold;"><a class="nav-link" id="review-tab"
            data-toggle="tab" href="#review" role="tab" aria-controls="review"
            aria-selected="false">Đánh Giá </a></li>
    </ul>

    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="review" role="tabpanel"
            aria-labelledby="review-tab">
            <form class="review-form" action="DanhGiaSPController" method="get">
                <div class="form-group">
                    <label>Đánh giá của bạn</label>
                    <div class="reviews-counter">
                        <div class="rate">
                            <input type="radio" id="star5" name="rate" value="5" onchange="updateRating(this.value)" />
                            <label for="star5" title="text">5 stars</label>
                            <input type="radio" id="star4" name="rate" value="4" onchange="updateRating(this.value)" />
                            <label for="star4" title="text">4 stars</label>
                            <input type="radio" id="star3" name="rate" value="3" onchange="updateRating(this.value)" />
                            <label for="star3" title="text">3 stars</label>
                            <input type="radio" id="star2" name="rate" value="2" onchange="updateRating(this.value)" />
                            <label for="star2" title="text">2 stars</label>
                            <input type="radio" id="star1" name="rate" value="1" onchange="updateRating(this.value)" />
                            <label for="star1" title="text">1 star</label>
                            
                            <!-- Thẻ input để lưu trữ số sao đã chọn -->
                            <input type="text" name="sosao" id="sosao" value="" style="display: none;">
                                <input type="text" name="masp" id="masp" value="<%=sp.getMaSanPham() %>" style="display: none;">
                            <script>
                                function updateRating(value) {
                                    // Lấy thẻ input theo id và gán giá trị được chọn từ radio button vào
                                    document.getElementById("sosao").value = value;
                                }
                            </script>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Nội Dung</label>
                    <textarea name="nd" class="form-control" rows="10" name="comment"></textarea>
                </div>
                <% ArrayList<khachhangthibean> dskh = (ArrayList<khachhangthibean>)request.getAttribute("dskh");
                khachhangthibean kh1 = (khachhangthibean)session.getAttribute("dn");
                if(dskh !=null){
                    for(khachhangthibean ds : dskh){
                        if (ds.getMaKhachHang() == kh1.getMaKhachHang()){ %>
                            
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="" disabled="disabled" class="form-control" value="<%=ds.getHoTen() %>"
                                placeholder="Họ và tên*">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group"> 
                        <% if(ds.getEmail() == null){ %>
                            <input type="text" name="" disabled="disabled" class="form-control" value="<%=ds.getEmail() %>"
                                placeholder="Email Id*">
                                <% } else { %>
                                <input type="text" name="" disabled="disabled" class="form-control" value="Không có"
                                placeholder="Email Id">
                                <% } %>
                        </div>
                    </div>
                </div>
                        <% }
                    }
                } %>
               <div style="display: flex;justify-content: flex-end; align-items: center;">
                <button class="round-black-btn" style="">Gửi Bình Luận</button>
               </div>
               
            </form>
        </div>
    </div>
</div>

	<%} %>
<%-- 	
	
		    <h1 class= "text-center">Đánh giá sản phẩm</h1>
	<%ArrayList<DanhGiaBean> dsdg = (ArrayList<DanhGiaBean>)request.getAttribute("dsdg");
	if(dsdg!=null){
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
	<%}}%> --%>
	
	
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


