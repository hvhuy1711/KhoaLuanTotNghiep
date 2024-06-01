<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.sanphamfullbean"%>
<%@page import="dao.khachhangdao"%>
<%@page import="bean.giospbean"%>
<%@page import="bean.khachhangthibean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaispbean"%>
<%@page import="bean.sanphambean"%>

<%@page import="bo.giospbo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!--   <link rel="stylesheet" href="thanhtoan.css" /> -->
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="assets/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="animation.css">
<style type="text/css">
.disabled {
    opacity: 0.5; /* Làm mờ nút */
    pointer-events: none; /* Ngăn không cho nhấp vào nút */
}
  .customer-info {
    background-color: #f9f9f9;
    padding: 20px;
    font-size:18px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 20px auto;
  }

  .customer-info h3 {
    margin-bottom: 20px;
    color: #333;
  }

  .customer-info-item {
    display: flex;
    margin-bottom: 10px;
  }

  .customer-info-item .label {
  	font-size: 18px;
    font-weight: bold;
    width: 180px;
    color: #555;
  }

  .customer-info-item .value {
    color: #333;
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
							href="sanphamcontroller?tenhang=<%=dshang.get(i)%>"> <%=dshang.get(i)%> </a></li>
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
						khachhangthibean kh1 = (khachhangthibean) session.getAttribute("dn");
					%> <a href="ThongtinKhachHangController" style="color: white"><span
						style="display: inline-block; width: 20px; background-color: pink; color: white; border-radius: 50%; text-align: center; margin-right: 5px; font-weight: 600;"><%=kh1.getHoTen().toUpperCase().charAt(0)%></span><%=kh1.getHoTen()%>
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

		<div class="notifications"></div>
		<script src="assets/ThongBao.js"></script>
		<%
		if (request.getAttribute("checkdangnhap") != null) {
			boolean check = (boolean) request.getAttribute("checkdangnhap");
			if (check == true) {
		%>
		<script type="text/javascript">
			 createToast('success', 'fa-solid fa-circle-check', 'Thành Công','Đăng nhập thành công!!');  
		</script>
		<%
		} else {
		%>
		<div class="notifications"></div>
		<script type="text/javascript">
			 createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
					'Đăng nhập thất bại'); 
		</script>
		<%
		}
		}
		%>

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
							<div style="display: inline-block;"> <input
									class="FormSV-input" type="text" name="txtht"
									placeholder="Nhập họ tên" required>
							</div>
							<div style="display: inline-block;"> <input
									class="FormSV-input" type="text" name="txtdc"
									placeholder="Nhập địa chỉ" required>
							</div>
							<div style="display: inline-block;"> <input
									class="FormSV-input" type="text" name="txtsdt"
									placeholder="Nhập số điện thoại" required>
							</div>
							<div style="display: inline-block;"><input
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
							<div style="display: inline-block;"> <input
									class="FormSV-input" type="Password" name="txtpass2"
									placeholder="Nhập lại mật khẩu" required>
							</div>
							<div>
								<button class="FormSV-Buttom">Đăng Kí</button><br>
								<span style="margin-top: 10px">Bạn đã có tài khoản?<a
									href="" data-toggle="modal" data-target="#myModal"
									data-dismiss="modal"> Đăng nhập</a></span><br>
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

