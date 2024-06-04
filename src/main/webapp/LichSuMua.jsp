<%@page import="bean.SPHoaDonBean"%>
<%@page import="bean.HoaDonBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.DonHangDaDatBean"%>
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

.item {
	margin-top: 120px;
}

#nav li {
	display: inline-block;
	position: relative;
}

#nav li a {
	color: #fff;
	text-decoration: none;
	line-height: 55px;
	padding: 0 24px;
	display: inline-block;
}

#nav li:hover .subnav {
	display: block;
}

#nav .subnav {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	min-width: 150px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

#nav>li:hover>a, #nav .subnav li:hover a {
	color: black;
	background-color: #bcb8b8;
}

#nav .subnav a {
	color: #120f0f;
	width: 150px;
	padding: 0 16px;
	line-height: 38px;
}

#nav .nav-arrow-down {
	font-size: 12px;
}
.disabled {
    opacity: 0.5; /* Làm mờ nút */
    pointer-events: none; /* Ngăn không cho nhấp vào nút */
}
.order-card {
    margin-bottom: 20px;
    padding: 10px;
    border: 5px solid #446879;
    border-radius: 10px;
    max-width: 800px; /* Giới hạn chiều rộng tối đa */
    margin: 0 auto; /* Căn giữa thẻ */
}

.order-header {
    background-color: #446879;
    color: #fff;
    padding: 10px;
    border-radius: 5px 5px 0 0;
}

.order-header h3 {
    margin: 0;
}

