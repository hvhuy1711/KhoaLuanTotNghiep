<%@page import="bean.AnhBean"%>
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
	padding: 10px; flex : 1;
	/* Để input mở rộng để điền vào phần còn lại của hàng */
	height: 30px; /* Đặt chiều cao cho input */
	width: 100%;
	flex: 1; /* Đảm bảo input mở rộng để điền vào khoảng trống */
}

    /* CSS cho thẻ div bao bọc */
    .image-list {
        display: flex;
        flex-wrap: wrap; /* Cho phép các ảnh xuống dòng nếu không đủ không gian */
       /*  justify-content: center; */
        border: 1px solid;
   	 	padding: 20px;
    	margin: 0 50px; 	
    }

    /* CSS cho từng ảnh */
    .image-list img {
        max-width: 168px;
        max-height: 168px;
        margin: 10px; /* Khoảng cách giữa các ảnh */
    }

    /* Ẩn input */
    /* .input {
        display: none;
    } */
.image-container {
        position: relative; /* Thiết lập vị trí tương đối */
        display: inline-block; /* Cho phép các container của ảnh nằm cạnh nhau */
        margin: 10px; /* Khoảng cách giữa các ảnh */
    }

    /* CSS cho checkbox phía dưới ảnh */
    .checkbox-below-image {
        position: absolute; /* Thiết lập vị trí tuyệt đối */
        bottom: -10px; /* Đặt checkbox ở phía dưới cùng của container ảnh */
        left: 108px; /* Đặt checkbox ở bên trái của container ảnh */
    }
    
    .card {
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: all 0.3s;
    }
    .card:hover {
        transform: translateY(-5px);
    }
    .card-header {
        font-weight: bold;
    }
    .card-body {
        padding: 20px;
    }
    .btn {
        margin: 5px;
    }
    .modal-header {
        background-color: #446879;
        color: #fff;
    }
    .modal-title {
        margin: 0;
    }
    .modal-body {
        padding: 20px;
    }
    .modal-footer {
        padding: 10px;
    }
    .form {
        padding: 20px;
    }
    .form-row {
        margin-bottom: 15px;
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

				<!-- <li><a
					class="footer-Evaluate footer-group js-buy-btn-Evaluate ">Đánh
						Giá</a></li> -->
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
 %> <a href="dangxuatcontroller" 
					style="color: #fff; margin-right: 15px;" class="header-nav-re"><span
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
	<!-- Check xóa -->
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkXoaChonAnh") != null) {
		boolean checkXoaChonAnh = (boolean) request.getAttribute("checkXoaChonAnh");
		if (checkXoaChonAnh == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Các ảnh chọn đã được xóa');
	</script>
	<%
	}
	}
	%>
	
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkXoaCheckBox") != null) {
		boolean checkXoaCheckBox = (boolean) request.getAttribute("checkXoaCheckBox");
		if (checkXoaCheckBox == false) {
	%>
	<script type="text/javascript">
		createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
				'Bạn phải chọn sản phẩm để xóa');
	</script>
	<%
	}
	}
	%>
	
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkThemAnh") != null) {
		boolean checkThemAnh = (boolean) request.getAttribute("checkThemAnh");
		if (checkThemAnh == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Bạn đã thêm 1 ảnh');
	</script>
	<%
	}
	}
	%>
