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
	padding: 10px; flex : 1;
	/* Để input mở rộng để điền vào phần còn lại của hàng */
	height: 30px; /* Đặt chiều cao cho input */
	width: 100%;
	flex: 1; /* Đảm bảo input mở rộng để điền vào khoảng trống */
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

<!-- Hiện thông báo  -->
<div class="notifications"></div>
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkThemSP") != null) {
		boolean checkThemSP = (boolean) request.getAttribute("checkThemSP");
		if (checkThemSP == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Đã thêm thành công sản phẩm');
	</script>
	<%
	}else{%>
		<script type="text/javascript">
		createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
				'Tên sản phẩm đã tồn tại!! Vui lòng nhập tên sản phẩm khác!!');
	</script>
	<%}
	}
	%>
	
	<%
	if (request.getAttribute("checkSuaSP") != null) {
		boolean checkSuaSP = (boolean) request.getAttribute("checkSuaSP");
		if (checkSuaSP == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Bạn đã cập nhật thành công sản phẩm sản phẩm');
	</script>
	<%
	}else{%>
		<script type="text/javascript">
		createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
				'Tên sản phẩm đã tồn tại!! Vui lòng nhập tên sản phẩm khác!!');
	</script>
	<%}
	}
	%>
	
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkCN") != null) {
		boolean checkCN = (boolean) request.getAttribute("checkCN");
		if (checkCN == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Bạn đã cập nhật thành công sản phẩm');
	</script>
	<%
	}
	}
	%> 
	
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkXoa") != null) {
		boolean checkXoa = (boolean) request.getAttribute("checkXoa");
		if (checkXoa == true) {
	%>
	<script type="text/javascript">
		createToast('success', 'fa-solid fa-circle-exclamation', 'Thành công',
				'Đã xóa thành công sản phẩm');
	</script>
	<%
	}
	}
	%>
	
	<script src="assets/ThongBao.js"></script>
	<%
	if (request.getAttribute("checkXoaSP") != null) {
		boolean checkXoaSP = (boolean) request.getAttribute("checkXoaSP");
		if (checkXoaSP == true) {
	%>
	<script type="text/javascript">
		createToast('warning', 'fa-solid fa-circle-exclamation', 'Cảnh báo',
				'Bạn không thể xóa trường này vì còn các trường liên quan!!!');
	</script>
	<%
	}
	}
	%>


