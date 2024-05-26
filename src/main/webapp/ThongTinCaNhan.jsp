<%@page import="controller.khachhangcontroller"%>
<%@page import="bo.khachhangbo"%>
<%@page import="bean.khachhangthibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin cá nhân</title>
<link rel="stylesheet" href="ThoongTinKhachHang.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="assets/fontawesome-free-6.3.0-web/css/all.min.css">
	<link rel="stylesheet" href="Thongbao.css">
<style type="text/css">
.FormSV-input {
	width: 466px;
	height: 36px;
	padding-left: 10px;
	padding-right: 3.5px;
	font-size: 14px;
	line-height: 1.3333333;
	border-radius: 4px;
	margin: 16px 0 8px 0;
	border: 1px solid #ccc;
}

.FormSV-Buttom {
	margin-top: 10px;
	margin-bottom: 15px;
	text-align: center;
	width: 466px;
	height: 36px;
	font-size: 15px;
	line-height: 1.3333333;
	border: 1px solid #ccc;
	border-radius: 4px;
	color: #fff;
	background-color: #5b6166;
	border-color: #828d96;
}

.FormSV-Buttom:hover {
	color: #fff;
	background-color: #878a8d;
	border-color: #204d74;
}

.header-nav-re :hover {
	color: #fff;
	background-color: #878a8d;
	border-color: #204d74;
}
</style>
</head>
<body
	style="padding: 30px 30px 30px 30px; background-color: #f4f4f4; margin: 30px 30px 30px; border: 1px solid; border-radius: 22px; box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);">
	<header style="display: block; border:">
		<h1>Hồ sơ của tôi</h1>
		<p>Quản lí thông tin hồ sơ bảo mật và tài khoản</p>
	</header>
	<div class="container flex-container">
		<%
		khachhangthibean kh = (khachhangthibean) session.getAttribute("dn");
		%>
		<div class="row text-align">
			<div class="col-sm-3 col-xs-3 col-md-3"
				style="display: block; margin: 0 auto;">
				<img alt="" src="baithijava/anhuser.jpg"
					style="margin-top: 20px; width: 50%; display: block; margin: 0 auto;">
				<a href="" data-toggle="modal" data-target="#myModalMK"
					style="text-align: center; color: black; margin-right: 15px; border: 1px solid; padding: 10px; margin-top: 10px; display: block; border-radius: 5px; text-decoration: none;"
					class="header-nav-re"> Đổi mật khẩu</a>
			</div>
			<div class="main-content col-sm-9 col-xs-9 col-md-9"
				style="width: 75%">
				<h2>Thông tin cá nhân</h2>
				<form id="capnhat-<%=kh.getMaKhachHang()%>"
					action="CapNhapTTController" method="get">
					<div style="display: flex; flex-wrap: wrap;">
						<div style="width: 50%; padding: 10px;">
							<label for="ten">Họ và tên:</label> 
							<%if(kh.getHoTen() != null){ %>
							<input
								form="capnhat-<%=kh.getMaKhachHang()%>" type="text" name="hoten"
								value="<%=kh.getHoTen()%>" required="required"
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
								<%}else{ %>
							<input
								form="capnhat-<%=kh.getMaKhachHang()%>" type="text" name="hoten" 
								value="" required="required"
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
								<%} %>
						</div>
						<div style="width: 50%; padding: 10px;">
							<label for="ten">Số điện thoại:</label> 
							<%if(kh.getSoDT() != null){ %>
							<input
								form="capnhat-<%=kh.getMaKhachHang()%>" type="text" name="sodt"
								value="<%=kh.getSoDT()%>" required="required"
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
								<%}else{ %>
								<input
								form="capnhat-<%=kh.getMaKhachHang()%>" type="text" name="sodt"
								value="" required="required"
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
								<%} %>
						</div>
						<div style="width: 50%; padding: 10px;">
							<label for="email">Địa chỉ:</label> 
							<%if(kh.getDiaChi() != null){ %>
							<input
								form="capnhat-<%=kh.getMaKhachHang()%>" type="text"
								name="diachi" value="<%=kh.getDiaChi()%>" required="required"
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
								<%}else{ %>
								<input
								form="capnhat-<%=kh.getMaKhachHang()%>" type="text"
								name="diachi" value="" required="required"
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
								<%} %>
						</div>
						<div style="width: 50%; padding: 10px;">
							<%if(kh.getGoogle_id() != null){ %>
							<label for="email">Email:</label> <input type="email"
								disabled="disabled" name="email" value="<%=kh.getEmail()%>"
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
								<%}else{
								if(kh.getEmail() != null){
								%>
								<label for="email">Email:</label> <input type="email"
							 	name="email" value="<%=kh.getEmail()%>" required="required"
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
								<%}else { %>
								<label for="email">Email:</label> <input type="email"
							 	name="email" value="" required="required"
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
								<%
								}
								} %>
						</div>


						<!-- <div style="width: 50%; padding: 5px;">
						<label for="gioiTinh">Giới tính:</label> <select name="gioiTinh"
							id="gioiTinh"
							style="width: 100%; padding: 5px; border: 1px solid #ccc; border-radius: 5px;">
							<option value="Nam">Nam</option>
							<option value="Nữ">Nữ</option>
						</select>
					</div> -->

					</div>
					<div
						style="float: right; width: 50%; padding: 5px; text-align: right; margin: 5px;font-size: 16px">
						<a href="CapNhapTTController?btnsua"
							style="border: 1px solid; border-radius: 5px; padding: 5px; color: black; display: inline-block; text-decoration: none;">
							<input form="capnhat-<%=kh.getMaKhachHang()%>" type="submit"
							name="btnsua" value="Cập nhật" style="border: none">
						</a> 
						<a href="sanphamcontroller"
							style="border: 1px solid; border-radius: 5px; padding: 5px; color: black; display: inline-block; border-radius: 5px; text-decoration: none;">
							← Quay lại</a>
					</div>
				</form>
			</div>
		</div>





	</div>


