<%@page import="bean.KichThuocBean"%>
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
	margin: 0 0 0 30px; /* Tạo khoảng cách giữa label và input */
}

.input {
	padding: 10px; flex : 1;
	/* Để input mở rộng để điền vào phần còn lại của hàng */
	height: 30px; /* Đặt chiều cao cho input */
	width: 100%;
	flex: 1; /* Đảm bảo input mở rộng để điền vào khoảng trống */
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
				<li><a href="adminxoatkcontroller">Quản lí tài khoản</a></li>
				<li><a href="adminThongKeController">Thống kê</a></li>
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
 %> <a href="dangxuatcontroller" class=" header-nav-re"
					style="text-decoration: none; color: white;"><span
						class="glyphicon glyphicon-log-in"></span> Đăng xuất</a> <%
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
				<li><a href="adminThongKeController" class="nav-mobile-css">Thống kê</a></li>

			</ul>

			<!--  <div class="search-btn">
            <i class="search-icon ti-search"></i>
        </div> -->

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

	<div class="notifications"></div>
	<!-- Check cập nhật số lượng -->
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkUpSize") != null) {
		boolean checkUpSize = (boolean) request.getAttribute("checkUpSize");
		if (checkUpSize == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Cập nhật thành công số lượng!!');
	</script>
	<%
	}
	}
	%>
	
	<!-- check add số lượng -->
		<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkAddKT") != null) {
		boolean checkAddKT = (boolean) request.getAttribute("checkAddKT");
		if (checkAddKT == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Thêm thành công kích thước!!');
	</script>
	<%
	}
	}
	%>
	
	<!-- Check xóa kích thước -->
	<%
	if (request.getAttribute("checkXoaKt") != null) {
		boolean checkXoaKt = (boolean) request.getAttribute("checkXoaKt");
		if (checkXoaKt == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Kích thước đã được xóa thành công!!');
	</script>
	<%
	}
	}
	%>
	
		<h1 style="color: black;margin-top: 140px">Trang ADMIN Cập nhật kích thước</h1>
		
	
		<div class="modal fade" id="myModalsize" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thông tin cập nhật kích thước</h4>
					</div>
					<div class="Form">
						<form style="text-align: center;" action="adminThemKichThuocController" method="get" >
						<div class="form-row" style="display: none">
					
									<span  class="labelspan">Mã sản phẩm:</span> <input class="input"
										class="input" name="masanpham" type="text"
										value="<%=request.getAttribute("maspchon") %>"
										placeholder="Nhập mã sản phẩm" required="required"> <br>
							</div>
							<!-- <div class="form-row" style="display: none">
					
									<span  class="labelspan">Mã kích thước:</span> <input class="input"
										class="input" name="makichthuoc" type="text"
										value=""
										placeholder="Nhập mã kích thước"> <br>
							</div> -->
							<div class="form-row">
									<span class="labelspan">Tên kích thước:</span> <input class="input"
										class="input" name="tenkichthuoc" type="text"
										value=""
										placeholder="Nhập tên kích thước" required="required"> <br>
							</div> 
							<div class="form-row">
									<span class="labelspan">Số lượng kích thước:</span> <input class="input"
										class="input" name="soluongsize" type="text"
										value=""
										placeholder="Nhập số lượng" required="required"> <br>
							</div> 
							<div class="form-row" style="margin-top: 10px; padding: 0 40px 10px">
							<input name="btnThemKT" type="submit" value="Thêm Kích Thước" 
				style="width: 150px; height: 45px; background-color: #446879; color: #fff; font-weight: bold; outline: none; border: 2px solid #ccc; border-radius: 10px; margin-right: 15px">
								</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		

	<p class="text-center" style="margin-top: 20px; font-size: 30px">Sản phẩm</p>
		<%ArrayList<sanphamfullbean> dssanpham =(ArrayList<sanphamfullbean>)request.getAttribute("dssanpham"); 
		String maspchon = (String)request.getAttribute("maspchon");
		
		int maspchonInt = Integer.parseInt(maspchon);
		if (dssanpham != null){
			for (sanphamfullbean dssp : dssanpham){
				if (maspchonInt == dssp.getMaSanPham()){
					%>
					<!--hiển thị sản phẩm -->
					<div class="text-center">
		                <img style="width: 100px" src="<%=dssp.getAnh() %>" alt="">
		                <h2><%= dssp.getTenSanPham() %></h2>
		                <p><%= dssp.getMoTaSanPham() %></p>
		                <p>Giá: <%= dssp.getGia() %></p>
		            </div>
		            <div style="padding: 10px"></div>
						<div class = "text-center">
							<a data-toggle="modal" data-target="#myModalsize" style="border: 1px solid #ccc;cursor:pointer; padding: 15px;text-decoration:none; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;"><i style="width:20px;padding: 5px" class="fas fa-plus"></i>Thêm kích thước</a>
						</div>
					<div style="padding: 10px"></div>
					<%
				}
			}
		}
		%>
		<hr>
		<p class="text-center" style="margin-top: 20px; font-size: 30px">Danh
		sách kích thước của sản phẩm</p>
		<%ArrayList<KichThuocBean> dskichthuoc = (ArrayList<KichThuocBean>)request.getAttribute("dskichthuoc");
		if (dskichthuoc != null){
			for(KichThuocBean ds : dskichthuoc){%>
				<form action="adminCNSizeController" method="get">
					<div class="form-row">
					 	<input style="display: none" class="input"
						name="masanpham" type="text"
						value="<%=request.getAttribute("maspchon") %>"
						placeholder="Nhập mã sản phẩm">
					<span class="labelspan">Tên kích thước:</span> <input class="input"
						name="tenkichthuoc" type="text"
						value="<%=ds.getTenKichThuoc()%>"
						placeholder="Nhập tên kích thước" required="required"> <br>
					<span class="labelspan">Số lượng:</span> <input class="input"
						name="soluongsize" type="text" value="<%=ds.getSoLuongSize() %>"
						placeholder="Nhập số luọng" required="required"> <br>
						<%-- <input style="display: none;" class="input"
						name="masanpham" type="text" value="<%=ds.getMaSanPham()%>"> --%>
						<input style="display: none;" class="input"
						name="makichthuoc" type="text" value="<%=ds.getMaKichThuoc()%>">
					<input style="margin: 0 20px" type="submit" value="Cập nhật" name="btnUpKT">
					<input style="margin: 0 20px" type="submit" value="Xóa" name="btnXoa">
					<%-- <a href="adminCNSizeController?btnXoaKT&makichthuocxoa=<%=ds.getMaKichThuoc()%>">Xóa</a> --%>
					</div>
				</form>
				<%			
			}
		}
		%>
		
	<table class="table table-hover" style="border: 1px solid #ccc;">
		<tr style="background-color: #446879; color: #fff">
			<th>Mã sản phẩm</th>
			<th>Tên sản phẩm</th>
			<th>Giá</th>
			<th>Chiếc khấu</th>
			<th>Ảnh</th>
			<th>Nút chọn</th>
			<th>Cập nhật</th>
			<th>Nút xoá</th>

		</tr>
		<%
		ArrayList<sanphamfullbean> ds = (ArrayList<sanphamfullbean>) request.getAttribute("dssanpham");
		for (sanphamfullbean loai : ds) {
		%>
		
			<div class="modal fade" id="myModal<%=loai.getMaSanPham()%>" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thông tin cập nhật</h4>
					</div>
					<div class="Form">
						<form style="text-align: center;" action="adminCapNhatSanPhamController" method="post" enctype="multipart/form-data">
							<div class="form-row" style="display: none">
									<span class="labelspan">Mã sản phẩm:</span> <input class="input"
										class="input" name="masanpham" type="text"
										value="<%=loai.getMaSanPham()%>"
										placeholder=""> <br>
								</div> 
							<div class="form-row">
									<span class="labelspan">Tên sản phẩm:</span> <input class="input"
										class="input" name="tensanpham" type="text"
										value="<%=loai.getTenSanPham()%>"
										placeholder="Nhập tên sản phẩm"> <br>
								</div> 
								<div class="form-row">
									<span class="labelspan">Giá:</span> <input class="input"
										class="input" name="giacu" type="text"
										value="<%=loai.getGia()%>"
										placeholder="Nhập giá"> <br>
								</div> 
								<div class="form-row">
									<span class="labelspan">Chiếc khấu:</span> <input class="input"
										class="input" name="giamoi" type="text"
										value="<%=loai.getChiecKhau()%>"
										placeholder="Nhập giá mới"> <br>
								</div> 
							<div class="text-center">
								<img style="width: 50px;" alt=""
									src="<%=loai.getAnh()%>">
								<div style="position: relative; display: inline-block;">
									<p>Chọn ảnh thay đổi</p>
									<input id="imageInput" name="anh" type="file" multiple onchange="displayImage()">
								</div>
								<div style="position: relative; display: inline-block;">
								<p>Thay đổi thành</p>
								<img id="selectedImage" style="width: 50px;" alt=""
									src="">
								</div>
								
							</div>
							
								<script>
							    function displayImage() {
							        var input = document.getElementById('imageInput');
							        var selectedImage = document.getElementById('selectedImage');
							        var currentImage = document.getElementById('currentImage');
							
							        if (input.files && input.files[0]) {
							            var reader = new FileReader();
							
							            reader.onload = function(e) {
							                selectedImage.setAttribute('src', e.target.result);
							            }
							
							            reader.readAsDataURL(input.files[0]);
							        } else {
							            selectedImage.src = "";
							        }
							    }
							</script>
							<div class="form-row">
									<span class="labelspan">Thương hiệu:</span> <input class="input"
										class="input" name="hang" type="text"
										value="<%=loai.getHang()%>"
										placeholder="Nhập hãng"> <br>
								</div> 
							<div class = "form-row">
									<span>Chọn danh mục:</span>
									<%ArrayList<loaispbean> dsloai1 = (ArrayList<loaispbean>) request.getAttribute("dsloai");%>
									<select id="loaiSelectmd" name="loai" style="border: 2px solid #46789; cursor: pointer; border-radius: 5px; margin: 5px 0px 5px 47px; padding: 5px; background-color: #f5f5f5; color: black; font-weight: bold;">
									    <% if (dsloai1 != null) {
									        int n = dsloai1.size();
									        for (int i = 0; i < n; i++) {
									            loaispbean ds1 = dsloai1.get(i);
									    %>
									    <option value="<%= ds1.getMaLoai() %>"><%= ds1.getTenLoai() %></option>
									    
									    <% }
									    } %>
									</select>

							</div>
								<input id="maloaiInputmd" style="display: none;"
								class="input" name="maloai" type="text"
								value="<%=request.getAttribute("maloai")%>">
								<script type="text/javascript">
									    // Lấy giá trị từ input ẩn
									    var maloaiInputmd = document.getElementById('maloaiInputmd').value;
									    
									    // Lấy select box
									    var loaiSelectmd = document.getElementById('loaiSelectmd');
									    
									    // Lặp qua từng option trong select box
									    for (var i = 0; i < loaiSelectmd.options.length; i++) {
									        // So sánh giá trị của option với giá trị từ input ẩn
									        if (loaiSelectmd.options[i].value === maloaiInputmd) {
									            // Nếu bằng nhau, đặt option này làm giá trị mặc định cho select box
									            loaiSelectmd.options[i].selected = true;
									            break;  // Thoát khỏi vòng lặp sau khi tìm thấy giá trị tương ứng
									        }
									    }
									</script>

								
								<script>
									document.addEventListener('DOMContentLoaded', function() {
									    // Lấy các phần tử cần thiết
									    var loaiSelect = document.getElementById('loaiSelectmd');
									    var maloaiInput = document.getElementById('maloaiInputmd');
									
									    // Thiết lập sự kiện khi thay đổi chọn
									    loaiSelect.addEventListener('change', function() {
									        // Lấy giá trị của option đã chọn
									        var selectedOption = loaiSelect.options[loaiSelect.selectedIndex];
									        
									        // Gán giá trị của option cho input
									        maloaiInput.value = selectedOption.value;
									    });
									});
								</script>
							<div class="form-row">
									<span class="labelspan">Mô tả sản phẩm:</span> <input class="input"
										class="input" name="mota" type="text"
										value="<%=loai.getMoTaSanPham()%>"
										placeholder="Nhập mô tả sản phẩm"> <br>
								</div> 
								 
							<div class="form-row" style="margin-top: 10px; padding: 0 40px 10px">
							<input name="butchon" type="submit" value="Cập nhật" 
				style="width: 150px; height: 45px; background-color: #446879; color: #fff; font-weight: bold; outline: none; border: 2px solid #ccc; border-radius: 10px; margin-right: 15px">
		
							<!-- <a 	href="btnupdate"
								style="float:right;text-align:center; width:100%;text-decoration:none; border: 1px solid #ccc; padding: 7px; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;">
								Cập nhật </a> -->
								</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		
	
		<tr style="font-weight: bold;">
			<td><%=loai.getMaSanPham()%></td>
			<td><%=loai.getTenSanPham()%></td>
			<td><%=loai.getGia()%></td>
			<td><%=loai.getChiecKhau()%></td>
			<td><img style="width: 40px;" alt="" src="<%=loai.getAnh()%>"></td>
			<%-- 	<td><a
				href="adminCapNhatSizeController?msp=<%=loai.getMaSanPham()%>&tsp=<%=loai.getTenSanPham()%>&sl=<%=loai.getSoLuong()%>
		&giacu=<%=loai.getGia()%>&giamoi=<%=loai.getChiecKhau()%>&anh=<%=loai.getAnh()%>&maloai=<%=loai.getMaLoai()%>
		&hang=<%=loai.getHang()%>&ngaynhap=<%=loai.getNgayNhap()%>&mota=<%=loai.getMoTaSanPham() %>"
				style="border: 1px solid #ccc; padding: 7px; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;">
				Cập nhật kích thước </a></td> --%>
			<td><a
				href="adminCapNhatSizeController?msp=<%=loai.getMaSanPham()%>&tsp=<%=loai.getTenSanPham()%>&sl=<%=loai.getSoLuong()%>
		&giacu=<%=loai.getGia()%>&giamoi=<%=loai.getChiecKhau()%>&anh=<%=loai.getAnh()%>&maloai=<%=loai.getMaLoai()%>
		&hang=<%=loai.getHang()%>&ngaynhap=<%=loai.getNgayNhap()%>&mota=<%=loai.getMoTaSanPham() %>&tab=chon"
				style="border: 1px solid #ccc; padding: 7px; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;">
					Chọn </a></td>
					
					<%-- <script>
								// Đợi cho modal hiển thị và sau đó xử lý sự kiện
						$('#myModal<%=loai.getMaSanPham()%>').on('shown.bs.modal', function () {
						    // Lấy mã danh mục sản phẩm của sản phẩm được chọn
						    var selectedLoai = document.getElementById('maloaiInputmd').value;
						    
						    // Lặp qua tất cả các tùy chọn trong thẻ select
						    var loaiSelect = document.getElementById('loaiSelectmd');
						    for (var i = 0; i < loaiSelect.options.length; i++) {
						        var option = loaiSelect.options[i];
						        if (option.value === selectedLoai) {
						            // Đặt thuộc tính "selected" cho tùy chọn được chọn
						            option.selected = true;
						        }
						    }
						});
					</script> --%>
					<td>
					<input id = "updateButton" type="submit" value="Cập nhật" data-toggle="modal"
							data-target="#myModal<%=loai.getMaSanPham()%>"
							style=" border: 1px solid #ccc; padding: 7px; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;">
						</td>	
			<td><a
				href="adminsanphamcontroller?mspx=<%=loai.getMaSanPham()%>&tab=xoa"
				style="border: 1px solid #ccc; padding: 7px; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;">
					<i class="fa-solid fa-trash-can"></i>
			</a></td>
		</tr>
		<%
		}
		%>
	</table>
	
	

</body>
</html>