<!-- Body -->

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
            
            <div class="col-md-9">
            <%
	if (request.getAttribute("masanpham") != null) {
	%>
	<form action="adminCapNhatSanPhamController" method="post"
		enctype="multipart/form-data"></form>
	<%
	} else {
	%>
	<form action="adminThemSanPhamController" method="post"
		enctype="multipart/form-data" >
		<%
		}
		%>
		<h1 style="color: black;">Trang ADMIN Sửa Sản Phẩm</h1>
		<div style="border: 2px solid #446789; padding: 30px 0; margin: 0 40px; border-radius: 10px">
		
		<div class="form-row">
			<%
			if (request.getAttribute("tensanpham") != null) {
			%>
			<span class="labelspan">Tên Sản Phẩm:</span> <input class="input"
				name="tensanpham" type="text"
				value="<%=request.getAttribute("tensanpham")%>"
				placeholder="Nhập tên sản phẩm" required="required"> <br>
			<%
			} else {
			%>
			<span class="labelspan">Tên Sản Phẩm:</span> <input class="input"
				name="tensanpham" type="text" value=""
				placeholder="Nhập tên sản phẩm" required="required"> <br>
			<%
			}
			%>
		</div>
		<div class="form-row">
			<%
			if (request.getAttribute("gianhap") != null) {
			%>
			<span class="labelspan">Giá nhập:</span> <input class="input" name="gianhap"
				type="text" value="<%=request.getAttribute("gianhap")%>"
				placeholder="Nhập giá nhập" required="required"> <br>
			<%
			} else {
			%>
			<span class="labelspan">Giá nhập:</span> <input class="input" name="gianhap"
				type="text" value="" placeholder="Nhập giá nhập" required="required"> <br>
			<%
			}
			%>
		</div>
	
		<div class="form-row">
			<%
			if (request.getAttribute("giacu") != null) {
			%>
			<span class="labelspan">Giá bán:</span> <input class="input" name="giacu"
				type="text" value="<%=request.getAttribute("giacu")%>"
				placeholder="Nhập giá" required="required"> <br>
			<%
			} else {
			%>
			<span class="labelspan">Giá bán:</span> <input class="input" name="giacu"
				type="text" value="" placeholder="Nhập giá" required="required"> <br>
			<%
			}
			%>
		</div>
		<div class="form-row">
			<%
			if (request.getAttribute("giamoi") != null) {
			%>
			<span class="labelspan">Giảm giá:</span> <input class="input"
				name="giamoi" type="text"
				value="<%=request.getAttribute("giamoi")%>"
				placeholder="Nhập Giảm giá" required="required"> <br>
			<%
			} else {
			%>
			<span class="labelspan">Giảm giá:</span> <input class="input"
				name="giamoi" type="text" value="" placeholder="Nhập Giảm giá" required="required">
			<br>
			<%
			}
			%>
		</div>
		<div class="text-center">
			<img id="previewImg" style="width: 50px;" alt=""
				src="<%=request.getAttribute("anh")%>">
			<div style="position: relative; display: inline-block;">
				<p>Chọn ảnh</p>
				<input name="anh" type="file" multiple required="required" onchange="previewImage(event)">
			</div>
		</div>
		<script>
		    function previewImage(event) {
		      var reader = new FileReader();
		      reader.onload = function() {
		        var output = document.getElementById('previewImg');
		        output.src = reader.result;
		      }
		      reader.readAsDataURL(event.target.files[0]);
		    }
		  </script>
		<br>
		<div class="form-row">
			<%
			if (request.getAttribute("hang") != null) {
			%>
			<span class="labelspan">Thương hiệu:</span><input class="input" name="hang"
				type="text" value="<%=request.getAttribute("hang")%>"
				placeholder="Nhập thương hiệu" required="required"> <br>
			<%
			} else {
			%>
			<span class="labelspan">Thương hiệu:</span> <input class="input" name="hang"
				type="text" value="" placeholder="Nhập thương hiệu" required="required"> <br>
			<%
			}
			%>
		</div>
		<div class = "form-row">
			<span>Chọn danh mục:</span>
			<%ArrayList<loaispbean> dsloai = (ArrayList<loaispbean>) request.getAttribute("dsloai");%>
			<select name="maloai" 
			style="border: 2px solid #46789; cursor: pointer;width:100%; border-radius: 5px; margin: 5px 0px 5px 20px; padding: 5px; background-color: #f5f5f5; color: black; font-weight: bold;" name="loai">
				    <%
				    if (dsloai != null) {
				    	int n = dsloai.size();
				        for (int i = 0; i < n; i++) {
				            loaispbean ds = dsloai.get(i);
				    %>
				    <option  value="<%= ds.getMaLoai() %>"><%= ds.getTenLoai() %></option>
				    <%
				        }
				    }
				    %>
				</select>
		</div>
		 <div class="form-row">
			<%
			if (request.getAttribute("mota") != null) {
			%>
			<span class="labelspan">Mô tả sản phẩm:</span> <input class="input"
				class="input" name="mota" type="text"
				value="<%=request.getAttribute("mota")%>"
				placeholder="Nhập mô tả" required="required"> <br>
			<%
			} else {
			%>
			<span class="labelspan">Mô tả sản phẩm:</span> <input class="input"
				name="mota" type="text" value="" placeholder="Nhập mô tả" required="required">
			<br>
			<%
			}
			%>
		</div> 
		 <div style="display: none" class="form-row">
			<%
			if (request.getAttribute("ngaynhap") != null) {
			%>
			<span class="labelspan">Ngày nhập:</span> <input class="input"
				class="input" name="ngaynhap" type="text"
				value="<%=request.getAttribute("ngaynhap")%>"
				placeholder="Nhập ngày"> <br>
			<%
			} else {
			%>
			<span class="labelspan">Ngày nhập:</span> <input class="input"
				name="ngaynhap" type="text" value="" placeholder="Nhập ngày">
			<br>
			<%
			}
			%>
		</div> 
		<div class = "text-center">
			<input name="butchon" type="submit" value="Thêm sản phẩm " 
				style="width: 150px; height: 45px; background-color: #446879; color: #fff; font-weight: bold; outline: none; border: 2px solid #ccc; border-radius: 10px; margin-right: 15px">
		</div>
	</div>	
		</form>
		
		 <p class="text-center" style="margin-top: 20px; font-size: 30px">Danh sách các sản phẩm</p>
		 <div class="container">
			    <h1 class="text-center">Tìm kiếm danh mục</h1>
			    <div class="row justify-content-center">
			        <div class="col-md-6">
			            <form action="adminsanphamcontroller" method="get">
			                <div class="form-group">
			                    <input class="form-control" name="key" type="text" placeholder="Nhập từ khóa tìm kiếm" required="required">
			                </div>
			                <div class="form-group text-center">
			                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
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
					<!-- 	<button type="button" class="close" data-dismiss="modal">&times;</button> -->
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
						<select id="loaiSelectmd" name="maloai" style="border: 2px solid #446789; width:100%; cursor: pointer; border-radius: 5px; margin: 5px 0px 5px 0px; padding: 5px; background-color: #f5f5f5; color: black; font-weight: bold;">
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
                            <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
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
          <div class="pagination">
        <%
            int currentPage = (int) request.getAttribute("currentPage");
            int totalPages = (int) request.getAttribute("totalPages");
            String keyword = request.getParameter("key");

            String queryParams = "";
            if (keyword != null) queryParams += "&key=" + keyword;

            if (currentPage > 1) {
        %>
        <a href="adminsanphamcontroller?page=<%= currentPage - 1 %><%= queryParams %>">&laquo; Quay lại</a>
        <% 
            }
            for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="adminsanphamcontroller?page=<%= i %><%= queryParams %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
        <% 
            }
            if (currentPage < totalPages) {
        %>
        <a href="adminsanphamcontroller?page=<%= currentPage + 1 %><%= queryParams %>">Tiếp theo &raquo;</a>
        <% } %>
    </div>	
    </div>
            </div>
          </div>
         </div>
	
		
		

	<%-- <p class="text-center" style="margin-top: 20px; font-size: 30px">Danh
		sách các sản phẩm</p>
