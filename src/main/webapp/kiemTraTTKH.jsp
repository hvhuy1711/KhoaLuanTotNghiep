<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.khachhangthibean"%>
<%@page import="bo.giospbo"%>

<%@page import="bean.giospbean"%>
<%@page import="bean.loaispbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="assets/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" href="index.css">
<style type="text/css">
/* tablet */
@media ( min-width : 739px) and (max-width:1023px) {
	.item {
		margin-top: 55px;
	}
	.header-nav-re {
		display: block;
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

.disabled {
    pointer-events: none;
    opacity: 0.5;
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
					%> <a href="ThongtinKhachHangController" style="color: white"><span
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
		
	<%
	if (request.getParameter("kt") != null) {
	%>
	<script type="text/javascript">
		alert('Vui lòng đăng nhập lại!');
	</script>
	<%
	}
	%>

	<!-- Body -->

	<div class="container text-center">
		<div class="row content">
			<div class="col-sm-12 text-left">
				<h2 style="margin-top: 120px;">Danh sách thanh toán</h2>
				<%
				//hiển thị giỏ hàng
				//if(request.getAttribute("dsSpThanhToan")!=null){
				/* 	giospbean dsthanhtoan =(giospbean) request.getAttribute("giosp"); */
				 ArrayList<giospbean> dsthanhtoan = (ArrayList<giospbean>) request.getAttribute("dsgio");
				request.setAttribute("dsthanhtoan", dsthanhtoan); 
				if (dsthanhtoan != null) {
					long tongtien = 0;
					for (giospbean ds : dsthanhtoan){
				%>
				<%khachhangthibean kh2 = (khachhangthibean) session.getAttribute("dn"); %>
				<input form="capnhat-<%=kh2.getMaKhachHang()%>" style="display: none" name="masp" value="<%=ds.getMaSanPham()%>">
				<input form="capnhat-<%=kh2.getMaKhachHang()%>" style="display: none" name="kichthuoc" value="<%=ds.getGhiChu()%>">
				<div class="row" style="display: block;">
					<div class="col-sm-2">
						<img style="width: 100%" alt="" src="<%=ds.getAnh()%>">
					</div>
					<div class="col-sm-10">
						<h3><%=ds.getTenSanPham()%></h3>
						<% 		
									  long giaLong = ds.getGia();
								    long chiecKhauLong = ds.getChiecKhau();
								    float gia = (float) giaLong;
								    float chiecKhau = (float) chiecKhauLong;
								    float giaSauChiecKhau = gia -( gia * (chiecKhau / 100));
					
								    // Định dạng giá tiền thành dạng mong muốn
								    DecimalFormat decimalFormat = new DecimalFormat("#,###");
								    String giaFormatted = decimalFormat.format(giaSauChiecKhau);
								   %>
						<p style="display: inline-block;">
							Giá:
							<%=giaFormatted%>₫</p>
						x
						<form style="display: inline-block;"
							id="capnhat-<%=ds.getTenSanPham()%>" action="giospcontroller"
							method="post">
							<input form="capnhat-<%=ds.getTenSanPham()%>"
								style="width: 60px; margin-bottom: 20px; display: inline-block;text-align: center;"
								name="soluong" disabled="disabled" type="text"
								value="<%=ds.getSoLuongMua()%>">
						</form>
						
						<div>
							<span>Kích thích: </span>
							<input 
							style="width: 60px; margin-bottom: 20px; display: inline-block;text-align: center;"
							name="kichthuoc" disabled="disabled" type="text"
							value="<%=ds.getGhiChu()%>">
						</div>
					</div>
				</div>
				 <%
				 	double soLuongMua = ds.getSoLuongMua();
			        double giassp = ds.getGia();
			        double chiecKhausp = ds.getChiecKhau();
			        double thanhTien = soLuongMua * (gia - (gia * (chiecKhau / 100)));
        			tongtien += thanhTien; 
        					%> 
        			<%} %>
        			<%DecimalFormat decimalFormat = new DecimalFormat("#,###");
        			String tongTienFormatted = decimalFormat.format(tongtien); %>
				<p
					style="font-size: 20px; font-weight: 600; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; padding-top: 20px; padding-bottom: 20px; padding-right: 80px;">
					Tổng tiền:
					<%=tongTienFormatted%>
					₫
				</p>
				
				<%}
				%>
			</div>
		</div>
	</div>
	<!-- 	<div class = "container text-center" style=" display:block; padding: 30px; border: 1px solid #ccc; box-shadow: 2px">
 		<h2 style="padding-bottom: 10px">Thông tin của bạn</h2>
 		
 		<form>
		    <div class="form-group row">
		      <div class="col-xs-6">
		      	<label for="pwd">Nhập họ tên:</label>
		        <input class="form-control" id="ex1" type="text" placeholder="Họ Và Tên">
		      </div>
		      <div class="col-xs-6" style="float: right;">
		      	<label for="pwd">Nhập số điện thoại:</label>
		        <input class="form-control" id="ex2" type="text" placeholder="Số điện thoại" >
		      </div>
		    </div>
		      <div style="">
		      	<label for="pwd">Nhập email:</label>
		        <input class="form-control" id="ex2" type="email" placeholder="Email" >
		      </div>
		  </form>
 	</div> -->
<h1 style="color: red;text-align: center;">Bạn phải kiểm tra thông tin giao hàng trước</h1>
	<div class="container text-center"
		style="display: block; padding: 30px; border: 1px solid #ccc;border-radius: 20px; box-shadow: 2px">
		<h2 style="padding-bottom: 10px">Thông tin giao hàng <span style="color: red;">(*)</span></h2>
		
		<%khachhangthibean kh1 = (khachhangthibean) session.getAttribute("dn"); %>
		<form action="CNTTKhachHangController" id="capnhat-<%=kh1.getMaKhachHang()%>" method="post">
			<div class="form-group row">
				<div class="col-xs-6">
					<label style="float: left;" for="pwd">Nhập họ tên người nhận<span style="color: red;">(*)</span>:</label> 
					<%if(kh1.getHoTen() != null){%>
					<input
						class="form-control" id="ex1" type="text" placeholder="Họ Và Tên" name = "hoten"
						form="capnhat-<%=kh1.getMaKhachHang()%>" value="<%=kh1.getHoTen()%>" required="required">
					<%}else{ %>
					<input
						class="form-control" id="ex1" type="text" placeholder="Họ Và Tên" name = "hoten"
						form="capnhat-<%=kh1.getMaKhachHang()%>" value="" required="required">
					<%} %>
				</div>
				<div class="col-xs-6" style="float: right;">
					<label for="pwd" style="float: left;">Nhập số điện thoại người nhận<span style="color: red;">(*)</span>:</label> 
					<%if(kh1.getSoDT() != null){%>
					<input name ="sodt"
						class="form-control" id="ex2" type="text" value="<%=kh1.getSoDT()%>" form="capnhat-<%=kh1.getMaKhachHang()%>"
						placeholder="Số điện thoại" required="required">
						
						<%}else{ %>
						
						<input name ="sodt"
						class="form-control" id="ex2" type="text" value="" form="capnhat-<%=kh1.getMaKhachHang()%>"
						placeholder="Số điện thoại" required="required">
						
						<%} %>
				</div>
				<div class="col-xs-6">
					<label for="pwd" style="float: left;">Nhập địa chỉ nhà cụ thể<span style="color: red;">(*)</span>:</label> 
					<%if(kh1.getDiaChi() != null){%>
					<input name="diachi"
						class="form-control" id="ex2" type="text" value="<%=kh1.getDiaChi() %>" form="capnhat-<%=kh1.getMaKhachHang()%>"
						placeholder="Địa chỉ nhận" required="required">
						<%}else{ %>
						<input name="diachi"
						class="form-control" id="ex2" type="text" value="" form="capnhat-<%=kh1.getMaKhachHang()%>"
						placeholder="Địa chỉ nhận" required="required">
						<%} %>
				</div>
				<div class="col-xs-6" style="float: right; margin-bottom: 20px">
					<label for="pwd" style="float: left;">Email:</label> <input class="form-control"
						id="ex2" type="text" value="<%=kh1.getEmail() %>" readonly placeholder="Ghi chú">
				</div>
				<div class = "col-xs-12 center" style="margin-top: 25px ">
					<a style="padding: 15px 73px;font-size: 16px; font-weight:bold; background-color: #446879; color: #fff; border-radius: 5px; text-decoration: none; margin: 20px 10px 20px 0">
						<input form="capnhat-<%=kh1.getMaKhachHang()%>" type="submit"
						name="btncn" value="Cập nhật" style="border: none;background: #446879;font-weight: bold;color: white; ">
					</a>
				</div>
			</div>
		</form>
	</div>
	<div class="notifications"></div>
		<script src="assets/ThongBao.js"></script>
		<%if (request.getAttribute("checkUpdateTT") != null) {
			boolean checkUpdateTT = (boolean) request.getAttribute("checkUpdateTT");
			if (checkUpdateTT == true) {
		%>
		<script type="text/javascript">
			 createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
					'Cập nhật thành công'); 
		</script>
		<%
		} 
		} %>
	
	<div style="padding: 20px"></div>

<%ArrayList<giospbean> dsgio = (ArrayList<giospbean>)request.getAttribute("dsgio"); 
		if(dsgio != null){
			for(giospbean ds : dsgio){
		
			%>
	<div
	<%-- <%khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
	 if (kh != null){
		 if(kh.getEmail() != null )
	 }
	%> --%>
		style="display: block; float: right; padding: 20px; margin: 20px">
			<div id= "ttdathang" style=" margin-bottom: 50px;">
				<a style="padding: 15px 73px;font-size: 16px; font-weight:bold; background-color: red; color: #fff; border-radius: 5px; text-decoration: none; margin: 0 10px 20px 0" href="xacnhanspcontroller?btnTT&maSPMUA=<%=ds.getMaSanPham()%>&KichThuoc=<%=ds.getGhiChu()%>">Tiếp tục</a>
        		<input style="float: right;display:none; font-size:16px; border:none;padding:15px 60px
        		;border-radius:10px; margin-top: 12px;background-color: red; color: #fff;font-weight: bold; margin-bottom: 25px">    				
       		</div>
		<a href="sanphamcontroller"
			style="padding: 10px 35px;font-size: 16px; font-weight:bold; background-color: #4cacd8; color: #fff; border-radius: 5px; text-decoration: none; margin: 0 10px 20px 0">Quay
			lại trang chủ</a> 
			
	</div>
			<%
				}
		}
%>
<div style="padding: 80px"></div>
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