.order-details {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.order-item {
    padding: 10px;
    border-top: 1px solid #ddd;
}

.order-item:first-child {
    border-top: none;
}

.product-box {
    display: flex;
    align-items: center;
    padding: 10px;
    border: 3px solid #446879;
    border-radius: 5px;
    margin-bottom: 10px;
}

.product-img {
    width: 80px;
    height: auto;
    margin-right: 20px;
    border-radius: 5px; /* Bo tròn các góc của hình ảnh */
}

.product-details {
    flex-grow: 1;
}

.product-details p {
    margin: 0;
    margin-bottom: 5px;
}

.product-name {
    font-weight: bold;
    font-size: 16px;
    color: red;
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
				 ArrayList<giospbean> dsgio = (ArrayList<giospbean>) request.getAttribute("dsgio");
				 if (dsgio != null) {
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
							for (int i = 0; i < nhang; i++) {
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
				<li><a href="">Lịch Sử Mua</a></li>
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
			createToast('success', 'fa-solid fa-circle-check', 'Thành Công',
					'Đăng nhập thành công!!');
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

		<script src="assets/ThongBao.js"></script>
		<%
		if (request.getAttribute("checkDK") != null) {
			boolean checkDK = (boolean) request.getAttribute("checkDK");
			if (checkDK == true) {
		%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation',
					'Thành công',
					'Bạn đã đăng kí thành công tài khoản. Bây giờ hãy đăng nhập!!');
		</script>
		<%
		}
		}
		%>

		<script src="assets/ThongBao.js"></script>
		<%
		if (request.getAttribute("checkDKMK") != null) {
			boolean checkDKMK = (boolean) request.getAttribute("checkDKMK");
			if (checkDKMK == false) {
		%>
		<script type="text/javascript">
			createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
					'Bạn đã nhập không đúng mật khẩu nhập lại. Vui lòng thử lại!!');
		</script>
		<%
		}
		}
		%>
		
		
	<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkThanhCong") != null) {
		boolean checkThanhCong = (boolean) request.getAttribute("checkThanhCong");
		if (checkThanhCong == true) {
	%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation',
					'Thành công',
					'Đặt hàng thành công!! Vui lòng check mail để kiểm tra lại sản phẩm!!');
		</script>
		<%
	}
	}
	%>
	checkDH
	
		<script src="assets/ThongBao.js"></script>
		<%
	if (request.getAttribute("checkDH") != null) {
		boolean checkDH = (boolean) request.getAttribute("checkDH");
		if (checkDH == true) {
	%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation',
					'Thành công',
					'Hoàn thành đơn!!');
		</script>
		<%
	}
	}
	%>

		<script src="assets/ThongBao.js"></script>
		<%
		if (request.getAttribute("checkTenDN") != null) {
			boolean checkTenDN = (boolean) request.getAttribute("checkTenDN");
			if (checkTenDN == false) {
		%>
		<script type="text/javascript">
			createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
					'Tên đăng nhập này đã tồn tại. Vui lòng nhập tên đăng nhập khác!!!');
		</script>
		<%
		}
		}
		%>
		
		<script src="assets/ThongBao.js"></script>
		<%
		if (request.getAttribute("checkDanhGia") != null) {
			boolean checkDanhGia = (boolean) request.getAttribute("checkDanhGia");
			if (checkDanhGia == true) {
		%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
					'Bạn đã đánh giá thành công sản phẩm!!');
		</script>
		<%
		}
		}
		%>
		
			<script src="assets/ThongBao.js"></script>
		<%
		if (request.getAttribute("checkHuyDon") != null) {
			boolean checkHuyDon = (boolean) request.getAttribute("checkHuyDon");
			if (checkHuyDon == true) {
		%>
		<script type="text/javascript">
			createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
					'Bạn đã hủy đơn thành công!!');
		</script>
		<%
		}
		}
		%>

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
								<input class="FormSV-input" type="text" name="txtht"
									placeholder="Nhập họ tên" required>
							</div>
							<div style="display: inline-block;">
								<input class="FormSV-input" type="text" name="txtdc"
									placeholder="Nhập địa chỉ" required>
							</div>
							<div style="display: inline-block;">
								<input class="FormSV-input" type="text" name="txtsdt"
									placeholder="Nhập số điện thoại" required>
							</div>
							<div style="display: inline-block;">
								<input class="FormSV-input" type="email" name="txtemail"
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
								<input class="FormSV-input" type="Password" name="txtpass2"
									placeholder="Nhập lại mật khẩu" required>
							</div>
							<div>
								<button class="FormSV-Buttom">Đăng Kí</button>
								<br> <span style="margin-top: 10px">Bạn đã có tài
									khoản?<a href="" data-toggle="modal" data-target="#myModal"
									data-dismiss="modal"> Đăng nhập</a>
								</span><br>
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

	<!-- body -->
	<div style="padding-top: 110px"></div>
	<h1 style="text-align: center; margin-top: 20px; font-size: 35px">Danh
		sách các đơn hàng đã mua</h1>
	<div style="padding: 10px"></div>
	<%
    ArrayList<HoaDonBean> dshd = (ArrayList<HoaDonBean>) request.getAttribute("dshd");
    if (dshd == null) {
%>
    <h2 style="text-align: center; margin-top: 20px; font-size: 30px">Bạn chưa mua bất kì sản phẩm nào</h2>
<%
    } else {
        int n = dshd.size();
        for (int i = n - 1; i >= 0; i--) {
            HoaDonBean hoadon = dshd.get(i);
%>
    <div class="order-card">
        <div class="order-header">
            <h3>Mã Hóa Đơn: <%= hoadon.getMaHoaDon() %></h3>
            <p>Ngày Đặt: <%= hoadon.getNgayMua() %></p>
            <p>Thanh Toán: <%= hoadon.getTrangThaiDon() == 0 ? "Thanh toán trực tiếp" : "Thanh toán online" %></p>
        </div>
        <ul class="order-details">
            <%
            ArrayList<DonHangDaDatBean> dsdonhang = (ArrayList<DonHangDaDatBean>) request.getAttribute("dsdonhang");
            for (DonHangDaDatBean ds : dsdonhang) {
                if (ds.getMaHoaDon() == hoadon.getMaHoaDon()) {
            %>
            <li class="order-item">
                <div class="product-box">
                    <img src="<%= ds.getAnh() %>" alt="Ảnh sản phẩm" class="product-img">
                    <div class="product-details">
                        <p class="product-name"><%= ds.getTenSanPham() %></p>
                        <p>Số lượng mua: <span style="color: red"><%= ds.getSoLuongMua() %></span></p>
                        <%
                        long giaLong = ds.getDonGiaSP();
                        long chiecKhauLong = ds.getChiecKhau();
                        float gia = (float) giaLong;
                        float chiecKhau = (float) chiecKhauLong;
                        float giaSauChiecKhau = gia - (gia * (chiecKhau / 100));
                        DecimalFormat decimalFormat = new DecimalFormat("#,###");
                        String giaFormatted = decimalFormat.format(giaSauChiecKhau);
                        %>
                        <p>Giá: <span style="color: red"><%= giaFormatted %>đ</span></p>
                        <%
                        double soLuongMua = ds.getSoLuongMua();
                        double thanhTien = soLuongMua * giaSauChiecKhau;
                        String tongTienFormatted = decimalFormat.format(thanhTien);
                        %>
                        <p>Tổng tiền: <span style="color: red"><%= tongTienFormatted %>đ</span></p>
                        <p>Kích thước: <span style="color: red"><%= ds.getGhiChuCT() %></span></p>
                        <p>Hãng: <span style="color: red"><%= ds.getHang() %></span></p>
                        <p>Trạng thái đơn: <span style="color: red">
                            <%
                            switch (ds.getTrangThai()) {
                                case 0:
                                    out.print("Chờ xác nhận");
                                    break;
                                case 1:
                                    out.print("Đang vận chuyển");
                                    break;
                                case 2:
                                    out.print("Đã nhận hàng");
                                    break;
                                case 3:
                                    out.print("Đã hoàn thành");
                                    break;
                                case 4:
                                    out.print("Chờ xác nhận trả");
                                    break;
                            }
                            %>
                        </span></p>
                    </div>
                </div>
            </li>
            <%
                }
            }
            %>
        </ul>
    </div>
<%
        }
    }