<div style="border: 2px solid #446789; padding: 20px;margin: 20px;border-radius: 20px">
	<table class="table table-hover text-center" style="border: 1px solid #ccc;">
		<tr style="background-color: #446879;text-align: center; color: #fff">
			<th>Mã sản phẩm</th>
			<th style="text-align: center;">Tên sản phẩm</th>
			<th>Giá</th>
			<th>Giảm giá</th>
			<th>Ảnh</th>
			<th>Nút kích thước</th>
			<th>Thêm ảnh</th>
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
		
	
		<tr style="font-weight: bold;">
			<td><%=loai.getMaSanPham()%></td>
			<td><%=loai.getTenSanPham()%></td>
			<td><%=loai.getGia()%>đ</td>
			<td><%=loai.getChiecKhau()%>%</td>
			<td><img style="width: 40px;" alt="" src="<%=loai.getAnh()%>">
			</td>
				<td><a
				href="adminCapNhatSizeController?msp=<%=loai.getMaSanPham()%>&tsp=<%=loai.getTenSanPham()%>&sl=<%=loai.getSoLuong()%>
		&giacu=<%=loai.getGia()%>&giamoi=<%=loai.getChiecKhau()%>&anh=<%=loai.getAnh()%>&maloai=<%=loai.getMaLoai()%>
		&hang=<%=loai.getHang()%>&ngaynhap=<%=loai.getNgayNhap()%>&mota=<%=loai.getMoTaSanPham() %>"
				style="border: 1px solid #ccc; padding: 7px; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;">
				<i class="fa-solid fa-pen-ruler"></i> </a></td>
			
					<td><a href="adminThemAnhController?masp=<%=loai.getMaSanPham()%>&tsp=<%=loai.getTenSanPham()%>&sl=<%=loai.getSoLuong()%>
		&giacu=<%=loai.getGia()%>&giamoi=<%=loai.getChiecKhau()%>&anh=<%=loai.getAnh()%>&maloai=<%=loai.getMaLoai()%>
		&hang=<%=loai.getHang()%>&ngaynhap=<%=loai.getNgayNhap()%>&mota=<%=loai.getMoTaSanPham() %>"
		style="border: 1px solid #ccc; padding: 7px; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;">
		<i class="fa-solid fa-camera"></i></a></td>
		<td>
		<a data-toggle="modal"
				data-target="#myModal<%=loai.getMaSanPham()%>"
				style=" border: 1px solid #ccc; padding: 7px; border-radius: 10px;cursor:pointer; background-color: #446879; color: #fff; font-weight: bold;">
				<i class="fa-solid fa-pen-to-square"></i> </a>
			</td>	
			<td><a 
				data-toggle="modal" data-target="#myModalXoa<%=loai.getMaSanPham()%>" 
				style="border: 1px solid #ccc;cursor:pointer; padding: 7px; border-radius: 10px; background-color: #446879; color: #fff; font-weight: bold;">
					<i class="fa-solid fa-trash-can"></i>
			</a></td>
			 <!-- Modal xóa -->
	<div class="container">
  <div class="modal fade" id="myModalXoa<%=loai.getMaSanPham()%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Thông báo xóa</h4>
        </div>
        <div class="modal-body text-center">
          <h2 style="margin-bottom: 35px">Bạn có chắc chắn muốn xóa sản phẩm này?</h2>
          <div style="margin-bottom: 20px "> 
          	<a style="border: 1px solid red;border-radius:20px;text-decoration:none; background-color:red;color:white;font-size:18px;font-weight:bold; padding: 10px 40px;margin-right: 20px " href="adminsanphamcontroller?mspx=<%=loai.getMaSanPham()%>&tab=xoa">Có</a>
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
		</tr>
		<%
		}
		%>
	</table>
</div> --%>
</body>
</html>