<%-- 		<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkDSAnh") != null) {
		boolean checkDSAnh = (boolean) request.getAttribute("checkDSAnh");
		if (checkDSAnh == true) {
	%>
	<script type="text/javascript">
		createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
				'Danh sách ảnh đang trống không thể xóa!!');
	</script>
	<%
	}
	}
	%> --%>
	

	<%sanphamfullbean sp = (sanphamfullbean)request.getAttribute("sp"); %>
	<div style="padding: 70px"></div>
	<div class="text-center">
		<h1>Danh sách ảnh của sản phẩm <%=sp.getTenSanPham()%></h1>
		<img style="width: 300px;height: 200px;" alt="" src="<%=sp.getAnh()%>">
	</div>
	<div style="padding: 20px"></div>
    <input form="adminThemAnh" style="display: none" class="input-below-image" name="masp" type="text" value="<%=sp.getMaSanPham() %>" placeholder="Nhập tên sản phẩm" required="required">
	<div class="image-list">
	<% ArrayList<AnhBean> dsAnh = (ArrayList<AnhBean>) request.getAttribute("dsAnh");
    if (dsAnh != null) {
        for (AnhBean ds : dsAnh) { %>
            <div class="image-container">
                <img src="<%= ds.getTenAnh() %>" alt="Image">
                <input form="formXoaAnh" style="display: none" class="input-below-image" name="maspxoa" type="text" value="<%= ds.getMaSanPham() %>" placeholder="Nhập tên sản phẩm" required="required">
                <input form="formXoaAnh" class="checkbox-below-image" required="required" type="checkbox" name="<%= ds.getMaAnh()%>">
            </div>
        <% }
    } %>

<form action="adminThemAnhSPController" id="adminThemAnh" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <div class="text-center" style="margin-top: 35px;text-align: center;">
        <img style="width: 50px;" alt="" src="<%=request.getAttribute("anh")%>">
        <div style="position: relative; display: inline-block;">
            <p>Chọn ảnh</p>
            <input id="fileInput" name="anh" type="file" multiple>
        </div>
    </div>
    <br>
    <div class="text-center">
        <input name="butchon" type="submit" value="Thêm ảnh" style="width: 150px; height: 45px; background-color: #446879; color: #fff; font-weight: bold; outline: none; border: 2px solid #ccc; border-radius: 10px; margin-right: 15px">
    </div>