%>

		<%-- 	<td><%=giaFormatted%></td>
			<td><%=dsdonhang.get(i).getSoLuongMua()%></td>
			<td><%=dsdonhang.get(i).getGhiChuCT()%></td> --%>
			<%-- <%if (dsdonhang.get(i).getTrangThai() == 3){%>
				<td>
				<a href="TraSanPhamController?maDanhGia=<%=dsdonhang.get(i).getMaChiTiet() %>&maloai=<%=dsdonhang.get(i).getMaLoai() %>" style="border: 1px solid #ccc; cursor: pointer; text-decoration: none; padding: 7px; border-radius: 10px; background-color: #ef4b2c; color: #fff; font-weight: bold;"><i class="fa-solid fa-pencil"></i> Trả hàng</a>
				</td>
			<%}else if (dsdonhang.get(i).getTrangThai() == 0){ %>
				<td>
				<a data-toggle="modal" data-target="#myModalXoa<%=dsdonhang.get(i).getMaChiTiet()%>"  style="border: 1px solid #ccc; cursor: pointer; text-decoration: none; padding: 7px; border-radius: 10px; background-color: #ef4b2c; color: #fff; font-weight: bold;"><i class="fa-solid fa-pencil"></i> Hủy Đơn Hàng</a>
				</td>
			<%}else{ %>
			<td>
				<a class="disabled" href="TraSanPhamController?maDanhGia=<%=dsdonhang.get(i).getMaChiTiet() %>&maloai=<%=dsdonhang.get(i).getMaLoai() %>" style="border: 1px solid #ccc; cursor: pointer; text-decoration: none; padding: 7px; border-radius: 10px; background-color: #ef4b2c; color: #fff; font-weight: bold;"><i class="fa-solid fa-pencil"></i> Trả hàng</a>
				</td>
			<%} %> --%>
			
<!-- Modal xóa -->
<%-- <div class="container">
  <div class="modal fade" id="myModalXoa<%=dsdonhang.get(i).getMaChiTiet()%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Thông báo xóa</h4>
        </div>
        <div class="modal-body text-center">
          <h2 style="margin-bottom: 40px">Bạn có chắc chắn muốn hủy khách hàng này không?</h2>
          <div style="margin-bottom: 20px "> 
          	<a style="border: 1px solid red;border-radius:20px;text-decoration:none; background-color:red;color:white;font-size:18px;font-weight:bold; padding: 10px 40px;margin-right: 20px " href="HuyDonController?maCT=<%=dsdonhang.get(i).getMaChiTiet() %>&maloai=<%=dsdonhang.get(i).getMaLoai() %>&maLS=<%=dsdonhang.get(i).getMaLichSu()%>&maHoaDon=<%=dsdonhang.get(i).getMaHoaDon() %> ">
          	Có</a>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="font-weight: bold;border-radius: 20px;font-size: 18px">Không</button>
   		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
  </div>
  