<%
		khachhangthibean kh1 = (khachhangthibean) session.getAttribute("dn");
		%>
	<div class="modal fade" id="myModalMK" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Đổi mật khẩu</h4>
				</div>
				<div class="Form">
					<form id="doiMK-<%=kh1.getMaKhachHang() %>" style="text-align: center;" action="doiMatKhauController"
						method="get">

						<div style="display: block;; padding: 0 40px 8px">
							<!-- <span class="FormSV-span">Tài Khoản:</span>  -->
							<input class="FormSV-input" form="doiMK-<%=kh1.getMaKhachHang() %>"
								style="margin: 16px 0 8px 0; width: 100%" type="Password"
								name="txtpasscu" placeholder="Nhập mật khẩu cũ" required>
							<br>
						</div>
						<div style="display: block; padding: 0 40px 8px">
							<!-- <span class="FormSV-span">Mật khẩu:</span>  -->
							<input class="FormSV-input" form="doiMK-<%=kh1.getMaKhachHang() %>"
								style="margin: 16px 0 8px 0; width: 100%" type="Password"
								name="txtpass" placeholder="Nhập Mật Khẩu Mới" required>
							<br>
						</div>
						<div style="display: block; padding: 0 40px 8px">
							<!-- <span class="FormSV-span">Mật khẩu:</span>  -->
							<input class="FormSV-input" form="doiMK-<%=kh1.getMaKhachHang() %>"
								style="margin: 16px 0 8px 0; width: 100%" type="Password"
								name="txtpass1" placeholder="Nhập lại Mật Khẩu mới" required>
							<br>
						</div>
						
						<a href="doiMatKhauController?btndoimk&maKH=<%=kh1.getMaKhachHang() %>"
							style="border: 1px solid; border-radius: 5px; padding: 5px; color: black; display: inline-block; text-decoration: none;">
							<input form="doiMK-<%=kh1.getMaKhachHang()%>" type="submit"
							name="btndoimk" value="Đổi mật khẩu" style="border: none">
						</a>
						
						<%-- <input type="text" form="doiMK-<%=kh.getMaKhachHang() %>" name="btndoimk" value="Đổi mật khẩu" >
						<div style="margin-top: 10px; padding: 0 40px 10px">
							<button class="FormSV-Buttom" style="width: 100%">Đổi
								mật khẩu</button>

						</div> --%>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 	hiển thị đỏi mk thành công-->
	<div class="notifications"></div>
		<script src="assets/ThongBao.js"></script>
		<%if (request.getAttribute("checkDoiTC") != null) {
			boolean checkDoiTC = (boolean) request.getAttribute("checkDoiTC");
			if (checkDoiTC == true) {
		%>
		<script type="text/javascript">
			 createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
					'Đổi mật khẩu thành công'); 
		</script>
		<%
		} 
		} %>
		
		
		<!-- Hiển thi sai mât khẩu -->
		<%if (request.getAttribute("checkMKSQL") != null) {
			boolean checkMKSQL = (boolean) request.getAttribute("checkMKSQL");
			
			if (checkMKSQL == false) {
		%>
		<script type="text/javascript">
			 createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
					'Bạn đã nhập sai mật khẩu'); 
		</script>
		<%
		} 
		} %>
		
		
		<!-- hiển thị sai mật khẩu nhập lại -->
		<%if (request.getAttribute("checkTMK") != null) {
			boolean checkTMK = (boolean) request.getAttribute("checkTMK");
			
			if (checkTMK == false) {
		%>
		<script type="text/javascript">
			 createToast('error', 'fa-solid fa-circle-exclamation', 'Thất bại',
					'Bạn đã nhập sai mật khẩu nhập lại'); 
		</script>
		<%
		} 
		} %>
		
		
		<!-- Hiển thị cập nhật thành công -->
		<%if (request.getAttribute("checkHoTen") != null) {
			boolean checkHoTen = (boolean) request.getAttribute("checkHoTen");
			
			if (checkHoTen == true) {
		%>
		<script type="text/javascript">
			 createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
					'Bạn cần cập nhật họ tên'); 
		</script>
		<%
		} 
		} %>
		
		<%if (request.getAttribute("checkDiaChi") != null) {
			boolean checkDiaChi = (boolean) request.getAttribute("checkDiaChi");
			
			if (checkDiaChi == true) {
		%>
		<script type="text/javascript">
			 createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
					'Bạn cần cập nhật địa chỉ'); 
		</script>
		<%
		} 
		} %>
		
		<%if (request.getAttribute("checkUpdate") != null) {
			boolean checkUpdate = (boolean) request.getAttribute("checkUpdate");
			System.out.println(5);
			System.out.println(checkUpdate);
			if (checkUpdate == true) {
		%>
		<script type="text/javascript">
			 createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
					'Bạn đã cập nhật thành công'); 
		</script>
		<%
		} 
		} %>
		
		<%if (request.getAttribute("checkSoDT") != null) {
			boolean checkSoDT = (boolean) request.getAttribute("checkSoDT");
			if (checkSoDT == true) {
		%>
		<script type="text/javascript">
			 createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
					'Bạn cập nhật số điện thoại chưa đúng quy định'); 
		</script>
	
		<%}
		} %>
		
		<%if (request.getAttribute("checkEmail") != null) {
			boolean checkEmail = (boolean) request.getAttribute("checkEmail");
			if (checkEmail == true) {
		%>
		<script type="text/javascript">
			 createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
					'Bạn cập nhật email chưa đúng quy định'); 
		</script>
		<%
		} 
		} %>
	

	<footer>
		<p>Thông tin liên hệ:</p>
		<p>Email: huyhuynh@gmail.com</p>
		<p>Số điện thoại: 1900 1234</p>
	</footer>
</body>
</html>