<div class="container text-center">
		<div class="row content">
			<div class="col-sm-12 text-left" style="border: 2px solid #446879; padding: 20px; border-radius: 10px">
				<h2 style="margin-top: 120px;">Thông tin thanh toán</h2>
				<%
				ArrayList<giospbean> dsthanhtoan = (ArrayList<giospbean>) request.getAttribute("dstt");
				if (dsthanhtoan != null) {
					long tongtien = 0;
					for (giospbean h : dsthanhtoan) {
				%>
				<div class="row" style="display: block;border: 2px solid #446879; padding: 20px; border-radius: 10px">
					<div class="col-sm-2">
						<img style="width: 100%" alt="" src="<%=h.getAnh()%>">
					</div>
					<div class="col-sm-10" >
						<h3><%=h.getTenSanPham()%></h3>
						<% 		
						double giaLong = h.getGia();
						double chiecKhau = h.getChiecKhau();
						double giaSauChiecKhau = giaLong -( giaLong * (chiecKhau / 100));
						    DecimalFormat decimalFormat = new DecimalFormat("#,###");
						    String giaFormatted = decimalFormat.format(giaSauChiecKhau);
						 %>
					
						<p style="display: inline-block;">
							Giá:
							<%=giaFormatted%>đ</p>
						x
						<form style="display: inline-block;">
							<input
								style="width: 60px; margin-bottom: 20px; display: inline-block; text-align: center"
								name="soluong" disabled="disabled" type="text"
								value="<%=h.getSoLuongMua()%>">
						</form>
						<div>
							<span>Kích thước: </span>
							<input 
							style="width: 60px; margin-bottom: 20px; display: inline-block;text-align: center;"
							name="kichthuoc" disabled="disabled" type="text"
							value="<%=h.getGhiChu()%>">
						</div>
					</div>
				</div>
				<% khachhangthibean kh = (khachhangthibean)session.getAttribute("dn");
					if(kh != null){
					%>
					<div style="background-color: #f9f9f9; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); max-width: 600px; margin: 20px auto;">
					  <h3 style="margin-bottom: 20px; color: #333;">Thông tin nhận hàng</h3>
					  <div style="display: flex; margin-bottom: 10px;">
					    <span style="font-weight: bold; width: 180px; color: #555;">Họ tên người nhận:</span>
					    <span style="color: #333;"><%= kh.getHoTen() %></span>
					  </div>
					  <div style="display: flex; margin-bottom: 10px;">
					    <span style="font-weight: bold; width: 180px; color: #555;">Số điện thoại người nhận:</span>
					    <span style="color: #333;"><%= kh.getSoDT() %></span>
					  </div>
					  <div style="display: flex; margin-bottom: 10px;">
					    <span style="font-weight: bold; width: 180px; color: #555;">Địa chỉ người nhận:</span>
					    <span style="color: #333;"><%= kh.getDiaChi() %></span>
					  </div>
					  <div style="display: flex; margin-bottom: 10px;">
					    <span style="font-weight: bold; width: 180px; color: #555;">Email:</span>
					    <span style="color: #333;"><%= kh.getEmail() %></span>
					  </div>
					</div>
					<% }
					%>

					

				 <%
				 	double soLuongMua = h.getSoLuongMua();
			        double giassp = h.getGia();
			        double chiecKhausp = h.getChiecKhau();
			        double thanhTien = soLuongMua * (giassp - (giassp * (chiecKhausp / 100)));
     					tongtien += thanhTien; 
     			String tongTienFormatted = decimalFormat.format(tongtien); %>
        			
				<p
					style="font-size: 20px; font-weight: 600; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; padding-top: 20px; padding-bottom: 20px; padding-right: 80px;color: red">
					Tổng tiền:
					<%=tongTienFormatted%>
					đ
				</p>
			<%
				}
				}
				%>
			</div>
		</div>
	</div>
	<div style="padding: 10px"></div>
	<ul class="animation">
      <li class="animation-li" style="--delay: 1.4s; --color: #ffff00"></li>
      <li class="animation-li" style="--delay: 1.2s; --color: #76ff03"></li>
      <li class="animation-li" style="--delay: 1s; --color: #f06292"></li>
      <li class="animation-li" style="--delay: 0.8s; --color: #4fc3f7"></li>
      <li class="animation-li" style="--delay: 0.6s; --color: #ba68c8"></li>
      <li class="animation-li" style="--delay: 0.4s; --color: #f57c00"></li>
      <li class="animation-li" style="--delay: 0.2s; --color: #673ab7"></li>
    </ul>
	<div style="padding: 10px"></div>	
	<a href="ThanhToanTMController?btnXacNhan" id="myButton" onclick="disableButton(this)"
		style="float:right;  padding: 15px 60px;font-size: 16px; font-weight:bold; background-color: red; color: #fff; border-radius: 5px; text-decoration: none; margin: 0 70px 20px 0">Hoàn Tất Thanh Toán			
			</a>
<script src="assets/ThemDisable.js"></script>
</body>
  <script src="thanhtoan.js"></script>

</html>