</div>
</div>
</div>
 --%>
<!-- Hết modal xóa -->
			
				
			<%-- <td><a
				href="chitietsanphamcontroller?ctsp=<%=dsdonhang.get(i).getMaSanPham()%>&maloai=<%=dsdonhang.get(i).getMaLoai() %>"
				style="border: 1px solid #ccc; cursor: pointer; text-decoration: none; padding: 7px; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;">
					<i class="fas fa-shopping-cart"></i></a></td>
			<% if (dsdonhang.get(i).getTrangThai() == 1 ){ %>
			<td><a
				style="border: 1px solid #ccc; cursor: pointer; opacity: 0.5; text-decoration: none; padding: 7px; border-radius: 10px; background-color: #ef4b2c; color: #fff; font-weight: bold;">
					<i style="padding: 5px" class="fas fa-shopping-cart"></i>Đang giao hàng</a></td>
					<% }else if (dsdonhang.get(i).getTrangThai() == 0){%>
					<td><a
				style="border: 1px solid #ccc; cursor: pointer; opacity: 0.5; text-decoration: none; padding: 7px; border-radius: 10px; background-color: #ef4b2c; color: #fff; font-weight: bold;">
					<i style="padding: 5px" class="fa-solid fa-hourglass-start"></i>Chờ xác nhận</a></td>
					<%}else if (dsdonhang.get(i).getTrangThai() == 2){ %>
					<td><a href="XacNhanDatHangController?machitiet=<%=dsdonhang.get(i).getMaChiTiet() %>" onclick="disableButton(this)"
				style="border: 1px solid #ccc; cursor: pointer; text-decoration: none; padding: 7px; border-radius: 10px; background-color: #ef4b2c; color: #fff; font-weight: bold;">
					<i style="padding: 5px"  class="fa-solid fa-check"></i>Đã nhận hàng</a></td>
					<script src="assets/ThemDisable.js"></script>
					<%}else if (dsdonhang.get(i).getTrangThai() == 3){ %>
					<td><a
				style="border: 1px solid #ccc; cursor: pointer; text-decoration: none;opacity:0.7; padding: 7px; border-radius: 10px; background-color: #ef4b2c; color: #fff; font-weight: bold;">
					<i style="padding: 5px"  class="fa-solid fa-check"></i>Đã hoàn thành</a>
					<a href="DanhGiaSanPhamController?maDanhGia=<%=dsdonhang.get(i).getMaChiTiet() %>&maloai=<%=dsdonhang.get(i).getMaLoai() %>" style="border: 1px solid #ccc; cursor: pointer; text-decoration: none; padding: 7px; border-radius: 10px; background-color: #ef4b2c; color: #fff; font-weight: bold;"><i class="fa-solid fa-pencil"></i> Đánh giá</a>
					</td>
				<%}else if (dsdonhang.get(i).getTrangThai() == 4){ %>
				<td><a
				style="border: 1px solid #ccc; cursor: pointer; opacity: 0.5; text-decoration: none; padding: 7px; border-radius: 10px; background-color: #ef4b2c; color: #fff; font-weight: bold;">
					<i style="padding: 5px" class="fa-solid fa-hourglass-start"></i>Chờ xác nhận trả</a></td> --%>
				
			<%-- <td><a href="adminloaispcontroller?ml=<%=loai.getMaLoai()%>&tl=<%=loai.getTenLoai() %> &tab=chon"
		style="border: 1px solid #ccc; padding: 7px; border-radius: 10px; background-color: #446879;color: #fff; font-weight: bold;">
			Chọn
		</a></td>
		<td><a href="adminloaispcontroller?ml=<%=loai.getMaLoai() %>&tab=xoa"
		style="border: 1px solid #ccc; padding: 7px; border-radius: 10px; background-color: #446879;color: #fff; font-weight: bold;">
			<i class="fa-solid fa-trash-can"></i>
		</a></td> --%>
		</tr>
		<%-- <%
		}
			
		}
		%> --%>

	
</body>
</html>