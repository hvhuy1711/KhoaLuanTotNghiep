<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.sanphamfullbean"%>
<%@page import="bean.KichThuocBean"%>
<%@page import="bean.khachhangthibean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="bo.giospbo"%>
<%@page import="bean.giospbean"%>
<%@page import="bean.loaispbean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hv Huy Shop</title>
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

#kichThuocInput{
    border: 1px solid #446789;
    padding: 6px 7px 6px 10px;
    margin: 7px;
    border-radius: 7px;
    text-align: center;
    text-decoration: none;
    color: black;
    font-weight: bold;
    background-color: #f5f5f5;
}

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
					<li><a href="LichSuMuaController">Lịch Sử Mua</a></li>

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
					%> <a href="dangxuatcontroller" style="color: white;" class=" head er-nav-re"><span
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

	<div class="notifications"></div>
	<!-- Check xóa -->
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkDelete") != null) {
		boolean checkDelete = (boolean) request.getAttribute("checkDelete");
		if (checkDelete == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Hàng đã được xóa khỏi giỏ');
	</script>
	<%
	}
	}
	%>

	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkThem") != null) {
		boolean checkThem = (boolean) request.getAttribute("checkThem");
		if (checkThem == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Đã thêm 1 sản phẩm vào giỏ');
	</script>
	<%
	}
	}
	%>

	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkThemML") != null) {
		boolean checkThemML = (boolean) request.getAttribute("checkThemML");
		if (checkThemML == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Đã thêm 1 sản phẩm vào giỏ ML');
	</script>
	<%
	}
	}
	%>

	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkDeleteChon") != null) {
		boolean checkDeleteChon = (boolean) request.getAttribute("checkDeleteChon");
		if (checkDeleteChon == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Các mặt đã được chọn đã được xóa khỏi giỏ');
	</script>
	<%
	}
	}
	%>
		<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkUpdateNhapMin") != null) {
		boolean checkUpdateNhapMin = (boolean) request.getAttribute("checkUpdateNhapMin");
		if (checkUpdateNhapMin == false) {
	%>
	<script type="text/javascript">
		createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
				'Bạn đã nhập số lượng nhỏ hơn mức quy định');
	</script>
	<%
	}
	}
	%>
	
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkUpdateDown") != null) {
		boolean checkUpdateDown = (boolean) request.getAttribute("checkUpdateDown");
		if (checkUpdateDown == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Bạn đã thay đổi số lượng');
	</script>
	<%
	}else{%>
	<script type="text/javascript">
		createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
				'Số lượng đã đặt mức nhỏ nhất');
	</script>
	<%	
	}
	}
	%>
	
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkUpdateNhap") != null) {
		boolean checkUpdateNhap = (boolean) request.getAttribute("checkUpdateNhap");
		if (checkUpdateNhap == false) {
	%>
	<script type="text/javascript">
		createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
				'Bạn đã vượt quá số lượng tối đa');
	</script>
	<%
	}else{%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Bạn đã thay đổi số lượng');
	</script>
	<%
	}}
	%>
	
	

	
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkUpdateUp") != null) {
		boolean checkUpdateUp = (boolean) request.getAttribute("checkUpdateUp");
		if (checkUpdateUp == false) {
	%>
	<script type="text/javascript">
		createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
				'Bạn đã vượt quá số lượng tối đa');
	</script>
	<%
	}else {%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Bạn đã thay đổi kích thước');
	</script>
	<%
	}}
	%>
	

	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkDeleteAll") != null) {
		boolean checkDeleteAll = (boolean) request.getAttribute("checkDeleteAll");
		if (checkDeleteAll == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Tất cả hàng đã được xóa khỏi giỏ');
	</script>
	<%
	}
	}
	%>

	<div class="container" style="top: 150px; position: relative;">
		<div class="row">
			<div class="col-sm-1">
			</div> 

			<div class="col-sm-11 text-left">
				<h1>Giỏ sản phẩm của bạn</h1>
				<%
				ArrayList<giospbean> dsgio = (ArrayList<giospbean>) request.getAttribute("dsgio");
				if (dsgio == null) {
				%>
				<h3>Giỏ hàng của bạn đang trống</h3>
				<%
				} else {
				%>
				<form id="DatMua" action="kiemTraTTKHController" method="get"></form>
				<form id="xoachon" action="giospcontroller" method="get"></form>
				<%
				/* ArrayList<giospbean> dsgio = (ArrayList<giospbean>)request.getAttribute("dsgio"); */
				int n = dsgio.size();
				for (int i = 0; i < n; i++) {//duyet qua tung san pham
					giospbean s = dsgio.get(i); //lay ra san pham thu i
					request.setAttribute("name", dsgio.get(i).getMaSanPham() + dsgio.get(i).getGhiChu());
					System.out.println();
				%>

				<div class="row" style="display: block; border: 1px solid #ccc;">
					<div class="col-sm-3">
						<input form="xoachon" type="checkbox"
							name="<%=s.getMaSanPham()%><%=s.getGhiChu()%>">
						<%-- <input form="xoachon" name="maxoachon" style="display: none;" value="<%=s.getMaSanPham()%>"> --%>
						<input form="xoachon" name="sizexoachon" style="display: none;"
							value="<%=s.getGhiChu()%>"> <img style="width: 100%"
							alt="" src="<%=s.getAnh()%>">
					</div>
					<div class="col-sm-7">
						<form action="giospcontroller" id="cnkichthuoc" method="post"></form>
						<h3><%=s.getTenSanPham()%></h3>
						<%
							 long giaLong = s.getGia();
						    long chiecKhauLong = s.getChiecKhau();
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
						<form id="capnhat-<%=s.getMaSanPham()%>" action="giospcontroller"
							method="post">
							<a href="giospcontroller?btnDown&masl=<%=s.getMaSanPham() %>&kt=<%=s.getGhiChu() %>&slmua=<%=s.getSoLuongMua() %>" style="border: 1px solid;border-radius: 50px;padding: 3px;background-color: #446789;color: white;"><i class="fas fa-minus"></i></a>
							<input form="capnhat-<%=s.getMaSanPham()%>"
								style="width: 60px; margin-bottom: 20px; display: inline-block; text-align: center;"
								name="soluong" type="text" value="<%=s.getSoLuongMua()%>">
								<a href="giospcontroller?btnUp&masl=<%=s.getMaSanPham() %>&kt=<%=s.getGhiChu() %>&slmua=<%=s.getSoLuongMua() %>" style="border: 1px solid;border-radius: 50px;padding: 3px;background-color: #446789;color: white;"><i class="fas fa-plus"></i></a>
							<input form="capnhat-<%=s.getMaSanPham()%>"
								style="display: none;" type="text" name="masp"
								value="<%=s.getMaSanPham()%>"> 
							<input
								form="capnhat-<%=s.getMaSanPham()%>" style="display: none;"
								type="text" name="gccn" value="<%=s.getGhiChu()%>"> 
							<input
								form="capnhat-<%=s.getMaSanPham()%>" style="display: none;"
								type="text" name="sl" value="<%=s.getSoLuongMua()%>"> 
							<input
								form="cnkichthuoc"
								style="display: none" name =gc
								value="<%=s.getGhiChu()%>" type="text" >
							<a
								href="giospcontroller?btnsua&tsx=<%=s.getTenSanPham()%>"
								style="text-decoration: underline; border-left: 2px solid #ccc; padding-left: 6px; color: black;">
								<i class="fa-solid fa-pen-to-square"></i> 
							<input
								form="capnhat-<%=s.getMaSanPham()%>"
								style="border: none; background: none; color: #337ab7; text-decoration: underline; display: inline-block; color: black; text-decoration: none;"
								type="submit" name="btnsua" value="Cập nhật"> </a> 
							<a
								href="giospcontroller?delete=1&mxoa=<%=s.getMaSanPham()%>&ghichu=<%=s.getGhiChu()%>"
								style="text-decoration: none; border-left: 2px solid #ccc; padding-left: 6px; color: black;"><i
								class="fa-solid fa-trash-can"></i> Xoá </a> <label
								style="margin: 0 5px; display: block;">Kích thước:</label> 
								
							<input
							    id="ghiChuInput"
							    style="width: 60px; margin-bottom: 20px; display: inline-block; text-align: center;"
							    value="<%=s.getGhiChu()%>"
							    type="text"
							    disabled="disabled">
							 	  
								
							 <a style="border: 1px solid #446789;padding: 10px; border-radius: 15px; margin-left: 25px; background-color: #446789;color: white;font-weight: bold;text-decoration: none;" id="updateSizeLink" href="capNhatSizeController?maspsize=<%=s.getMaSanPham()%>&tensp=<%=s.getTenSanPham()%>&kichthuocsp=<%=s.getGhiChu()%>" >Cập nhật kích thước</a>
							<div >
							 <%ArrayList<KichThuocBean> dskt = (ArrayList<KichThuocBean>)request.getAttribute("dskt");
							/*  ArrayList<giospbean> dsgiosp = (ArrayList<giospbean>)request.getAttribute("dsgiosp"); */
							 String tensp = (String)request.getAttribute("tensp");
							 String kichthuocsp = (String)request.getAttribute("kichthuocsp");
							/*  for (giospbean gio : dsgiosp){ */
							/* 	if(mgLong== s.getMaGioHang()){ */
									if (dskt != null && tensp.equals(s.getTenSanPham()) && kichthuocsp.equals(s.getGhiChu())){
											for (KichThuocBean ds : dskt){
									%>	
									<a id="kichThuocInput" 
										   href="giospcontroller?btnUpKT&tensp=<%=tensp%>&tenKT=<%=ds.getTenKichThuoc()%>&maspSize=<%=ds.getMaSanPham()%>">
										   <%=ds.getTenKichThuoc()%>
										</a>   
									<% 
										}
								}
								%> 
								<script src="assets/KichThuoc.js"></script>
							</div>
							<%--  <%ArrayList<KichThuocBean> dskt = (ArrayList<KichThuocBean>)request.getAttribute("dskt");
							/*  ArrayList<giospbean> dsgiosp = (ArrayList<giospbean>)request.getAttribute("dsgiosp"); */
							 String tensp = (String)request.getAttribute("tensp");
							 String kichthuocsp = (String)request.getAttribute("kichthuocsp");
							/*  for (giospbean gio : dsgiosp){ */
							/* 	if(mgLong== s.getMaGioHang()){ */
									if (dskt != null && tensp.equals(s.getTenSanPham()) && kichthuocsp.equals(s.getGhiChu())){
											for (KichThuocBean ds : dskt){
									%>	
									<a id="kichThuocInput" 
										   href="giospcontroller?btnUpKT&tensp=<%=tensp%>&tenKT=<%=ds.getTenKichThuoc()%>&maspSize=<%=ds.getMaSanPham()%>">
										   <%=ds.getTenKichThuoc()%>
										</a>   
									<% 
										}
								}
								%> 
								<script src="assets/KichThuoc.js"></script> --%>
								
 					</form>
 				

					</div>
					 <div class="col-sm-2">
						<a href="kiemTraTTKHController?btnMua1SP&maSPMUA=<%=s.getMaSanPham()%>&tenSPMUA=<%=s.getTenSanPham() %>&slMua=<%=s.getSoLuongMua() %>
						&KichThuoc=<%=s.getGhiChu() %>"
							style="text-align: center; display: flex; border: 1px solid;border-radius:5px;text-decoration:none;background-color:red;color:white;font-weight:bold; margin: 20px; flex-direction: column; justify-content: center; padding: 10px;">Mua
							ngay</a>
					</div> 
				</div>


				<%
				}
				%>
				<%-- <%
				ArrayList<KichThuocBean> dskt = (ArrayList<KichThuocBean>) request.getAttribute("dskt");
				if (dskt != null) {
					for (KichThuocBean ds : dskt) {
				%>
				<select id="mySelect" onchange="changeValue(this)">
					<option value="" disabled selected>Select an option</option>
					<option value="<%=ds.getTenKichThuoc()%>"><%=ds.getTenKichThuoc()%></option>
				</select>
				<%
				}
				}
				%> --%>
				
				<div
					style="display: block; margin-bottom: 50px; margin-right: 50px;">
					<input form="xoachon" type="submit" name="btnXoaChon"
						value="Xóa chọn"
						style="float: right; border: none; padding: 7px; border-radius: 10px; margin-top: 12px; background-color: #446879; color: #fff; font-weight: bold">
				</div>
				
				<div
					style="font-size: 25px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
					Tổng Tiền:
					<%=request.getAttribute("tongtien")%>
					₫
				</div>
				<div
					style="display: block; margin-bottom: 50px; margin-right: 50px;">
				<!-- 	<input form="DatMua" type="submit" name="btnDatMua"
						value="Xác nhận đặt mua"
						style="font-size: 14px; float: right; border: none; padding: 10px; border-radius: 10px; margin: 10px; background-color: red; color: #fff; font-weight: bold">
						 -->
					<a href="giospcontroller?btnxoaAll"
						style="font-size: 14px; padding: 15px; background-color: #446879; color: #fff; border-radius: 10px; float: right; text-decoration: none; margin: 10px; font-weight: bold">Trả
						Lại Toàn Bộ</a>
					 <a href="sanphamcontroller"
						style="font-size: 14px; padding: 15px; background-color: #446879; color: #fff; border-radius: 10px; float: right; text-decoration: none; margin: 10px; font-weight: bold">Quay lại</a>
				</div>
				<!-- <a href="xacnhanspcontroller"
					style="font-size: 14px; padding: 10px; background-color: #446879; color: #fff; border-radius: 10px; float: right; text-decoration: none; margin: 10px; font-weight: bold">Xác
					Nhận Đặt Mua</a>  -->
			</div>
			<%
			}
			%>
		</div>
	</div>


	<!-- //Hiển thị sản phẩm tương tự -->

	<%-- <h1>Sản phẩm tương tự</h1>
	<div class="row">
					<%
					response.setCharacterEncoding("utf-8");
					request.setCharacterEncoding("utf-8");
					String key = request.getParameter("txttim");
					//lấy dssach tu sachcontroller gui ve
					ArrayList<sanphamfullbean> ds = (ArrayList<sanphamfullbean>) request.getAttribute("dsSPTM");

					if (ds != null) {
						int n = ds.size();
						for (int i = 0; i < n; i++) {//duyet qua tung sach
							sanphamfullbean s = ds.get(i); //lay ra quyen sach thu i
					%>
					<a href="chitietsanphamcontroller?ctsp=<%=s.getMaSanPham()%>">

						<div class="col-sm-4 col-xs-6 col-md-3 text-center"
							style="border: 1px solid #ccc;">
							<img style="width: 100%; height: 250px;" src="<%=s.getAnh()%>">
							<div>
								<br>
								<p
									style="font-size: 15px; font-weight: bold; height: 20px; overflow: hidden; display: block; text-overflow: ellipsis; white-space: nowrap;"><%=s.getTenSanPham()%></p>
								<p style="text-decoration: line-through; opacity: 0.5;">
									<%=s.getGia()%>
									VND
								</p>
								<p style="color: red; font-size: 17px;">
									Giá bán:
									<%=s.getChiecKhau()%>VND
								</p>
								<br>
								<hr>
							</div>
						</div>
					</a>

					<%
					}
					}
					%>
				</div> --%>

	<div style="padding: 100px"></div>
	<!-- Phần footer -->

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