</form>
		<script>
		    function validateForm() {
		        var fileInput = document.getElementById('fileInput');
		        var spanAnh = document.getElementById('spanAnh');
		        if (fileInput.files.length === 0) {
		            alert("Bạn cần chọn ít nhất một ảnh!");
		            return false; // Ngăn form từ việc gửi đi nếu không có ảnh được chọn
		        }
		        return true; // Cho phép form được gửi đi nếu có ít nhất một ảnh được chọn
		    }
		</script>
		
	</div>
	<div style="padding: 10px"></div>
	<%if(dsAnh == null){ %>
	<form class="formXoaAnh" style="display: none;" action="adminXoaAnhController" method="post" id="formXoaAnh">
    <div>
        <input form="formXoaAnh" name="btnxoa" type="submit" value="Xóa ảnh" 
            style="width: 150px; display:block; height: 45px; background-color: #446879; color: #fff; font-weight: bold; outline: none; border: 2px solid #ccc; border-radius: 10px; margin:0 auto">
    </div>
    </form>
    <%}else{ %>
	<form class="formXoaAnh" action="adminXoaAnhController" method="post" id="formXoaAnh">
    <div>
        <input form="formXoaAnh" name="btnxoa" type="submit" value="Xóa ảnh" 
            style="width: 150px; display:block; height: 45px; background-color: #446879; color: #fff; font-weight: bold; outline: none; border: 2px solid #ccc; border-radius: 10px; margin:0 auto">
    </div>
    </form>
    <%} %>
 <p class="text-center" style="margin-top: 20px; font-size: 30px">Danh sách các sản phẩm</p>
    <div style="border: 2px solid #446789; padding: 20px; margin: 20px; border-radius: 20px">
        <div class="row">
            <% 
            ArrayList<sanphamfullbean> ds = (ArrayList<sanphamfullbean>) request.getAttribute("dssanpham");
            for (sanphamfullbean loai : ds) {
            %>
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-header" style="background-color: #446879; color: #fff">
                        <h5 class="card-title">Mã sản phẩm: <%=loai.getMaSanPham()%></h5>
                    </div>
                    <div class="card-body">
                        <p class="card-text"><strong>Tên sản phẩm:</strong> <%=loai.getTenSanPham()%></p>
                        <p class="card-text"><strong>Giá:</strong> <%=loai.getGia()%>đ</p>
                        <p class="card-text"><strong>Giảm giá:</strong> <%=loai.getChiecKhau()%>%</p>
                        <img style="width: 70px; height: 70px;" alt="" src="<%=loai.getAnh()%>">
                        <div class="d-flex justify-content-between">
                        	<a  href="adminThemAnhController?masp=<%=loai.getMaSanPham()%>&tsp=<%=loai.getTenSanPham()%>&sl=<%=loai.getSoLuong()%>
		&giacu=<%=loai.getGia()%>&giamoi=<%=loai.getChiecKhau()%>&anh=<%=loai.getAnh()%>&maloai=<%=loai.getMaLoai()%>
		&hang=<%=loai.getHang()%>&ngaynhap=<%=loai.getNgayNhap()%>&mota=<%=loai.getMoTaSanPham() %>" class="btn btn-warning btn-sm">
                                <i class="fa-solid fa-camera"></i></i> Cập nhật ảnh
                            </a>
                            <a href="adminCapNhatSizeController?msp=<%=loai.getMaSanPham()%>&tsp=<%=loai.getTenSanPham()%>&sl=<%=loai.getSoLuong()%>
		&giacu=<%=loai.getGia()%>&giamoi=<%=loai.getChiecKhau()%>&anh=<%=loai.getAnh()%>&maloai=<%=loai.getMaLoai()%>
		&hang=<%=loai.getHang()%>&ngaynhap=<%=loai.getNgayNhap()%>&mota=<%=loai.getMoTaSanPham() %>" class="btn btn-warning btn-sm">
                                <i class="fa-solid fa-pen-to-square"></i> Cập nhật size
                            </a>
                            <a data-toggle="modal" data-target="#myModal<%=loai.getMaSanPham()%>" class="btn btn-warning btn-sm">
                                <i class="fa-solid fa-pen-to-square"></i> Cập nhật
                            </a>
                            <a data-toggle="modal" data-target="#myModalXoa<%=loai.getMaSanPham()%>" class="btn btn-danger btn-sm">
                                <i class="fa-solid fa-trash-can"></i> Xoá
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal cập nhật -->
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
										placeholder="" required="required"> <br>
								</div> 
							<div class="form-row">
									<span class="labelspan">Tên sản phẩm:</span> <input class="input"
										class="input" name="tensanpham" type="text"
										value="<%=loai.getTenSanPham()%>"
										placeholder="Nhập tên sản phẩm" required="required"> <br>
								</div> 
								<div class="form-row">
									<span class="labelspan">Giá nhập:</span> <input class="input"
										class="input" name="gianhap" type="text"
										value="<%=loai.getSoLuong()%>"
										placeholder="Nhập giá nhập" required="required"> <br>
								</div> 
								<div class="form-row">
									<span class="labelspan">Giá bán:</span> <input class="input"
										class="input" name="giacu" type="text"
										value="<%=loai.getGia()%>"
										placeholder="Nhập giá" required="required"> <br>
								</div> 
								<div class="form-row">
									<span class="labelspan">Giảm giá:</span> <input class="input"
										class="input" name="giamoi" type="text"
										value="<%=loai.getChiecKhau()%>"
										placeholder="Nhập giá mới" required="required"> <br>
								</div> 
							<div class="text-center">
								<img style="width: 50px;" alt=""
									src="<%=loai.getAnh()%>" >
								<div style="position: relative; display: inline-block;">
									<p>Chọn ảnh thay đổi</p>
									<input id="imageInput" name="anh" type="file" multiple onchange="displayImage()" required="required">
								</div>
								<div style="position: relative; display: inline-block;">
								<p id = "anhSwap" style="display: none">Thay đổi thành</p>
								<img id="selectedImage" style="width: 50px;" alt=""
									src="">
								</div>
							</div>
							
								<script>
							    function displayImage() {
							        var input = document.getElementById('imageInput');
							        var anhSwap = document.getElementById('anhSwap');
							        var selectedImage = document.getElementById('selectedImage');
							        var currentImage = document.getElementById('currentImage');
							
							        if (input.files && input.files[0]) {
							            var reader = new FileReader();
							
							            reader.onload = function(e) {
							                selectedImage.setAttribute('src', e.target.result);
							            }
							            
							            reader.readAsDataURL(input.files[0]);
							            anhSwap.style.display = 'block'; 
							        } else {
							            selectedImage.src = "";
							            anhSwap.style.display = 'none'; 
							        }
							    }
							</script>
							<div class="form-row">
									<span class="labelspan">Thương hiệu:</span> <input class="input"
										class="input" name="hang" type="text"
										value="<%=loai.getHang()%>"
										placeholder="Nhập hãng" required="required"> <br>
								</div> 
							<div class = "form-row">
									<span>Chọn danh mục:</span>
									<%
								ArrayList<loaispbean> dsloai1 = (ArrayList<loaispbean>) request.getAttribute("dsloai");
								int maloai = loai.getMaLoai();
								String maString = String.valueOf(maloai);
								%>
						<select id="loaiSelectmd" name="maloai" style="border: 2px solid #446789; width:100%; cursor: pointer; border-radius: 5px; margin: 5px 0px 5px 30px; padding: 5px; background-color: #f5f5f5; color: black; font-weight: bold;">
						    <% 
						    if (dsloai1 != null) {
						        // Vòng lặp để hiển thị tùy chọn đã chọn
						        for (loaispbean ds1 : dsloai1) {
						            if (maString.equals(ds1.getMaLoai())) {
						    %>
						    <option value="<%= ds1.getMaLoai() %>" selected><%= ds1.getTenLoai() %></option>
						    <%
						            }
						        }
						        
						        // Vòng lặp để hiển thị các tùy chọn còn lại
						        for (loaispbean ds1 : dsloai1) {
						            if (!maString.equals(ds1.getMaLoai())) {
						    %>
						    <option value="<%= ds1.getMaLoai() %>"><%= ds1.getTenLoai() %></option>
						    <%
						            }
						        }
						    }
						    %>
						</select>
						 	</div>
							<div class="form-row">
									<span class="labelspan">Mô tả sản phẩm:</span> <input class="input"
										class="input" name="mota" type="text"
										value="<%=loai.getMoTaSanPham()%>"
										placeholder="Nhập mô tả sản phẩm" required="required"> <br>
								</div> 
								 
							<div class="form-row" style="margin-top: 10px; padding: 0 40px 10px">
							<input name="butchon" type="submit" value="Cập nhật" 
				style="width: 150px;display:block; height: 45px; background-color: #446879; color: #fff; font-weight: bold; outline: none; border: 2px solid #ccc; border-radius: 10px; margin:0 auto">
								</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
            <!-- Modal xóa -->
            <div class="modal fade" id="myModalXoa<%=loai.getMaSanPham()%>" role="dialog">
                <!-- Modal content -->
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Thông báo xóa</h4>
                        </div>
                        <div class="modal-body text-center">
                            <h2 style="margin-bottom: 35px">Bạn có chắc chắn muốn xóa sản phẩm này?</h2>
                            <div style="margin-bottom: 20px">
                                <a style="border: 1px solid red; border-radius: 20px; text-decoration: none; background-color: red; color: white; font-size: 18px; font-weight: bold; padding: 10px 40px; margin-right: 20px" href="adminsanphamcontroller?mspx=<%=loai.getMaSanPham()%>&tab=xoa">Có</a>
                                <button type="button" class="btn btn-default" data-dismiss="modal" style="font-weight: bold; border-radius: 20px; font-size: 18px">Không</button>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <% 
            }
            %>
        </div>
    </div>
	
	

</body>
</html>